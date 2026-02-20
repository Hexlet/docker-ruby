# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::TasksTest < DockerEngineRuby::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.tasks.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.tasks.inspect_("id")

    assert_pattern do
      response => DockerEngineRuby::Task
    end

    assert_pattern do
      response => {
        assigned_generic_resources: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task::AssignedGenericResource]) | nil,
        created_at: Time | nil,
        desired_state: DockerEngineRuby::Task::DesiredState | nil,
        id: String | nil,
        job_iteration: DockerEngineRuby::Task::JobIteration | nil,
        labels: ^(DockerEngineRuby::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        node_id: String | nil,
        service_id: String | nil,
        slot: Integer | nil,
        spec: DockerEngineRuby::TaskSpec | nil,
        status: DockerEngineRuby::Task::Status | nil,
        updated_at: Time | nil,
        version: DockerEngineRuby::Task::Version | nil
      }
    end
  end

  def test_logs
    skip("Prism doesn't support application/octet-stream responses")

    response = @docker.tasks.logs("id")

    assert_pattern do
      response => StringIO
    end
  end
end
