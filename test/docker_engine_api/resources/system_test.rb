# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::SystemTest < DockerEngineAPI::Test::ResourceTest
  def test_data_usage
    skip("Prism tests are disabled")

    response = @docker.system_.data_usage

    assert_pattern do
      response => DockerEngineAPI::Models::SystemDataUsageResponse
    end

    assert_pattern do
      response => {
        build_cache_disk_usage: DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage | nil,
        containers_disk_usage: DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage | nil,
        images_disk_usage: DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage | nil,
        volumes_disk_usage: DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage | nil
      }
    end
  end

  def test_events
    skip("Prism tests are disabled")

    response = @docker.system_.events

    assert_pattern do
      response => DockerEngineAPI::Models::SystemEventsResponse
    end

    assert_pattern do
      response => {
        action: String | nil,
        actor: DockerEngineAPI::Models::SystemEventsResponse::Actor | nil,
        scope: DockerEngineAPI::Models::SystemEventsResponse::Scope | nil,
        time: Integer | nil,
        time_nano: Integer | nil,
        type: DockerEngineAPI::Models::SystemEventsResponse::Type | nil
      }
    end
  end

  def test_info
    skip("Prism tests are disabled")

    response = @docker.system_.info

    assert_pattern do
      response => DockerEngineAPI::Info
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        cdi_spec_dirs: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil,
        cgroup_driver: DockerEngineAPI::Info::CgroupDriver | nil,
        cgroup_version: DockerEngineAPI::Info::CgroupVersion | nil,
        containerd: DockerEngineAPI::Info::Containerd | nil,
        containerd_commit: DockerEngineAPI::Info::ContainerdCommit | nil,
        containers: Integer | nil,
        containers_paused: Integer | nil,
        containers_running: Integer | nil,
        containers_stopped: Integer | nil,
        cpu_cfs_period: DockerEngineAPI::Internal::Type::Boolean | nil,
        cpu_cfs_quota: DockerEngineAPI::Internal::Type::Boolean | nil,
        cpu_set: DockerEngineAPI::Internal::Type::Boolean | nil,
        cpu_shares: DockerEngineAPI::Internal::Type::Boolean | nil,
        debug: DockerEngineAPI::Internal::Type::Boolean | nil,
        default_address_pools: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::DefaultAddressPool]) | nil,
        default_runtime: String | nil,
        discovered_devices: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::DiscoveredDevice]) | nil,
        docker_root_dir: String | nil,
        driver: String | nil,
        driver_status: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Internal::Type::ArrayOf[String]]) | nil,
        experimental_build: DockerEngineAPI::Internal::Type::Boolean | nil,
        firewall_backend: DockerEngineAPI::Info::FirewallBackend | nil,
        generic_resources: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::GenericResource]) | nil,
        http_proxy: String | nil,
        https_proxy: String | nil,
        id: String | nil,
        images: Integer | nil,
        index_server_address: String | nil,
        init_binary: String | nil,
        init_commit: DockerEngineAPI::Info::InitCommit | nil,
        i_pv4_forwarding: DockerEngineAPI::Internal::Type::Boolean | nil,
        isolation: DockerEngineAPI::Info::Isolation | nil,
        kernel_version: String | nil,
        labels: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil,
        live_restore_enabled: DockerEngineAPI::Internal::Type::Boolean | nil,
        logging_driver: String | nil,
        memory_limit: DockerEngineAPI::Internal::Type::Boolean | nil,
        mem_total: Integer | nil,
        name: String | nil,
        ncpu: Integer | nil,
        n_events_listener: Integer | nil,
        n_fd: Integer | nil,
        n_goroutines: Integer | nil,
        no_proxy: String | nil,
        nri: DockerEngineAPI::Info::Nri | nil,
        oom_kill_disable: DockerEngineAPI::Internal::Type::Boolean | nil,
        operating_system: String | nil,
        os_type: String | nil,
        os_version: String | nil,
        pids_limit: DockerEngineAPI::Internal::Type::Boolean | nil,
        plugins: DockerEngineAPI::Info::Plugins | nil,
        product_license: String | nil,
        registry_config: DockerEngineAPI::Info::RegistryConfig | nil,
        runc_commit: DockerEngineAPI::Info::RuncCommit | nil,
        runtimes: ^(DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Info::Runtime]) | nil,
        security_options: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil,
        server_version: String | nil,
        swap_limit: DockerEngineAPI::Internal::Type::Boolean | nil,
        swarm: DockerEngineAPI::Info::Swarm | nil,
        system_time: String | nil,
        warnings: ^(DockerEngineAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_ping
    skip("Prism tests are disabled")

    response = @docker.system_.ping

    assert_pattern do
      response => String
    end
  end

  def test_version
    skip("Prism tests are disabled")

    response = @docker.system_.version

    assert_pattern do
      response => DockerEngineAPI::Version
    end

    assert_pattern do
      response => {
        api_version: String | nil,
        arch: String | nil,
        build_time: String | nil,
        components: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Version::Component]) | nil,
        experimental: DockerEngineAPI::Internal::Type::Boolean | nil,
        git_commit: String | nil,
        go_version: String | nil,
        kernel_version: String | nil,
        min_api_version: String | nil,
        os: String | nil,
        platform: DockerEngineAPI::Version::Platform | nil,
        version: String | nil
      }
    end
  end
end
