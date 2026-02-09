# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::VolumesTest < Docker::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.volumes.create(create_request: {})

    assert_pattern do
      response => Docker::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(Docker::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(Docker::Internal::Type::HashOf[String]),
        scope: Docker::Volume::Scope,
        cluster_volume: Docker::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(Docker::Internal::Type::HashOf[Docker::Internal::Type::Unknown]) | nil,
        usage_data: Docker::Volume::UsageData | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.volumes.list

    assert_pattern do
      response => Docker::Models::VolumeListResponse
    end

    assert_pattern do
      response => {
        volumes: ^(Docker::Internal::Type::ArrayOf[Docker::Volume]) | nil,
        warnings: ^(Docker::Internal::Type::ArrayOf[String]) | nil
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
      response => Docker::Volume
    end

    assert_pattern do
      response => {
        driver: String,
        labels: ^(Docker::Internal::Type::HashOf[String]),
        mountpoint: String,
        name: String,
        options: ^(Docker::Internal::Type::HashOf[String]),
        scope: Docker::Volume::Scope,
        cluster_volume: Docker::Volume::ClusterVolume | nil,
        created_at: String | nil,
        status: ^(Docker::Internal::Type::HashOf[Docker::Internal::Type::Unknown]) | nil,
        usage_data: Docker::Volume::UsageData | nil
      }
    end
  end
end
