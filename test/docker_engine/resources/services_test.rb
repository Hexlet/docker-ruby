# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::ServicesTest < DockerEngine::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.services.create(spec: {})

    assert_pattern do
      response => DockerEngine::CreateResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        warnings: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.services.update("id", version: 0, spec: {})

    assert_pattern do
      response => DockerEngine::UpdateResponse
    end

    assert_pattern do
      response => {
        warnings: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.services.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Service])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.services.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.services.inspect_("id")

    assert_pattern do
      response => DockerEngine::Service
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        endpoint: DockerEngine::Service::Endpoint | nil,
        id: String | nil,
        job_status: DockerEngine::Service::JobStatus | nil,
        service_status: DockerEngine::Service::ServiceStatus | nil,
        spec: DockerEngine::Spec | nil,
        updated_at: String | nil,
        update_status: DockerEngine::Service::UpdateStatus | nil,
        version: DockerEngine::Service::Version | nil
      }
    end
  end

  def test_logs
    skip("Prism tests are disabled")

    response = @docker.services.logs("id")

    assert_pattern do
      response => StringIO
    end
  end
end
