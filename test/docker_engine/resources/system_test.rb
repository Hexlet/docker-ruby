# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::SystemTest < DockerEngine::Test::ResourceTest
  def test_info
    skip("Prism tests are disabled")

    response = @docker.system_.info

    assert_pattern do
      response => DockerEngine::Models::SystemInfoResponse
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        cdi_spec_dirs: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        cgroup_driver: DockerEngine::Models::SystemInfoResponse::CgroupDriver | nil,
        cgroup_version: DockerEngine::Models::SystemInfoResponse::CgroupVersion | nil,
        containerd: DockerEngine::Models::SystemInfoResponse::Containerd | nil,
        containerd_commit: DockerEngine::Models::SystemInfoResponse::ContainerdCommit | nil,
        containers: Integer | nil,
        containers_paused: Integer | nil,
        containers_running: Integer | nil,
        containers_stopped: Integer | nil,
        cpu_cfs_period: DockerEngine::Internal::Type::Boolean | nil,
        cpu_cfs_quota: DockerEngine::Internal::Type::Boolean | nil,
        cpu_set: DockerEngine::Internal::Type::Boolean | nil,
        cpu_shares: DockerEngine::Internal::Type::Boolean | nil,
        debug: DockerEngine::Internal::Type::Boolean | nil,
        default_address_pools: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::SystemInfoResponse::DefaultAddressPool]) | nil,
        default_runtime: String | nil,
        discovered_devices: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::SystemInfoResponse::DiscoveredDevice]) | nil,
        docker_root_dir: String | nil,
        driver: String | nil,
        driver_status: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::ArrayOf[String]]) | nil,
        experimental_build: DockerEngine::Internal::Type::Boolean | nil,
        firewall_backend: DockerEngine::Models::SystemInfoResponse::FirewallBackend | nil,
        generic_resources: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::SystemInfoResponse::GenericResource]) | nil,
        http_proxy: String | nil,
        https_proxy: String | nil,
        id: String | nil,
        images: Integer | nil,
        index_server_address: String | nil,
        init_binary: String | nil,
        init_commit: DockerEngine::Models::SystemInfoResponse::InitCommit | nil,
        i_pv4_forwarding: DockerEngine::Internal::Type::Boolean | nil,
        isolation: DockerEngine::Models::SystemInfoResponse::Isolation | nil,
        kernel_version: String | nil,
        labels: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        live_restore_enabled: DockerEngine::Internal::Type::Boolean | nil,
        logging_driver: String | nil,
        memory_limit: DockerEngine::Internal::Type::Boolean | nil,
        mem_total: Integer | nil,
        name: String | nil,
        ncpu: Integer | nil,
        n_events_listener: Integer | nil,
        n_fd: Integer | nil,
        n_goroutines: Integer | nil,
        no_proxy: String | nil,
        nri: DockerEngine::Models::SystemInfoResponse::Nri | nil,
        oom_kill_disable: DockerEngine::Internal::Type::Boolean | nil,
        operating_system: String | nil,
        os_type: String | nil,
        os_version: String | nil,
        pids_limit: DockerEngine::Internal::Type::Boolean | nil,
        plugins: DockerEngine::Models::SystemInfoResponse::Plugins | nil,
        product_license: String | nil,
        registry_config: DockerEngine::Models::SystemInfoResponse::RegistryConfig | nil,
        runc_commit: DockerEngine::Models::SystemInfoResponse::RuncCommit | nil,
        runtimes: ^(DockerEngine::Internal::Type::HashOf[DockerEngine::Models::SystemInfoResponse::Runtime]) | nil,
        security_options: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        server_version: String | nil,
        swap_limit: DockerEngine::Internal::Type::Boolean | nil,
        swarm: DockerEngine::Models::SystemInfoResponse::Swarm | nil,
        system_time: String | nil,
        warnings: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
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
      response => DockerEngine::Models::SystemVersionResponse
    end

    assert_pattern do
      response => {
        api_version: String | nil,
        arch: String | nil,
        build_time: String | nil,
        components: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::SystemVersionResponse::Component]) | nil,
        experimental: DockerEngine::Internal::Type::Boolean | nil,
        git_commit: String | nil,
        go_version: String | nil,
        kernel_version: String | nil,
        min_api_version: String | nil,
        os: String | nil,
        platform: DockerEngine::Models::SystemVersionResponse::Platform | nil,
        version: String | nil
      }
    end
  end
end
