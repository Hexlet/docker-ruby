# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::ProgressStreamModelTest < Minitest::Test
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

  def test_build_yields_each_progress_message
    stub_stream(
      :post,
      "http://localhost/build",
      [
        {stream: "Step 1/1 : FROM alpine"},
        {aux: {ID: "sha256:abc"}},
        {stream: "Successfully built abc\n"}
      ]
    )
    messages = []

    client.images.build(body: "tar") { messages << _1 }

    assert_equal(["Step 1/1 : FROM alpine", nil, "Successfully built abc\n"], messages.map(&:stream))
    assert_equal("sha256:abc", messages[1].aux.id)
  end

  def test_build_raises_on_error_inside_the_stream
    stub_stream(
      :post,
      "http://localhost/build",
      [
        {stream: "Step 2/2 : RUN exit 3"},
        {error: "exit code: 3", errorDetail: {code: 3, message: "exit code: 3"}}
      ]
    )

    error = assert_raises(DockerEngineRuby::Errors::StreamError) { client.images.build(body: "tar") }

    assert_equal("exit code: 3", error.message)
    assert_equal(3, error.detail&.code)
  end

  def test_pull_without_block_reads_the_stream_to_the_end
    stub_stream(
      :post,
      "http://localhost/images/create?fromImage=alpine",
      [
        {status: "Pulling from library/alpine", id: "3.20"},
        {status: "Status: Image is up to date for alpine:3.20"}
      ]
    )

    assert_nil(client.images.pull(body: "", from_image: "alpine"))
  end

  def test_aux_is_read_as_the_variant_that_fits
    trace = DockerEngineRuby::Internal::Type::Converter.coerce(DockerEngineRuby::BuildInfo, {aux: "c3RhdHVz"})
    image = DockerEngineRuby::Internal::Type::Converter.coerce(DockerEngineRuby::BuildInfo, {aux: {ID: "sha256:abc"}})

    assert_equal("c3RhdHVz", trace.aux)
    assert_equal("sha256:abc", image.aux.id)
  end

  private

  def client = DockerEngineRuby::Client.new(base_url: "http://localhost", max_retries: 0)

  def stub_stream(method, url, messages)
    body = messages.map { "#{JSON.generate(_1)}\r\n" }.join
    stub_request(method, url).to_return(
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: body
    )
  end
end
