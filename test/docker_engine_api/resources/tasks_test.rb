# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::TasksTest < DockerEngineAPI::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.tasks.list

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Task])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.tasks.inspect_("id")

    assert_pattern do
      response => DockerEngineAPI::Task
    end

    assert_pattern do
      response => {
        assigned_generic_resources: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Task::AssignedGenericResource]) | nil,
        created_at: String | nil,
        desired_state: DockerEngineAPI::Task::DesiredState | nil,
        id: String | nil,
        job_iteration: DockerEngineAPI::Task::JobIteration | nil,
        labels: ^(DockerEngineAPI::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        node_id: String | nil,
        service_id: String | nil,
        slot: Integer | nil,
        spec: DockerEngineAPI::Spec | nil,
        status: DockerEngineAPI::Task::Status | nil,
        updated_at: String | nil,
        version: DockerEngineAPI::Task::Version | nil
      }
    end
  end

  def test_logs
    skip("Prism tests are disabled")

    response = @docker.tasks.logs("id")

    assert_pattern do
      response => StringIO
    end
  end
end
