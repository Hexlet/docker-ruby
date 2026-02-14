# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::ContainersTest < DockerEngine::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.containers.create(config: {})

    assert_pattern do
      response => DockerEngine::CreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        warnings: ^(DockerEngine::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.containers.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary])
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
      response => DockerEngine::Container
    end

    assert_pattern do
      response => {
        app_armor_profile: String | nil,
        args: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        config: DockerEngine::Config | nil,
        created: String | nil,
        driver: String | nil,
        exec_ids: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        graph_driver: DockerEngine::Container::GraphDriver | nil,
        host_config: DockerEngine::Container::HostConfig | nil,
        hostname_path: String | nil,
        hosts_path: String | nil,
        id: String | nil,
        image: String | nil,
        image_manifest_descriptor: DockerEngine::Container::ImageManifestDescriptor | nil,
        log_path: String | nil,
        mount_label: String | nil,
        mounts: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Container::Mount]) | nil,
        name: String | nil,
        network_settings: DockerEngine::Container::NetworkSettings | nil,
        path: String | nil,
        platform: String | nil,
        process_label: String | nil,
        resolv_conf_path: String | nil,
        restart_count: Integer | nil,
        size_root_fs: Integer | nil,
        size_rw: Integer | nil,
        state: DockerEngine::Container::State | nil,
        storage: DockerEngine::Container::Storage | nil
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
