# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::ContainersTest < Docker::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.containers.create(config: {})

    assert_pattern do
      response => Docker::CreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        warnings: ^(Docker::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.containers.list

    assert_pattern do
      response => ^(Docker::Internal::Type::ArrayOf[Docker::Summary])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.containers.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.containers.inspect_("id")

    assert_pattern do
      response => Docker::Container
    end

    assert_pattern do
      response => {
        app_armor_profile: String | nil,
        args: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        config: Docker::Config | nil,
        created: String | nil,
        driver: String | nil,
        exec_ids: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        graph_driver: Docker::Container::GraphDriver | nil,
        host_config: Docker::Container::HostConfig | nil,
        hostname_path: String | nil,
        hosts_path: String | nil,
        id: String | nil,
        image: String | nil,
        image_manifest_descriptor: Docker::Container::ImageManifestDescriptor | nil,
        log_path: String | nil,
        mount_label: String | nil,
        mounts: ^(Docker::Internal::Type::ArrayOf[Docker::Container::Mount]) | nil,
        name: String | nil,
        network_settings: Docker::Container::NetworkSettings | nil,
        path: String | nil,
        platform: String | nil,
        process_label: String | nil,
        resolv_conf_path: String | nil,
        restart_count: Integer | nil,
        size_root_fs: Integer | nil,
        size_rw: Integer | nil,
        state: Docker::Container::State | nil,
        storage: Docker::Container::Storage | nil
      }
    end
  end

  def test_kill
    skip("Prism tests are disabled")

    response = @docker.containers.kill("id")

    assert_pattern do
      response => nil
    end
  end

  def test_logs
    skip("Prism tests are disabled")

    response = @docker.containers.logs("id")

    assert_pattern do
      response => StringIO
    end
  end

  def test_start
    skip("Prism tests are disabled")

    response = @docker.containers.start("id")

    assert_pattern do
      response => nil
    end
  end

  def test_stop
    skip("Prism tests are disabled")

    response = @docker.containers.stop("id")

    assert_pattern do
      response => nil
    end
  end
end
