# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::ExecTest < DockerEngineAPI::Test::ResourceTest
  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.exec_.inspect_("id")

    assert_pattern do
      response => DockerEngineAPI::Models::ExecInspectResponse
    end

    assert_pattern do
      response => {
        can_remove: DockerEngineAPI::Internal::Type::Boolean | nil,
        container_id: String | nil,
        detach_keys: String | nil,
        exit_code: Integer | nil,
        id: String | nil,
        open_stderr: DockerEngineAPI::Internal::Type::Boolean | nil,
        open_stdin: DockerEngineAPI::Internal::Type::Boolean | nil,
        open_stdout: DockerEngineAPI::Internal::Type::Boolean | nil,
        pid: Integer | nil,
        process_config: DockerEngineAPI::InspectResponse | nil,
        running: DockerEngineAPI::Internal::Type::Boolean | nil
      }
    end
  end

  def test_resize_required_params
    skip("Prism tests are disabled")

    response = @docker.exec_.resize("id", h: 0, w: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_start
    skip("Prism tests are disabled")

    response = @docker.exec_.start("id")

    assert_pattern do
      response => nil
    end
  end
end
