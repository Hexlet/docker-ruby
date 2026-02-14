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

  def test_update
    skip("Prism tests are disabled")

    response = @docker.containers.update("id")

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

  def test_archive_required_params
    skip("Prism tests are disabled")

    response = @docker.containers.archive("id", path: "path")

    assert_pattern do
      response => nil
    end
  end

  def test_attach
    skip("Prism tests are disabled")

    response = @docker.containers.attach("id")

    assert_pattern do
      response => nil
    end
  end

  def test_changes
    skip("Prism tests are disabled")

    response = @docker.containers.changes("id")

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::FilesystemChange])
    end
  end

  def test_exec_
    skip("Prism tests are disabled")

    response = @docker.containers.exec_("id")

    assert_pattern do
      response => DockerEngine::Models::ContainerExecResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_export
    skip("Prism tests are disabled")

    response = @docker.containers.export("id")

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

  def test_pause
    skip("Prism tests are disabled")

    response = @docker.containers.pause("id")

    assert_pattern do
      response => nil
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.containers.prune

    assert_pattern do
      response => DockerEngine::Models::ContainerPruneResponse
    end

    assert_pattern do
      response => {
        containers_deleted: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        space_reclaimed: Integer | nil
      }
    end
  end

  def test_rename_required_params
    skip("Prism tests are disabled")

    response = @docker.containers.rename("id", name: "name")

    assert_pattern do
      response => nil
    end
  end

  def test_resize_required_params
    skip("Prism tests are disabled")

    response = @docker.containers.resize("id", h: 0, w: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_restart
    skip("Prism tests are disabled")

    response = @docker.containers.restart("id")

    assert_pattern do
      response => nil
    end
  end

  def test_start
    skip("Prism tests are disabled")

    response = @docker.containers.start("id")

    assert_pattern do
      response => nil
    end
  end

  def test_stats
    skip("Prism tests are disabled")

    response = @docker.containers.stats("id")

    assert_pattern do
      response => DockerEngine::StatsResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        blkio_stats: DockerEngine::StatsResponse::BlkioStats | nil,
        cpu_stats: DockerEngine::StatsResponse::CPUStats | nil,
        memory_stats: DockerEngine::StatsResponse::MemoryStats | nil,
        name: String | nil,
        networks: DockerEngine::Internal::Type::Unknown | nil,
        num_procs: Integer | nil,
        os_type: String | nil,
        pids_stats: DockerEngine::StatsResponse::PidsStats | nil,
        precpu_stats: DockerEngine::StatsResponse::PrecpuStats | nil,
        preread: Time | nil,
        read: Time | nil,
        storage_stats: DockerEngine::StatsResponse::StorageStats | nil
      }
    end
  end

  def test_stop
    skip("Prism tests are disabled")

    response = @docker.containers.stop("id")

    assert_pattern do
      response => nil
    end
  end

  def test_top
    skip("Prism tests are disabled")

    response = @docker.containers.top("id")

    assert_pattern do
      response => DockerEngine::TopResponse
    end

    assert_pattern do
      response => {
        processes: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::ArrayOf[String]]) | nil,
        titles: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_unpause
    skip("Prism tests are disabled")

    response = @docker.containers.unpause("id")

    assert_pattern do
      response => nil
    end
  end

  def test_wait
    skip("Prism tests are disabled")

    response = @docker.containers.wait("id")

    assert_pattern do
      response => DockerEngine::WaitResponse
    end

    assert_pattern do
      response => {
        status_code: Integer,
        error: DockerEngine::WaitResponse::Error | nil
      }
    end
  end
end
