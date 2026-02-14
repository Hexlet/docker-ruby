# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::VolumesTest < DockerEngineAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.volumes.create(create_request: {})

    assert_pattern do
      response => DockerEngineAPI::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngineAPI::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngineAPI::Internal::Type::HashOf[String]),
        scope: DockerEngineAPI::Volume::Scope,
        cluster_volume: DockerEngineAPI::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Internal::Type::Unknown]) | nil,
        usage_data: DockerEngineAPI::Volume::UsageData | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.volumes.update("name", version: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.volumes.list

    assert_pattern do
      response => DockerEngineAPI::ListResponse
    end

    assert_pattern do
      response => {
        volumes: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Volume]) | nil,
        warnings: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.volumes.delete("name")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.volumes.inspect_("name")

    assert_pattern do
      response => DockerEngineAPI::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngineAPI::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngineAPI::Internal::Type::HashOf[String]),
        scope: DockerEngineAPI::Volume::Scope,
        cluster_volume: DockerEngineAPI::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Internal::Type::Unknown]) | nil,
        usage_data: DockerEngineAPI::Volume::UsageData | nil
      }
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.volumes.prune

    assert_pattern do
      response => DockerEngineAPI::Models::VolumePruneResponse
    end

    assert_pattern do
      response => {
        space_reclaimed: Integer | nil,
        volumes_deleted: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
