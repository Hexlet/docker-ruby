# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::VolumesTest < DockerEngine::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.volumes.create(create_request: {})

    assert_pattern do
      response => DockerEngine::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngine::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngine::Internal::Type::HashOf[String]),
        scope: DockerEngine::Volume::Scope,
        cluster_volume: DockerEngine::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(DockerEngine::Internal::Type::HashOf[DockerEngine::Internal::Type::Unknown]) | nil,
        usage_data: DockerEngine::Volume::UsageData | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.volumes.list

    assert_pattern do
      response => DockerEngine::Models::VolumeListResponse
    end

    assert_pattern do
      response => {
        volumes: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Volume]) | nil,
        warnings: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
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
      response => DockerEngine::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngine::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngine::Internal::Type::HashOf[String]),
        scope: DockerEngine::Volume::Scope,
        cluster_volume: DockerEngine::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(DockerEngine::Internal::Type::HashOf[DockerEngine::Internal::Type::Unknown]) | nil,
        usage_data: DockerEngine::Volume::UsageData | nil
      }
    end
  end
end
