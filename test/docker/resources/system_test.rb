# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::SystemTest < Docker::Test::ResourceTest
  def test_info
    skip("Prism tests are disabled")

    response = @docker.system_.info

    assert_pattern do
      response => Docker::Models::SystemInfoResponse
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        cdi_spec_dirs: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        cgroup_driver: Docker::Models::SystemInfoResponse::CgroupDriver | nil,
        cgroup_version: Docker::Models::SystemInfoResponse::CgroupVersion | nil,
        containerd: Docker::Models::SystemInfoResponse::Containerd | nil,
        containerd_commit: Docker::Models::SystemInfoResponse::ContainerdCommit | nil,
        containers: Integer | nil,
        containers_paused: Integer | nil,
        containers_running: Integer | nil,
        containers_stopped: Integer | nil,
        cpu_cfs_period: Docker::Internal::Type::Boolean | nil,
        cpu_cfs_quota: Docker::Internal::Type::Boolean | nil,
        cpu_set: Docker::Internal::Type::Boolean | nil,
        cpu_shares: Docker::Internal::Type::Boolean | nil,
        debug: Docker::Internal::Type::Boolean | nil,
        default_address_pools: ^(Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::DefaultAddressPool]) | nil,
        default_runtime: String | nil,
        discovered_devices: ^(Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::DiscoveredDevice]) | nil,
        docker_root_dir: String | nil,
        driver: String | nil,
        driver_status: ^(Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]]) | nil,
        experimental_build: Docker::Internal::Type::Boolean | nil,
        firewall_backend: Docker::Models::SystemInfoResponse::FirewallBackend | nil,
        generic_resources: ^(Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::GenericResource]) | nil,
        http_proxy: String | nil,
        https_proxy: String | nil,
        id: String | nil,
        images: Integer | nil,
        index_server_address: String | nil,
        init_binary: String | nil,
        init_commit: Docker::Models::SystemInfoResponse::InitCommit | nil,
        i_pv4_forwarding: Docker::Internal::Type::Boolean | nil,
        isolation: Docker::Models::SystemInfoResponse::Isolation | nil,
        kernel_version: String | nil,
        labels: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        live_restore_enabled: Docker::Internal::Type::Boolean | nil,
        logging_driver: String | nil,
        memory_limit: Docker::Internal::Type::Boolean | nil,
        mem_total: Integer | nil,
        name: String | nil,
        ncpu: Integer | nil,
        n_events_listener: Integer | nil,
        n_fd: Integer | nil,
        n_goroutines: Integer | nil,
        no_proxy: String | nil,
        nri: Docker::Models::SystemInfoResponse::Nri | nil,
        oom_kill_disable: Docker::Internal::Type::Boolean | nil,
        operating_system: String | nil,
        os_type: String | nil,
        os_version: String | nil,
        pids_limit: Docker::Internal::Type::Boolean | nil,
        plugins: Docker::Models::SystemInfoResponse::Plugins | nil,
        product_license: String | nil,
        registry_config: Docker::Models::SystemInfoResponse::RegistryConfig | nil,
        runc_commit: Docker::Models::SystemInfoResponse::RuncCommit | nil,
        runtimes: ^(Docker::Internal::Type::HashOf[Docker::Models::SystemInfoResponse::Runtime]) | nil,
        security_options: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        server_version: String | nil,
        swap_limit: Docker::Internal::Type::Boolean | nil,
        swarm: Docker::Models::SystemInfoResponse::Swarm | nil,
        system_time: String | nil,
        warnings: ^(Docker::Internal::Type::ArrayOf[String]) | nil
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
      response => Docker::Models::SystemVersionResponse
    end

    assert_pattern do
      response => {
        api_version: String | nil,
        arch: String | nil,
        build_time: String | nil,
        components: ^(Docker::Internal::Type::ArrayOf[Docker::Models::SystemVersionResponse::Component]) | nil,
        experimental: Docker::Internal::Type::Boolean | nil,
        git_commit: String | nil,
        go_version: String | nil,
        kernel_version: String | nil,
        min_api_version: String | nil,
        os: String | nil,
        platform: Docker::Models::SystemVersionResponse::Platform | nil,
        version: String | nil
      }
    end
  end
end
