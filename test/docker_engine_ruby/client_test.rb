# frozen_string_literal: true

require_relative "test_helper"
require "tmpdir"

class DockerEngineRubyTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_raises_on_unknown_environment
    e = assert_raises(ArgumentError) do
      DockerEngineRuby::Client.new(environment: "wrong")
    end
    assert_match(/environment must be one of/, e.message)
  end

  def test_client_accepts_tls_paths
    with_tls_files do |ca_path:, cert_path:, key_path:|
      docker =
        DockerEngineRuby::Client.new(
          base_url: "https://localhost:2376",
          tls_ca_cert_path: ca_path,
          tls_client_cert_path: cert_path,
          tls_client_key_path: key_path
        )

      assert_equal(ca_path, docker.tls_ca_cert_path)
      assert_equal(cert_path, docker.tls_client_cert_path)
      assert_equal(key_path, docker.tls_client_key_path)
    end
  end

  def test_client_raises_when_only_one_client_tls_file_is_provided
    e =
      assert_raises(ArgumentError) do
        DockerEngineRuby::Client.new(base_url: "https://localhost:2376", tls_client_cert_path: "/tmp/cert.pem")
      end

    assert_match(/must be provided together/, e.message)
  end

  def test_client_builds_requester_with_tls_materials
    with_tls_files do |ca_path:, cert_path:, key_path:|
      docker =
        DockerEngineRuby::Client.new(
          base_url: "https://localhost:2376",
          tls_ca_cert_path: ca_path,
          tls_client_cert_path: cert_path,
          tls_client_key_path: key_path
        )

      requester = docker.requester
      cert = requester.instance_variable_get(:@tls_cert)
      key = requester.instance_variable_get(:@tls_key)

      refute_nil(cert)
      refute_nil(key)
      assert_equal(OpenSSL::X509::Certificate, cert.class)
    end
  end

  def test_client_default_request_default_retry_attempts
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list
    end

    assert_requested(:any, /./, times: 3)
  end

  def test_client_given_request_default_retry_attempts
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 3)

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_default_request_given_retry_attempts
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list(request_options: {max_retries: 3})
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_given_request_given_retry_attempts
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 3)

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list(request_options: {max_retries: 4})
    end

    assert_requested(:any, /./, times: 5)
  end

  def test_client_retry_after_seconds
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 500,
      headers: {"retry-after" => "1.3"},
      body: {}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 1)

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_client_retry_after_date
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 500,
      headers: {"retry-after" => (Time.now + 10).httpdate},
      body: {}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 1)

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      Thread.current.thread_variable_set(:time_now, Time.now)
      docker.containers.list
      Thread.current.thread_variable_set(:time_now, nil)
    end

    assert_requested(:any, /./, times: 2)
    assert_in_delta(10, Thread.current.thread_variable_get(:mock_sleep).last, 1.0)
  end

  def test_client_retry_after_ms
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 500,
      headers: {"retry-after-ms" => "1300"},
      body: {}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 1)

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_retry_count_header
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list
    end

    3.times do
      assert_requested(:any, /./, headers: {"x-stainless-retry-count" => _1})
    end
  end

  def test_omit_retry_count_header
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list(request_options: {extra_headers: {"x-stainless-retry-count" => nil}})
    end

    assert_requested(:any, /./, times: 3) do
      refute_includes(_1.headers.keys.map(&:downcase), "x-stainless-retry-count")
    end
  end

  def test_overwrite_retry_count_header
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 500, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::InternalServerError) do
      docker.containers.list(request_options: {extra_headers: {"x-stainless-retry-count" => "42"}})
    end

    assert_requested(:any, /./, headers: {"x-stainless-retry-count" => "42"}, times: 3)
  end

  def test_client_redirect_307
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::APIConnectionError) do
      docker.containers.list(request_options: {extra_headers: {}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first

    assert_requested(:any, "http://localhost/redirected", times: DockerEngineRuby::Client::MAX_REDIRECTS) do
      assert_equal(recorded.method, _1.method)
      assert_equal(recorded.body, _1.body)
      assert_equal(
        recorded.headers.transform_keys(&:downcase).fetch("content-type"),
        _1.headers.transform_keys(&:downcase).fetch("content-type")
      )
    end
  end

  def test_client_redirect_303
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 303,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:get, "http://localhost/redirected").to_return(
      status: 303,
      headers: {"location" => "/redirected"}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::APIConnectionError) do
      docker.containers.list(request_options: {extra_headers: {}})
    end

    assert_requested(:get, "http://localhost/redirected", times: DockerEngineRuby::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "content-type")
      assert_nil(_1.body)
    end
  end

  def test_client_redirect_auth_keep_same_origin
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::APIConnectionError) do
      docker.containers.list(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first
    auth_header = recorded.headers.transform_keys(&:downcase).fetch("authorization")

    assert_equal("Bearer xyz", auth_header)
    assert_requested(:any, "http://localhost/redirected", times: DockerEngineRuby::Client::MAX_REDIRECTS) do
      auth_header = _1.headers.transform_keys(&:downcase).fetch("authorization")
      assert_equal("Bearer xyz", auth_header)
    end
  end

  def test_client_redirect_auth_strip_cross_origin
    stub_request(:get, "http://localhost/containers/json").to_return_json(
      status: 307,
      headers: {"location" => "https://example.com/redirected"},
      body: {}
    )
    stub_request(:any, "https://example.com/redirected").to_return(
      status: 307,
      headers: {"location" => "https://example.com/redirected"}
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    assert_raises(DockerEngineRuby::Errors::APIConnectionError) do
      docker.containers.list(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    assert_requested(
      :any,
      "https://example.com/redirected",
      times: DockerEngineRuby::Client::MAX_REDIRECTS
    ) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "authorization")
    end
  end

  def test_images_pull_with_json_lines_response_returns_nil
    stub_request(:post, "http://localhost/images/create").to_return(
      status: 200,
      headers: {"content-type" => "application/json"},
      body: "{\"status\":\"Pulling from library/alpine\"}\n{\"status\":\"Digest: sha256:abc\"}\n"
    )

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    response = docker.images.pull(body: "body")

    assert_nil(response)
  end

  def test_non_redirect_304_is_treated_as_status_error
    stub_request(:post, "http://localhost/containers/id/start").to_return(status: 304, body: "")

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    error = assert_raises(DockerEngineRuby::Errors::APIStatusError) do
      docker.containers.start("id")
    end

    assert_equal(304, error.status)
  end

  def test_default_headers
    stub_request(:get, "http://localhost/containers/json").to_return_json(status: 200, body: {})

    docker = DockerEngineRuby::Client.new(base_url: "http://localhost")

    docker.containers.list

    assert_requested(:any, /./) do |req|
      headers = req.headers.transform_keys(&:downcase).fetch_values("accept", "content-type")
      headers.each { refute_empty(_1) }
    end
  end

  private def with_tls_files
    Dir.mktmpdir("docker-ruby-tls") do |dir|
      key = OpenSSL::PKey::RSA.new(2048)
      cert = OpenSSL::X509::Certificate.new
      cert.version = 2
      cert.serial = 1
      cert.subject = OpenSSL::X509::Name.parse("/CN=localhost")
      cert.issuer = cert.subject
      cert.public_key = key.public_key
      cert.not_before = Time.now
      cert.not_after = Time.now + 3600

      extension_factory = OpenSSL::X509::ExtensionFactory.new
      extension_factory.subject_certificate = cert
      extension_factory.issuer_certificate = cert
      cert.add_extension(extension_factory.create_extension("basicConstraints", "CA:TRUE", true))
      cert.add_extension(extension_factory.create_extension("keyUsage", "keyCertSign,digitalSignature", true))
      cert.sign(key, OpenSSL::Digest.new("SHA256"))

      ca_path = File.join(dir, "ca.pem")
      cert_path = File.join(dir, "cert.pem")
      key_path = File.join(dir, "key.pem")

      File.write(ca_path, cert.to_pem)
      File.write(cert_path, cert.to_pem)
      File.write(key_path, key.to_pem)

      yield(ca_path: ca_path, cert_path: cert_path, key_path: key_path)
    end
  end
end
