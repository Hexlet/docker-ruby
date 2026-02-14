# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::ServicesTest < DockerEngineAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.services.create(spec: {})

    assert_pattern do
      response => DockerEngineAPI::CreateResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        warnings: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.services.update("id", version: 0, spec: {})

    assert_pattern do
      response => DockerEngineAPI::UpdateResponse
    end

    assert_pattern do
      response => {
        warnings: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.services.list

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service])
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
      response => DockerEngineAPI::Service
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        endpoint: DockerEngineAPI::Service::Endpoint | nil,
        id: String | nil,
        job_status: DockerEngineAPI::Service::JobStatus | nil,
        service_status: DockerEngineAPI::Service::ServiceStatus | nil,
        spec: DockerEngineAPI::Spec | nil,
        updated_at: String | nil,
        update_status: DockerEngineAPI::Service::UpdateStatus | nil,
        version: DockerEngineAPI::Service::Version | nil
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
