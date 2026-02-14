# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::TasksTest < DockerEngine::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.tasks.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Task])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.tasks.inspect_("id")

    assert_pattern do
      response => DockerEngine::Task
    end

    assert_pattern do
      response => {
        assigned_generic_resources: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Task::AssignedGenericResource]) | nil,
        created_at: String | nil,
        desired_state: DockerEngine::Task::DesiredState | nil,
        id: String | nil,
        job_iteration: DockerEngine::Task::JobIteration | nil,
        labels: ^(DockerEngine::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        node_id: String | nil,
        service_id: String | nil,
        slot: Integer | nil,
        spec: DockerEngine::Spec | nil,
        status: DockerEngine::Task::Status | nil,
        updated_at: String | nil,
        version: DockerEngine::Task::Version | nil
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
