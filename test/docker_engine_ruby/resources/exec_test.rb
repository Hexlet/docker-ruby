# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::ExecTest < DockerEngineRuby::Test::ResourceTest
  def test_inspect_
    skip("Mock server tests are disabled")

    response = @docker.exec_.inspect_("id")

    assert_pattern do
      response => DockerEngineRuby::Models::ExecInspectResponse
    end

    assert_pattern do
      response => {
        can_remove: DockerEngineRuby::Internal::Type::Boolean | nil,
        container_id: String | nil,
        detach_keys: String | nil,
        exit_code: Integer | nil,
        id: String | nil,
        open_stderr: DockerEngineRuby::Internal::Type::Boolean | nil,
        open_stdin: DockerEngineRuby::Internal::Type::Boolean | nil,
        open_stdout: DockerEngineRuby::Internal::Type::Boolean | nil,
        pid: Integer | nil,
        process_config: DockerEngineRuby::InspectResponse | nil,
        running: DockerEngineRuby::Internal::Type::Boolean | nil
      }
    end
  end

  def test_resize_required_params
    skip("Mock server tests are disabled")

    response = @docker.exec_.resize("id", h: 0, w: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_start
    skip("Mock server tests are disabled")

    response = @docker.exec_.start("id")

    assert_pattern do
      response => nil
    end
  end
end
