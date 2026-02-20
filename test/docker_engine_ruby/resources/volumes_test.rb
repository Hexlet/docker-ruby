# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::VolumesTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.volumes.create(create_request: {})

    assert_pattern do
      response => DockerEngineRuby::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngineRuby::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngineRuby::Internal::Type::HashOf[String]),
        scope: DockerEngineRuby::Volume::Scope,
        cluster_volume: DockerEngineRuby::Volume::ClusterVolume | nil,
        created_at: Time | nil,
        status: ^(DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown]]) | nil,
        usage_data: DockerEngineRuby::Volume::UsageData | nil
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
      response => DockerEngineRuby::ListResponse
    end

    assert_pattern do
      response => {
        volumes: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Volume]) | nil,
        warnings: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
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
      response => DockerEngineRuby::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(DockerEngineRuby::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(DockerEngineRuby::Internal::Type::HashOf[String]),
        scope: DockerEngineRuby::Volume::Scope,
        cluster_volume: DockerEngineRuby::Volume::ClusterVolume | nil,
        created_at: Time | nil,
        status: ^(DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown]]) | nil,
        usage_data: DockerEngineRuby::Volume::UsageData | nil
      }
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.volumes.prune

    assert_pattern do
      response => DockerEngineRuby::Models::VolumePruneResponse
    end

    assert_pattern do
      response => {
        space_reclaimed: Integer | nil,
        volumes_deleted: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
