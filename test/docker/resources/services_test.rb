# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::ServicesTest < Docker::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.services.create(spec: {})

    assert_pattern do
      response => Docker::Models::ServiceCreateResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        warnings: ^(Docker::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.services.list

    assert_pattern do
      response => ^(Docker::Internal::Type::ArrayOf[Docker::Service])
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
      response => Docker::Service
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        endpoint: Docker::Service::Endpoint | nil,
        id: String | nil,
        job_status: Docker::Service::JobStatus | nil,
        service_status: Docker::Service::ServiceStatus | nil,
        spec: Docker::Spec | nil,
        updated_at: String | nil,
        update_status: Docker::Service::UpdateStatus | nil,
        version: Docker::Service::Version | nil
      }
    end
  end
end
