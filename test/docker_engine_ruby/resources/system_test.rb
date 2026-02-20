# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::SystemTest < DockerEngineRuby::Test::ResourceTest
  def test_data_usage
    skip("Mock server tests are disabled")

    response = @docker.system_.data_usage

    assert_pattern do
      response => DockerEngineRuby::Models::SystemDataUsageResponse
    end

    assert_pattern do
      response => {
        build_cache_disk_usage: DockerEngineRuby::Models::SystemDataUsageResponse::BuildCacheDiskUsage | nil,
        containers_disk_usage: DockerEngineRuby::Models::SystemDataUsageResponse::ContainersDiskUsage | nil,
        images_disk_usage: DockerEngineRuby::Models::SystemDataUsageResponse::ImagesDiskUsage | nil,
        volumes_disk_usage: DockerEngineRuby::Models::SystemDataUsageResponse::VolumesDiskUsage | nil
      }
    end
  end

  def test_events
    skip("Mock server tests are disabled")

    response = @docker.system_.events

    assert_pattern do
      response => DockerEngineRuby::Models::SystemEventsResponse
    end

    assert_pattern do
      response => {
        action: String | nil,
        actor: DockerEngineRuby::Models::SystemEventsResponse::Actor | nil,
        scope: DockerEngineRuby::Models::SystemEventsResponse::Scope | nil,
        time: Integer | nil,
        time_nano: Integer | nil,
        type: DockerEngineRuby::Models::SystemEventsResponse::Type | nil
      }
    end
  end

  def test_info
    skip("Mock server tests are disabled")

    response = @docker.system_.info

    assert_pattern do
      response => DockerEngineRuby::Info
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        cdi_spec_dirs: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        cgroup_driver: DockerEngineRuby::Info::CgroupDriver | nil,
        cgroup_version: DockerEngineRuby::Info::CgroupVersion | nil,
        containerd: DockerEngineRuby::Info::Containerd | nil,
        containerd_commit: DockerEngineRuby::Info::ContainerdCommit | nil,
        containers: Integer | nil,
        containers_paused: Integer | nil,
        containers_running: Integer | nil,
        containers_stopped: Integer | nil,
        cpu_cfs_period: DockerEngineRuby::Internal::Type::Boolean | nil,
        cpu_cfs_quota: DockerEngineRuby::Internal::Type::Boolean | nil,
        cpu_set: DockerEngineRuby::Internal::Type::Boolean | nil,
        cpu_shares: DockerEngineRuby::Internal::Type::Boolean | nil,
        debug: DockerEngineRuby::Internal::Type::Boolean | nil,
        default_address_pools: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Info::DefaultAddressPool]) | nil,
        default_runtime: String | nil,
        discovered_devices: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Info::DiscoveredDevice]) | nil,
        docker_root_dir: String | nil,
        driver: String | nil,
        driver_status: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::ArrayOf[String]]) | nil,
        experimental_build: DockerEngineRuby::Internal::Type::Boolean | nil,
        firewall_backend: DockerEngineRuby::Info::FirewallBackend | nil,
        generic_resources: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Info::GenericResource]) | nil,
        http_proxy: String | nil,
        https_proxy: String | nil,
        id: String | nil,
        images: Integer | nil,
        index_server_address: String | nil,
        init_binary: String | nil,
        init_commit: DockerEngineRuby::Info::InitCommit | nil,
        i_pv4_forwarding: DockerEngineRuby::Internal::Type::Boolean | nil,
        isolation: DockerEngineRuby::Info::Isolation | nil,
        kernel_version: String | nil,
        labels: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        live_restore_enabled: DockerEngineRuby::Internal::Type::Boolean | nil,
        logging_driver: String | nil,
        memory_limit: DockerEngineRuby::Internal::Type::Boolean | nil,
        mem_total: Integer | nil,
        name: String | nil,
        ncpu: Integer | nil,
        n_events_listener: Integer | nil,
        n_fd: Integer | nil,
        n_goroutines: Integer | nil,
        no_proxy: String | nil,
        nri: DockerEngineRuby::Info::Nri | nil,
        oom_kill_disable: DockerEngineRuby::Internal::Type::Boolean | nil,
        operating_system: String | nil,
        os_type: String | nil,
        os_version: String | nil,
        pids_limit: DockerEngineRuby::Internal::Type::Boolean | nil,
        plugins: DockerEngineRuby::Info::Plugins | nil,
        product_license: String | nil,
        registry_config: DockerEngineRuby::Info::RegistryConfig | nil,
        runc_commit: DockerEngineRuby::Info::RuncCommit | nil,
        runtimes: ^(DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Info::Runtime]) | nil,
        security_options: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        server_version: String | nil,
        swap_limit: DockerEngineRuby::Internal::Type::Boolean | nil,
        swarm: DockerEngineRuby::Info::Swarm | nil,
        system_time: String | nil,
        warnings: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_ping
    skip("Mock server tests are disabled")

    response = @docker.system_.ping

    assert_pattern do
      response => String
    end
  end

  def test_version
    skip("Mock server tests are disabled")

    response = @docker.system_.version

    assert_pattern do
      response => DockerEngineRuby::Version
    end

    assert_pattern do
      response => {
        api_version: String | nil,
        arch: String | nil,
        build_time: String | nil,
        components: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Version::Component]) | nil,
        experimental: DockerEngineRuby::Internal::Type::Boolean | nil,
        git_commit: String | nil,
        go_version: String | nil,
        kernel_version: String | nil,
        min_api_version: String | nil,
        os: String | nil,
        platform: DockerEngineRuby::Version::Platform | nil,
        version: String | nil
      }
    end
  end
end
