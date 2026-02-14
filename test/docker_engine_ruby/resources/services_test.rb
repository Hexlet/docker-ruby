# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::ServicesTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.services.create(spec: {})

    assert_pattern do
      response => DockerEngineRuby::ServiceCreateResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        warnings: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.services.update("id", version: 0, spec: {})

    assert_pattern do
      response => DockerEngineRuby::ServiceUpdateResponse
    end

    assert_pattern do
      response => {
        warnings: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.services.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Service])
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
      response => DockerEngineRuby::Service
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        endpoint: DockerEngineRuby::Service::Endpoint | nil,
        id: String | nil,
        job_status: DockerEngineRuby::Service::JobStatus | nil,
        service_status: DockerEngineRuby::Service::ServiceStatus | nil,
        spec: DockerEngineRuby::ServiceSpec | nil,
        updated_at: Time | nil,
        update_status: DockerEngineRuby::Service::UpdateStatus | nil,
        version: DockerEngineRuby::Service::Version | nil
      }
    end
  end

  def test_logs
    skip("Prism doesn't support application/octet-stream responses")

    response = @docker.services.logs("id")

    assert_pattern do
      response => StringIO
    end
  end
end
