# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::RequestBodyModelTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_container_create_sends_config_and_host_config_in_api_names
    body = sent_body(:post, "http://localhost/containers/create", {Id: "c1", Warnings: []}) do |client|
      client.containers.create(
        config: {image: "alpine", cmd: ["true"], exposed_ports: {"80/tcp" => {}}},
        host_config: {binds: ["/src:/app"], network_mode: "bridge", memory: 1024},
        name: "app"
      )
    end

    assert_equal(
      {
        "Image" => "alpine",
        "Cmd" => ["true"],
        "ExposedPorts" => {"80/tcp" => {}},
        "HostConfig" => {"Binds" => ["/src:/app"], "NetworkMode" => "bridge", "Memory" => 1024}
      },
      body
    )
  end

  def test_secret_create_sends_spec_in_api_names
    body = sent_body(:post, "http://localhost/secrets/create", {ID: "s1"}) do |client|
      client.secrets.create(spec: {name: "token", data: "c2VjcmV0"})
    end

    assert_equal({"Name" => "token", "Data" => "c2VjcmV0"}, body)
  end

  private

  def sent_body(method, url, response)
    body = nil
    stub_request(method, /#{Regexp.escape(url)}/)
      .with { body = JSON.parse(_1.body) }
      .to_return_json(status: 201, body: response)
    yield(DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 0))
    body
  end
end
