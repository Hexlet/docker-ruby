# frozen_string_literal: true

module Docker
  module Models
    class Spec < Docker::Internal::Type::BaseModel
      # @!attribute endpoint_spec
      #   Properties that can be configured to access and load balance a service.
      #
      #   @return [Docker::Models::Spec::EndpointSpec, nil]
      optional :endpoint_spec, -> { Docker::Spec::EndpointSpec }, api_name: :EndpointSpec

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute mode
      #   Scheduling mode for the service.
      #
      #   @return [Docker::Models::Spec::Mode, nil]
      optional :mode, -> { Docker::Spec::Mode }, api_name: :Mode

      # @!attribute name
      #   Name of the service.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute networks
      #   Specifies which networks the service should attach to.
      #
      #   Deprecated: This field is deprecated since v1.44. The Networks field in TaskSpec
      #   should be used instead.
      #
      #   @return [Array<Docker::Models::Spec::Network>, nil]
      optional :networks, -> { Docker::Internal::Type::ArrayOf[Docker::Spec::Network] }, api_name: :Networks

      # @!attribute rollback_config
      #   Specification for the rollback strategy of the service.
      #
      #   @return [Docker::Models::Spec::RollbackConfig, nil]
      optional :rollback_config, -> { Docker::Spec::RollbackConfig }, api_name: :RollbackConfig

      # @!attribute task_template
      #   User modifiable task configuration.
      #
      #   @return [Docker::Models::Spec::TaskTemplate, nil]
      optional :task_template, -> { Docker::Spec::TaskTemplate }, api_name: :TaskTemplate

      # @!attribute update_config
      #   Specification for the update strategy of the service.
      #
      #   @return [Docker::Models::Spec::UpdateConfig, nil]
      optional :update_config, -> { Docker::Spec::UpdateConfig }, api_name: :UpdateConfig

      # @!method initialize(endpoint_spec: nil, labels: nil, mode: nil, name: nil, networks: nil, rollback_config: nil, task_template: nil, update_config: nil)
      #   Some parameter documentations has been truncated, see {Docker::Models::Spec} for
      #   more details.
      #
      #   User modifiable configuration for a service.
      #
      #   @param endpoint_spec [Docker::Models::Spec::EndpointSpec] Properties that can be configured to access and load balance a service.
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param mode [Docker::Models::Spec::Mode] Scheduling mode for the service.
      #
      #   @param name [String] Name of the service.
      #
      #   @param networks [Array<Docker::Models::Spec::Network>] Specifies which networks the service should attach to.
      #
      #   @param rollback_config [Docker::Models::Spec::RollbackConfig] Specification for the rollback strategy of the service.
      #
      #   @param task_template [Docker::Models::Spec::TaskTemplate] User modifiable task configuration.
      #
      #   @param update_config [Docker::Models::Spec::UpdateConfig] Specification for the update strategy of the service.

      # @see Docker::Models::Spec#endpoint_spec
      class EndpointSpec < Docker::Internal::Type::BaseModel
        # @!attribute mode
        #   The mode of resolution to use for internal load balancing between tasks.
        #
        #   @return [Symbol, Docker::Models::Spec::EndpointSpec::Mode, nil]
        optional :mode, enum: -> { Docker::Spec::EndpointSpec::Mode }, api_name: :Mode

        # @!attribute ports
        #   List of exposed ports that this service is accessible on from the outside. Ports
        #   can only be provided if `vip` resolution mode is used.
        #
        #   @return [Array<Docker::Models::Spec::EndpointSpec::Port>, nil]
        optional :ports,
                 -> { Docker::Internal::Type::ArrayOf[Docker::Spec::EndpointSpec::Port] },
                 api_name: :Ports

        # @!method initialize(mode: nil, ports: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::EndpointSpec} for more details.
        #
        #   Properties that can be configured to access and load balance a service.
        #
        #   @param mode [Symbol, Docker::Models::Spec::EndpointSpec::Mode] The mode of resolution to use for internal load balancing between tasks.
        #
        #   @param ports [Array<Docker::Models::Spec::EndpointSpec::Port>] List of exposed ports that this service is accessible on from the

        # The mode of resolution to use for internal load balancing between tasks.
        #
        # @see Docker::Models::Spec::EndpointSpec#mode
        module Mode
          extend Docker::Internal::Type::Enum

          VIP = :vip
          DNSRR = :dnsrr

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Port < Docker::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute protocol
          #
          #   @return [Symbol, Docker::Models::Spec::EndpointSpec::Port::Protocol, nil]
          optional :protocol, enum: -> { Docker::Spec::EndpointSpec::Port::Protocol }, api_name: :Protocol

          # @!attribute published_port
          #   The port on the swarm hosts.
          #
          #   @return [Integer, nil]
          optional :published_port, Integer, api_name: :PublishedPort

          # @!attribute publish_mode
          #   The mode in which port is published.
          #
          #   <p><br /></p>
          #
          #   - "ingress" makes the target port accessible on every node, regardless of
          #     whether there is a task for the service running on that node or not.
          #   - "host" bypasses the routing mesh and publish the port directly on the swarm
          #     node where that service is running.
          #
          #   @return [Symbol, Docker::Models::Spec::EndpointSpec::Port::PublishMode, nil]
          optional :publish_mode,
                   enum: -> {
                     Docker::Spec::EndpointSpec::Port::PublishMode
                   },
                   api_name: :PublishMode

          # @!attribute target_port
          #   The port inside the container.
          #
          #   @return [Integer, nil]
          optional :target_port, Integer, api_name: :TargetPort

          # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::EndpointSpec::Port} for more details.
          #
          #   @param name [String]
          #
          #   @param protocol [Symbol, Docker::Models::Spec::EndpointSpec::Port::Protocol]
          #
          #   @param published_port [Integer] The port on the swarm hosts.
          #
          #   @param publish_mode [Symbol, Docker::Models::Spec::EndpointSpec::Port::PublishMode] The mode in which port is published.
          #
          #   @param target_port [Integer] The port inside the container.

          # @see Docker::Models::Spec::EndpointSpec::Port#protocol
          module Protocol
            extend Docker::Internal::Type::Enum

            TCP = :tcp
            UDP = :udp
            SCTP = :sctp

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The mode in which port is published.
          #
          # <p><br /></p>
          #
          # - "ingress" makes the target port accessible on every node, regardless of
          #   whether there is a task for the service running on that node or not.
          # - "host" bypasses the routing mesh and publish the port directly on the swarm
          #   node where that service is running.
          #
          # @see Docker::Models::Spec::EndpointSpec::Port#publish_mode
          module PublishMode
            extend Docker::Internal::Type::Enum

            INGRESS = :ingress
            HOST = :host

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see Docker::Models::Spec#mode
      class Mode < Docker::Internal::Type::BaseModel
        # @!attribute global
        #
        #   @return [Object, nil]
        optional :global, Docker::Internal::Type::Unknown, api_name: :Global

        # @!attribute global_job
        #   The mode used for services which run a task to the completed state on each valid
        #   node.
        #
        #   @return [Object, nil]
        optional :global_job, Docker::Internal::Type::Unknown, api_name: :GlobalJob

        # @!attribute replicated
        #
        #   @return [Docker::Models::Spec::Mode::Replicated, nil]
        optional :replicated, -> { Docker::Spec::Mode::Replicated }, api_name: :Replicated

        # @!attribute replicated_job
        #   The mode used for services with a finite number of tasks that run to a completed
        #   state.
        #
        #   @return [Docker::Models::Spec::Mode::ReplicatedJob, nil]
        optional :replicated_job, -> { Docker::Spec::Mode::ReplicatedJob }, api_name: :ReplicatedJob

        # @!method initialize(global: nil, global_job: nil, replicated: nil, replicated_job: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::Mode} for more details.
        #
        #   Scheduling mode for the service.
        #
        #   @param global [Object]
        #
        #   @param global_job [Object] The mode used for services which run a task to the completed state
        #
        #   @param replicated [Docker::Models::Spec::Mode::Replicated]
        #
        #   @param replicated_job [Docker::Models::Spec::Mode::ReplicatedJob] The mode used for services with a finite number of tasks that run

        # @see Docker::Models::Spec::Mode#replicated
        class Replicated < Docker::Internal::Type::BaseModel
          # @!attribute replicas
          #
          #   @return [Integer, nil]
          optional :replicas, Integer, api_name: :Replicas

          # @!method initialize(replicas: nil)
          #   @param replicas [Integer]
        end

        # @see Docker::Models::Spec::Mode#replicated_job
        class ReplicatedJob < Docker::Internal::Type::BaseModel
          # @!attribute max_concurrent
          #   The maximum number of replicas to run simultaneously.
          #
          #   @return [Integer, nil]
          optional :max_concurrent, Integer, api_name: :MaxConcurrent

          # @!attribute total_completions
          #   The total number of replicas desired to reach the Completed state. If unset,
          #   will default to the value of `MaxConcurrent`
          #
          #   @return [Integer, nil]
          optional :total_completions, Integer, api_name: :TotalCompletions

          # @!method initialize(max_concurrent: nil, total_completions: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::Mode::ReplicatedJob} for more details.
          #
          #   The mode used for services with a finite number of tasks that run to a completed
          #   state.
          #
          #   @param max_concurrent [Integer] The maximum number of replicas to run simultaneously.
          #
          #   @param total_completions [Integer] The total number of replicas desired to reach the Completed
        end
      end

      class Network < Docker::Internal::Type::BaseModel
        # @!attribute aliases
        #   Discoverable alternate names for the service on this network.
        #
        #   @return [Array<String>, nil]
        optional :aliases, Docker::Internal::Type::ArrayOf[String], api_name: :Aliases

        # @!attribute driver_opts
        #   Driver attachment options for the network target.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :driver_opts, Docker::Internal::Type::HashOf[String], api_name: :DriverOpts

        # @!attribute target
        #   The target network for attachment. Must be a network name or ID.
        #
        #   @return [String, nil]
        optional :target, String, api_name: :Target

        # @!method initialize(aliases: nil, driver_opts: nil, target: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::Network} for more details.
        #
        #   Specifies how a service should be attached to a particular network.
        #
        #   @param aliases [Array<String>] Discoverable alternate names for the service on this network.
        #
        #   @param driver_opts [Hash{Symbol=>String}] Driver attachment options for the network target.
        #
        #   @param target [String] The target network for attachment. Must be a network name or ID.
      end

      # @see Docker::Models::Spec#rollback_config
      class RollbackConfig < Docker::Internal::Type::BaseModel
        # @!attribute delay
        #   Amount of time between rollback iterations, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #   Action to take if an rolled back task fails to run, or stops running during the
        #   rollback.
        #
        #   @return [Symbol, Docker::Models::Spec::RollbackConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> { Docker::Spec::RollbackConfig::FailureAction },
                 api_name: :FailureAction

        # @!attribute max_failure_ratio
        #   The fraction of tasks that may fail during a rollback before the failure action
        #   is invoked, specified as a floating point number between 0 and 1.
        #
        #   @return [Float, nil]
        optional :max_failure_ratio, Float, api_name: :MaxFailureRatio

        # @!attribute monitor
        #   Amount of time to monitor each rolled back task for failures, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :monitor, Integer, api_name: :Monitor

        # @!attribute order
        #   The order of operations when rolling back a task. Either the old task is shut
        #   down before the new task is started, or the new task is started before the old
        #   task is shut down.
        #
        #   @return [Symbol, Docker::Models::Spec::RollbackConfig::Order, nil]
        optional :order, enum: -> { Docker::Spec::RollbackConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #   Maximum number of tasks to be rolled back in one iteration (0 means unlimited
        #   parallelism).
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::RollbackConfig} for more details.
        #
        #   Specification for the rollback strategy of the service.
        #
        #   @param delay [Integer] Amount of time between rollback iterations, in nanoseconds.
        #
        #   @param failure_action [Symbol, Docker::Models::Spec::RollbackConfig::FailureAction] Action to take if an rolled back task fails to run, or stops
        #
        #   @param max_failure_ratio [Float] The fraction of tasks that may fail during a rollback before the
        #
        #   @param monitor [Integer] Amount of time to monitor each rolled back task for failures, in
        #
        #   @param order [Symbol, Docker::Models::Spec::RollbackConfig::Order] The order of operations when rolling back a task. Either the old
        #
        #   @param parallelism [Integer] Maximum number of tasks to be rolled back in one iteration (0 means

        # Action to take if an rolled back task fails to run, or stops running during the
        # rollback.
        #
        # @see Docker::Models::Spec::RollbackConfig#failure_action
        module FailureAction
          extend Docker::Internal::Type::Enum

          CONTINUE = :continue
          PAUSE = :pause

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The order of operations when rolling back a task. Either the old task is shut
        # down before the new task is started, or the new task is started before the old
        # task is shut down.
        #
        # @see Docker::Models::Spec::RollbackConfig#order
        module Order
          extend Docker::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Docker::Models::Spec#task_template
      class TaskTemplate < Docker::Internal::Type::BaseModel
        # @!attribute container_spec
        #   Container spec for the service.
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec, nil]
        optional :container_spec, -> { Docker::Spec::TaskTemplate::ContainerSpec }, api_name: :ContainerSpec

        # @!attribute force_update
        #   A counter that triggers an update even if no relevant parameters have been
        #   changed.
        #
        #   @return [Integer, nil]
        optional :force_update, Integer, api_name: :ForceUpdate

        # @!attribute log_driver
        #   Specifies the log driver to use for tasks created from this spec. If not
        #   present, the default one for the swarm will be used, finally falling back to the
        #   engine default if not specified.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::LogDriver, nil]
        optional :log_driver, -> { Docker::Spec::TaskTemplate::LogDriver }, api_name: :LogDriver

        # @!attribute network_attachment_spec
        #   Read-only spec type for non-swarm containers attached to swarm overlay networks.
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::NetworkAttachmentSpec, nil]
        optional :network_attachment_spec,
                 -> { Docker::Spec::TaskTemplate::NetworkAttachmentSpec },
                 api_name: :NetworkAttachmentSpec

        # @!attribute networks
        #   Specifies which networks the service should attach to.
        #
        #   @return [Array<Docker::Models::Spec::TaskTemplate::Network>, nil]
        optional :networks,
                 -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::Network] },
                 api_name: :Networks

        # @!attribute placement
        #
        #   @return [Docker::Models::Spec::TaskTemplate::Placement, nil]
        optional :placement, -> { Docker::Spec::TaskTemplate::Placement }, api_name: :Placement

        # @!attribute plugin_spec
        #   Plugin spec for the service. _(Experimental release only.)_
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::PluginSpec, nil]
        optional :plugin_spec, -> { Docker::Spec::TaskTemplate::PluginSpec }, api_name: :PluginSpec

        # @!attribute resources
        #   Resource requirements which apply to each individual container created as part
        #   of the service.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::Resources, nil]
        optional :resources, -> { Docker::Spec::TaskTemplate::Resources }, api_name: :Resources

        # @!attribute restart_policy
        #   Specification for the restart policy which applies to containers created as part
        #   of this service.
        #
        #   @return [Docker::Models::Spec::TaskTemplate::RestartPolicy, nil]
        optional :restart_policy, -> { Docker::Spec::TaskTemplate::RestartPolicy }, api_name: :RestartPolicy

        # @!attribute runtime
        #   Runtime is the type of runtime specified for the task executor.
        #
        #   @return [String, nil]
        optional :runtime, String, api_name: :Runtime

        # @!method initialize(container_spec: nil, force_update: nil, log_driver: nil, network_attachment_spec: nil, networks: nil, placement: nil, plugin_spec: nil, resources: nil, restart_policy: nil, runtime: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::TaskTemplate} for more details.
        #
        #   User modifiable task configuration.
        #
        #   @param container_spec [Docker::Models::Spec::TaskTemplate::ContainerSpec] Container spec for the service.
        #
        #   @param force_update [Integer] A counter that triggers an update even if no relevant parameters have
        #
        #   @param log_driver [Docker::Models::Spec::TaskTemplate::LogDriver] Specifies the log driver to use for tasks created from this spec. If
        #
        #   @param network_attachment_spec [Docker::Models::Spec::TaskTemplate::NetworkAttachmentSpec] Read-only spec type for non-swarm containers attached to swarm overlay
        #
        #   @param networks [Array<Docker::Models::Spec::TaskTemplate::Network>] Specifies which networks the service should attach to.
        #
        #   @param placement [Docker::Models::Spec::TaskTemplate::Placement]
        #
        #   @param plugin_spec [Docker::Models::Spec::TaskTemplate::PluginSpec] Plugin spec for the service. _(Experimental release only.)_
        #
        #   @param resources [Docker::Models::Spec::TaskTemplate::Resources] Resource requirements which apply to each individual container created
        #
        #   @param restart_policy [Docker::Models::Spec::TaskTemplate::RestartPolicy] Specification for the restart policy which applies to containers
        #
        #   @param runtime [String] Runtime is the type of runtime specified for the task executor.

        # @see Docker::Models::Spec::TaskTemplate#container_spec
        class ContainerSpec < Docker::Internal::Type::BaseModel
          # @!attribute args
          #   Arguments to the command.
          #
          #   @return [Array<String>, nil]
          optional :args, Docker::Internal::Type::ArrayOf[String], api_name: :Args

          # @!attribute capability_add
          #   A list of kernel capabilities to add to the default set for the container.
          #
          #   @return [Array<String>, nil]
          optional :capability_add, Docker::Internal::Type::ArrayOf[String], api_name: :CapabilityAdd

          # @!attribute capability_drop
          #   A list of kernel capabilities to drop from the default set for the container.
          #
          #   @return [Array<String>, nil]
          optional :capability_drop, Docker::Internal::Type::ArrayOf[String], api_name: :CapabilityDrop

          # @!attribute command
          #   The command to be run in the image.
          #
          #   @return [Array<String>, nil]
          optional :command, Docker::Internal::Type::ArrayOf[String], api_name: :Command

          # @!attribute configs
          #   Configs contains references to zero or more configs that will be exposed to the
          #   service.
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Config>, nil]
          optional :configs,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::ContainerSpec::Config] },
                   api_name: :Configs

          # @!attribute dir
          #   The working directory for commands to run in.
          #
          #   @return [String, nil]
          optional :dir, String, api_name: :Dir

          # @!attribute dns_config
          #   Specification for DNS related configurations in resolver configuration file
          #   (`resolv.conf`).
          #
          #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::DNSConfig, nil]
          optional :dns_config,
                   -> {
                     Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig
                   },
                   api_name: :DNSConfig

          # @!attribute env
          #   A list of environment variables in the form `VAR=value`.
          #
          #   @return [Array<String>, nil]
          optional :env, Docker::Internal::Type::ArrayOf[String], api_name: :Env

          # @!attribute groups
          #   A list of additional groups that the container process will run as.
          #
          #   @return [Array<String>, nil]
          optional :groups, Docker::Internal::Type::ArrayOf[String], api_name: :Groups

          # @!attribute health_check
          #   A test to perform to check that the container is healthy. Healthcheck commands
          #   should be side-effect free.
          #
          #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::HealthCheck, nil]
          optional :health_check,
                   -> { Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck },
                   api_name: :HealthCheck

          # @!attribute hostname
          #   The hostname to use for the container, as a valid
          #   [RFC 1123](https://tools.ietf.org/html/rfc1123) hostname.
          #
          #   @return [String, nil]
          optional :hostname, String, api_name: :Hostname

          # @!attribute hosts
          #   A list of hostname/IP mappings to add to the container's `hosts` file. The
          #   format of extra hosts is specified in the
          #   [hosts(5)](http://man7.org/linux/man-pages/man5/hosts.5.html) man page:
          #
          #       IP_address canonical_hostname [aliases...]
          #
          #   @return [Array<String>, nil]
          optional :hosts, Docker::Internal::Type::ArrayOf[String], api_name: :Hosts

          # @!attribute image
          #   The image name to use for the container
          #
          #   @return [String, nil]
          optional :image, String, api_name: :Image

          # @!attribute init
          #   Run an init inside the container that forwards signals and reaps processes. This
          #   field is omitted if empty, and the default (as configured on the daemon) is
          #   used.
          #
          #   @return [Boolean, nil]
          optional :init, Docker::Internal::Type::Boolean, api_name: :Init, nil?: true

          # @!attribute isolation
          #   Isolation technology of the containers running the service. (Windows only)
          #
          #   @return [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Isolation, nil]
          optional :isolation,
                   enum: -> { Docker::Spec::TaskTemplate::ContainerSpec::Isolation },
                   api_name: :Isolation

          # @!attribute labels
          #   User-defined key/value data.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

          # @!attribute mounts
          #   Specification for mounts to be added to containers created as part of the
          #   service.
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount>, nil]
          optional :mounts,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::ContainerSpec::Mount] },
                   api_name: :Mounts

          # @!attribute oom_score_adj
          #   An integer value containing the score given to the container in order to tune
          #   OOM killer preferences.
          #
          #   @return [Integer, nil]
          optional :oom_score_adj, Integer, api_name: :OomScoreAdj

          # @!attribute open_stdin
          #   Open `stdin`
          #
          #   @return [Boolean, nil]
          optional :open_stdin, Docker::Internal::Type::Boolean, api_name: :OpenStdin

          # @!attribute privileges
          #   Security options for the container
          #
          #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges, nil]
          optional :privileges,
                   -> {
                     Docker::Spec::TaskTemplate::ContainerSpec::Privileges
                   },
                   api_name: :Privileges

          # @!attribute read_only
          #   Mount the container's root filesystem as read only.
          #
          #   @return [Boolean, nil]
          optional :read_only, Docker::Internal::Type::Boolean, api_name: :ReadOnly

          # @!attribute secrets
          #   Secrets contains references to zero or more secrets that will be exposed to the
          #   service.
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret>, nil]
          optional :secrets,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::ContainerSpec::Secret] },
                   api_name: :Secrets

          # @!attribute stop_grace_period
          #   Amount of time to wait for the container to terminate before forcefully killing
          #   it.
          #
          #   @return [Integer, nil]
          optional :stop_grace_period, Integer, api_name: :StopGracePeriod

          # @!attribute stop_signal
          #   Signal to stop the container.
          #
          #   @return [String, nil]
          optional :stop_signal, String, api_name: :StopSignal

          # @!attribute sysctls
          #   Set kernel namedspaced parameters (sysctls) in the container. The Sysctls option
          #   on services accepts the same sysctls as the are supported on containers. Note
          #   that while the same sysctls are supported, no guarantees or checks are made
          #   about their suitability for a clustered environment, and it's up to the user to
          #   determine whether a given sysctl will work properly in a Service.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :sysctls, Docker::Internal::Type::HashOf[String], api_name: :Sysctls

          # @!attribute tty
          #   Whether a pseudo-TTY should be allocated.
          #
          #   @return [Boolean, nil]
          optional :tty, Docker::Internal::Type::Boolean, api_name: :TTY

          # @!attribute ulimits
          #   A list of resource limits to set in the container. For example:
          #   `{"Name": "nofile", "Soft": 1024, "Hard": 2048}`"
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Ulimit>, nil]
          optional :ulimits,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::ContainerSpec::Ulimit] },
                   api_name: :Ulimits

          # @!attribute user
          #   The user inside the container.
          #
          #   @return [String, nil]
          optional :user, String, api_name: :User

          # @!method initialize(args: nil, capability_add: nil, capability_drop: nil, command: nil, configs: nil, dir: nil, dns_config: nil, env: nil, groups: nil, health_check: nil, hostname: nil, hosts: nil, image: nil, init: nil, isolation: nil, labels: nil, mounts: nil, oom_score_adj: nil, open_stdin: nil, privileges: nil, read_only: nil, secrets: nil, stop_grace_period: nil, stop_signal: nil, sysctls: nil, tty: nil, ulimits: nil, user: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::TaskTemplate::ContainerSpec} for more details.
          #
          #   Container spec for the service.
          #
          #   <p><br /></p>
          #
          #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          #
          #   @param args [Array<String>] Arguments to the command.
          #
          #   @param capability_add [Array<String>] A list of kernel capabilities to add to the default set
          #
          #   @param capability_drop [Array<String>] A list of kernel capabilities to drop from the default set
          #
          #   @param command [Array<String>] The command to be run in the image.
          #
          #   @param configs [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Config>] Configs contains references to zero or more configs that will be
          #
          #   @param dir [String] The working directory for commands to run in.
          #
          #   @param dns_config [Docker::Models::Spec::TaskTemplate::ContainerSpec::DNSConfig] Specification for DNS related configurations in resolver configuration
          #
          #   @param env [Array<String>] A list of environment variables in the form `VAR=value`.
          #
          #   @param groups [Array<String>] A list of additional groups that the container process will run as.
          #
          #   @param health_check [Docker::Models::Spec::TaskTemplate::ContainerSpec::HealthCheck] A test to perform to check that the container is healthy.
          #
          #   @param hostname [String] The hostname to use for the container, as a valid
          #
          #   @param hosts [Array<String>] A list of hostname/IP mappings to add to the container's `hosts`
          #
          #   @param image [String] The image name to use for the container
          #
          #   @param init [Boolean, nil] Run an init inside the container that forwards signals and reaps
          #
          #   @param isolation [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Isolation] Isolation technology of the containers running the service.
          #
          #   @param labels [Hash{Symbol=>String}] User-defined key/value data.
          #
          #   @param mounts [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount>] Specification for mounts to be added to containers created as part
          #
          #   @param oom_score_adj [Integer] An integer value containing the score given to the container in
          #
          #   @param open_stdin [Boolean] Open `stdin`
          #
          #   @param privileges [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges] Security options for the container
          #
          #   @param read_only [Boolean] Mount the container's root filesystem as read only.
          #
          #   @param secrets [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret>] Secrets contains references to zero or more secrets that will be
          #
          #   @param stop_grace_period [Integer] Amount of time to wait for the container to terminate before
          #
          #   @param stop_signal [String] Signal to stop the container.
          #
          #   @param sysctls [Hash{Symbol=>String}] Set kernel namedspaced parameters (sysctls) in the container.
          #
          #   @param tty [Boolean] Whether a pseudo-TTY should be allocated.
          #
          #   @param ulimits [Array<Docker::Models::Spec::TaskTemplate::ContainerSpec::Ulimit>] A list of resource limits to set in the container. For example: `{"Name": "nofil
          #
          #   @param user [String] The user inside the container.

          class Config < Docker::Internal::Type::BaseModel
            # @!attribute config_id
            #   ConfigID represents the ID of the specific config that we're referencing.
            #
            #   @return [String, nil]
            optional :config_id, String, api_name: :ConfigID

            # @!attribute config_name
            #   ConfigName is the name of the config that this references, but this is just
            #   provided for lookup/display purposes. The config in the reference will be
            #   identified by its ID.
            #
            #   @return [String, nil]
            optional :config_name, String, api_name: :ConfigName

            # @!attribute file
            #   File represents a specific target that is backed by a file.
            #
            #   <p><br /><p>
            #
            #   > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Config::File, nil]
            optional :file, -> { Docker::Spec::TaskTemplate::ContainerSpec::Config::File }, api_name: :File

            # @!attribute runtime
            #   Runtime represents a target that is not mounted into the container but is used
            #   by the task
            #
            #   <p><br /><p>
            #
            #   > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
            #
            #   @return [Object, nil]
            optional :runtime, Docker::Internal::Type::Unknown, api_name: :Runtime

            # @!method initialize(config_id: nil, config_name: nil, file: nil, runtime: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Config} for more details.
            #
            #   @param config_id [String] ConfigID represents the ID of the specific config that we're
            #
            #   @param config_name [String] ConfigName is the name of the config that this references,
            #
            #   @param file [Docker::Models::Spec::TaskTemplate::ContainerSpec::Config::File] File represents a specific target that is backed by a file.
            #
            #   @param runtime [Object] Runtime represents a target that is not mounted into the

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Config#file
            class File < Docker::Internal::Type::BaseModel
              # @!attribute gid
              #   GID represents the file GID.
              #
              #   @return [String, nil]
              optional :gid, String, api_name: :GID

              # @!attribute mode
              #   Mode represents the FileMode of the file.
              #
              #   @return [Integer, nil]
              optional :mode, Integer, api_name: :Mode

              # @!attribute name
              #   Name represents the final filename in the filesystem.
              #
              #   @return [String, nil]
              optional :name, String, api_name: :Name

              # @!attribute uid
              #   UID represents the file UID.
              #
              #   @return [String, nil]
              optional :uid, String, api_name: :UID

              # @!method initialize(gid: nil, mode: nil, name: nil, uid: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Config::File} for more
              #   details.
              #
              #   File represents a specific target that is backed by a file.
              #
              #   <p><br /><p>
              #
              #   > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
              #
              #   @param gid [String] GID represents the file GID.
              #
              #   @param mode [Integer] Mode represents the FileMode of the file.
              #
              #   @param name [String] Name represents the final filename in the filesystem.
              #
              #   @param uid [String] UID represents the file UID.
            end
          end

          # @see Docker::Models::Spec::TaskTemplate::ContainerSpec#dns_config
          class DNSConfig < Docker::Internal::Type::BaseModel
            # @!attribute nameservers
            #   The IP addresses of the name servers.
            #
            #   @return [Array<String>, nil]
            optional :nameservers, Docker::Internal::Type::ArrayOf[String], api_name: :Nameservers

            # @!attribute options
            #   A list of internal resolver variables to be modified (e.g., `debug`, `ndots:3`,
            #   etc.).
            #
            #   @return [Array<String>, nil]
            optional :options, Docker::Internal::Type::ArrayOf[String], api_name: :Options

            # @!attribute search
            #   A search list for host-name lookup.
            #
            #   @return [Array<String>, nil]
            optional :search, Docker::Internal::Type::ArrayOf[String], api_name: :Search

            # @!method initialize(nameservers: nil, options: nil, search: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::DNSConfig} for more details.
            #
            #   Specification for DNS related configurations in resolver configuration file
            #   (`resolv.conf`).
            #
            #   @param nameservers [Array<String>] The IP addresses of the name servers.
            #
            #   @param options [Array<String>] A list of internal resolver variables to be modified (e.g.,
            #
            #   @param search [Array<String>] A search list for host-name lookup.
          end

          # @see Docker::Models::Spec::TaskTemplate::ContainerSpec#health_check
          class HealthCheck < Docker::Internal::Type::BaseModel
            # @!attribute interval
            #   The time to wait between checks in nanoseconds. It should be 0 or at least
            #   1000000 (1 ms). 0 means inherit.
            #
            #   @return [Integer, nil]
            optional :interval, Integer, api_name: :Interval

            # @!attribute retries
            #   The number of consecutive failures needed to consider a container as unhealthy.
            #   0 means inherit.
            #
            #   @return [Integer, nil]
            optional :retries, Integer, api_name: :Retries

            # @!attribute start_interval
            #   The time to wait between checks in nanoseconds during the start period. It
            #   should be 0 or at least 1000000 (1 ms). 0 means inherit.
            #
            #   @return [Integer, nil]
            optional :start_interval, Integer, api_name: :StartInterval

            # @!attribute start_period
            #   Start period for the container to initialize before starting health-retries
            #   countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
            #   inherit.
            #
            #   @return [Integer, nil]
            optional :start_period, Integer, api_name: :StartPeriod

            # @!attribute test_
            #   The test to perform. Possible values are:
            #
            #   - `[]` inherit healthcheck from image or parent image
            #   - `["NONE"]` disable healthcheck
            #   - `["CMD", args...]` exec arguments directly
            #   - `["CMD-SHELL", command]` run command with system's default shell
            #
            #   A non-zero exit code indicates a failed healthcheck:
            #
            #   - `0` healthy
            #   - `1` unhealthy
            #   - `2` reserved (treated as unhealthy)
            #   - other values: error running probe
            #
            #   @return [Array<String>, nil]
            optional :test_, Docker::Internal::Type::ArrayOf[String], api_name: :Test

            # @!attribute timeout
            #   The time to wait before considering the check to have hung. It should be 0 or at
            #   least 1000000 (1 ms). 0 means inherit.
            #
            #   If the health check command does not complete within this timeout, the check is
            #   considered failed and the health check process is forcibly terminated without a
            #   graceful shutdown.
            #
            #   @return [Integer, nil]
            optional :timeout, Integer, api_name: :Timeout

            # @!method initialize(interval: nil, retries: nil, start_interval: nil, start_period: nil, test_: nil, timeout: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::HealthCheck} for more
            #   details.
            #
            #   A test to perform to check that the container is healthy. Healthcheck commands
            #   should be side-effect free.
            #
            #   @param interval [Integer] The time to wait between checks in nanoseconds. It should be 0 or at
            #
            #   @param retries [Integer] The number of consecutive failures needed to consider a container as
            #
            #   @param start_interval [Integer] The time to wait between checks in nanoseconds during the start period.
            #
            #   @param start_period [Integer] Start period for the container to initialize before starting
            #
            #   @param test_ [Array<String>] The test to perform. Possible values are:
            #
            #   @param timeout [Integer] The time to wait before considering the check to have hung. It should
          end

          # Isolation technology of the containers running the service. (Windows only)
          #
          # @see Docker::Models::Spec::TaskTemplate::ContainerSpec#isolation
          module Isolation
            extend Docker::Internal::Type::Enum

            DEFAULT = :default
            PROCESS = :process
            HYPERV = :hyperv
            EMPTY = :""

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Mount < Docker::Internal::Type::BaseModel
            # @!attribute bind_options
            #   Optional configuration for the `bind` type.
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions, nil]
            optional :bind_options,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions },
                     api_name: :BindOptions

            # @!attribute consistency
            #   The consistency requirement for the mount: `default`, `consistent`, `cached`, or
            #   `delegated`.
            #
            #   @return [String, nil]
            optional :consistency, String, api_name: :Consistency

            # @!attribute image_options
            #   Optional configuration for the `image` type.
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions, nil]
            optional :image_options,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions },
                     api_name: :ImageOptions

            # @!attribute read_only
            #   Whether the mount should be read-only.
            #
            #   @return [Boolean, nil]
            optional :read_only, Docker::Internal::Type::Boolean, api_name: :ReadOnly

            # @!attribute source
            #   Mount source (e.g. a volume name, a host path). The source cannot be specified
            #   when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
            #   the `CreateMountpoint` must be set to `true` to create the source path on the
            #   host if missing.
            #
            #   For `Type=npipe`, the pipe must exist prior to creating the container.
            #
            #   @return [String, nil]
            optional :source, String, api_name: :Source

            # @!attribute target
            #   Container path.
            #
            #   @return [String, nil]
            optional :target, String, api_name: :Target

            # @!attribute tmpfs_options
            #   Optional configuration for the `tmpfs` type.
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions, nil]
            optional :tmpfs_options,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions },
                     api_name: :TmpfsOptions

            # @!attribute type
            #   The mount type. Available types:
            #
            #   - `bind` a mount of a file or directory from the host into the container.
            #   - `cluster` a Swarm cluster volume.
            #   - `image` an OCI image.
            #   - `npipe` a named pipe from the host into the container.
            #   - `tmpfs` a `tmpfs`.
            #   - `volume` a docker volume with the given `Name`.
            #
            #   @return [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::Type, nil]
            optional :type,
                     enum: -> {
                       Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type
                     },
                     api_name: :Type

            # @!attribute volume_options
            #   Optional configuration for the `volume` type.
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions, nil]
            optional :volume_options,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions },
                     api_name: :VolumeOptions

            # @!method initialize(bind_options: nil, consistency: nil, image_options: nil, read_only: nil, source: nil, target: nil, tmpfs_options: nil, type: nil, volume_options: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount} for more details.
            #
            #   @param bind_options [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions] Optional configuration for the `bind` type.
            #
            #   @param consistency [String] The consistency requirement for the mount: `default`, `consistent`, `cached`, or
            #
            #   @param image_options [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions] Optional configuration for the `image` type.
            #
            #   @param read_only [Boolean] Whether the mount should be read-only.
            #
            #   @param source [String] Mount source (e.g. a volume name, a host path). The source cannot be
            #
            #   @param target [String] Container path.
            #
            #   @param tmpfs_options [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions] Optional configuration for the `tmpfs` type.
            #
            #   @param type [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::Type] The mount type. Available types:
            #
            #   @param volume_options [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions] Optional configuration for the `volume` type.

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount#bind_options
            class BindOptions < Docker::Internal::Type::BaseModel
              # @!attribute create_mountpoint
              #   Create mount point on host if missing
              #
              #   @return [Boolean, nil]
              optional :create_mountpoint, Docker::Internal::Type::Boolean, api_name: :CreateMountpoint

              # @!attribute non_recursive
              #   Disable recursive bind mount.
              #
              #   @return [Boolean, nil]
              optional :non_recursive, Docker::Internal::Type::Boolean, api_name: :NonRecursive

              # @!attribute propagation
              #   A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              #   @return [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation, nil]
              optional :propagation,
                       enum: -> {
                         Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation
                       },
                       api_name: :Propagation

              # @!attribute read_only_force_recursive
              #   Raise an error if the mount cannot be made recursively read-only.
              #
              #   @return [Boolean, nil]
              optional :read_only_force_recursive,
                       Docker::Internal::Type::Boolean,
                       api_name: :ReadOnlyForceRecursive

              # @!attribute read_only_non_recursive
              #   Make the mount non-recursively read-only, but still leave the mount recursive
              #   (unless NonRecursive is set to `true` in conjunction).
              #
              #   Added in v1.44, before that version all read-only mounts were non-recursive by
              #   default. To match the previous behaviour this will default to `true` for clients
              #   on versions prior to v1.44.
              #
              #   @return [Boolean, nil]
              optional :read_only_non_recursive,
                       Docker::Internal::Type::Boolean,
                       api_name: :ReadOnlyNonRecursive

              # @!method initialize(create_mountpoint: nil, non_recursive: nil, propagation: nil, read_only_force_recursive: nil, read_only_non_recursive: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions} for more
              #   details.
              #
              #   Optional configuration for the `bind` type.
              #
              #   @param create_mountpoint [Boolean] Create mount point on host if missing
              #
              #   @param non_recursive [Boolean] Disable recursive bind mount.
              #
              #   @param propagation [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation] A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              #   @param read_only_force_recursive [Boolean] Raise an error if the mount cannot be made recursively read-only.
              #
              #   @param read_only_non_recursive [Boolean] Make the mount non-recursively read-only, but still leave the mount recursive

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions#propagation
              module Propagation
                extend Docker::Internal::Type::Enum

                PRIVATE = :private
                RPRIVATE = :rprivate
                SHARED = :shared
                RSHARED = :rshared
                SLAVE = :slave
                RSLAVE = :rslave

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount#image_options
            class ImageOptions < Docker::Internal::Type::BaseModel
              # @!attribute subpath
              #   Source path inside the image. Must be relative without any back traversals.
              #
              #   @return [String, nil]
              optional :subpath, String, api_name: :Subpath

              # @!method initialize(subpath: nil)
              #   Optional configuration for the `image` type.
              #
              #   @param subpath [String] Source path inside the image. Must be relative without any back traversals.
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount#tmpfs_options
            class TmpfsOptions < Docker::Internal::Type::BaseModel
              # @!attribute mode
              #   The permission mode for the tmpfs mount in an integer. The value must not be in
              #   octal format (e.g. 755) but rather the decimal representation of the octal value
              #   (e.g. 493).
              #
              #   @return [Integer, nil]
              optional :mode, Integer, api_name: :Mode

              # @!attribute options
              #   The options to be passed to the tmpfs mount. An array of arrays. Flag options
              #   should be provided as 1-length arrays. Other types should be provided as as
              #   2-length arrays, where the first item is the key and the second the value.
              #
              #   @return [Array<Array<String>>, nil]
              optional :options,
                       Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
                       api_name: :Options

              # @!attribute size_bytes
              #   The size for the tmpfs mount in bytes.
              #
              #   @return [Integer, nil]
              optional :size_bytes, Integer, api_name: :SizeBytes

              # @!method initialize(mode: nil, options: nil, size_bytes: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions} for
              #   more details.
              #
              #   Optional configuration for the `tmpfs` type.
              #
              #   @param mode [Integer] The permission mode for the tmpfs mount in an integer.
              #
              #   @param options [Array<Array<String>>] The options to be passed to the tmpfs mount. An array of arrays.
              #
              #   @param size_bytes [Integer] The size for the tmpfs mount in bytes.
            end

            # The mount type. Available types:
            #
            # - `bind` a mount of a file or directory from the host into the container.
            # - `cluster` a Swarm cluster volume.
            # - `image` an OCI image.
            # - `npipe` a named pipe from the host into the container.
            # - `tmpfs` a `tmpfs`.
            # - `volume` a docker volume with the given `Name`.
            #
            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount#type
            module Type
              extend Docker::Internal::Type::Enum

              BIND = :bind
              CLUSTER = :cluster
              IMAGE = :image
              NPIPE = :npipe
              TMPFS = :tmpfs
              VOLUME = :volume

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount#volume_options
            class VolumeOptions < Docker::Internal::Type::BaseModel
              # @!attribute driver_config
              #   Map of driver specific options
              #
              #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig, nil]
              optional :driver_config,
                       -> { Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig },
                       api_name: :DriverConfig

              # @!attribute labels
              #   User-defined key/value metadata.
              #
              #   @return [Hash{Symbol=>String}, nil]
              optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

              # @!attribute no_copy
              #   Populate volume with data from the target.
              #
              #   @return [Boolean, nil]
              optional :no_copy, Docker::Internal::Type::Boolean, api_name: :NoCopy

              # @!attribute subpath
              #   Source path inside the volume. Must be relative without any back traversals.
              #
              #   @return [String, nil]
              optional :subpath, String, api_name: :Subpath

              # @!method initialize(driver_config: nil, labels: nil, no_copy: nil, subpath: nil)
              #   Optional configuration for the `volume` type.
              #
              #   @param driver_config [Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig] Map of driver specific options
              #
              #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
              #
              #   @param no_copy [Boolean] Populate volume with data from the target.
              #
              #   @param subpath [String] Source path inside the volume. Must be relative without any back traversals.

              # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions#driver_config
              class DriverConfig < Docker::Internal::Type::BaseModel
                # @!attribute name
                #   Name of the driver to use to create the volume.
                #
                #   @return [String, nil]
                optional :name, String, api_name: :Name

                # @!attribute options
                #   key/value map of driver specific options.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

                # @!method initialize(name: nil, options: nil)
                #   Map of driver specific options
                #
                #   @param name [String] Name of the driver to use to create the volume.
                #
                #   @param options [Hash{Symbol=>String}] key/value map of driver specific options.
              end
            end
          end

          # @see Docker::Models::Spec::TaskTemplate::ContainerSpec#privileges
          class Privileges < Docker::Internal::Type::BaseModel
            # @!attribute app_armor
            #   Options for configuring AppArmor on the container
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor, nil]
            optional :app_armor,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor },
                     api_name: :AppArmor

            # @!attribute credential_spec
            #   CredentialSpec for managed service account (Windows only)
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec, nil]
            optional :credential_spec,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec },
                     api_name: :CredentialSpec

            # @!attribute no_new_privileges
            #   Configuration of the no_new_privs bit in the container
            #
            #   @return [Boolean, nil]
            optional :no_new_privileges, Docker::Internal::Type::Boolean, api_name: :NoNewPrivileges

            # @!attribute seccomp
            #   Options for configuring seccomp on the container
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp, nil]
            optional :seccomp,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp },
                     api_name: :Seccomp

            # @!attribute se_linux_context
            #   SELinux labels of the container
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext, nil]
            optional :se_linux_context,
                     -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext },
                     api_name: :SELinuxContext

            # @!method initialize(app_armor: nil, credential_spec: nil, no_new_privileges: nil, seccomp: nil, se_linux_context: nil)
            #   Security options for the container
            #
            #   @param app_armor [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor] Options for configuring AppArmor on the container
            #
            #   @param credential_spec [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec] CredentialSpec for managed service account (Windows only)
            #
            #   @param no_new_privileges [Boolean] Configuration of the no_new_privs bit in the container
            #
            #   @param seccomp [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp] Options for configuring seccomp on the container
            #
            #   @param se_linux_context [Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext] SELinux labels of the container

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges#app_armor
            class AppArmor < Docker::Internal::Type::BaseModel
              # @!attribute mode
              #
              #   @return [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode, nil]
              optional :mode,
                       enum: -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode },
                       api_name: :Mode

              # @!method initialize(mode: nil)
              #   Options for configuring AppArmor on the container
              #
              #   @param mode [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode]

              # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor#mode
              module Mode
                extend Docker::Internal::Type::Enum

                DEFAULT = :default
                DISABLED = :disabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges#credential_spec
            class CredentialSpec < Docker::Internal::Type::BaseModel
              # @!attribute config
              #   Load credential spec from a Swarm Config with the given ID. The specified config
              #   must also be present in the Configs field with the Runtime property set.
              #
              #   <p><br /></p>
              #
              #   > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              #   > `CredentialSpec.Config` are mutually exclusive.
              #
              #   @return [String, nil]
              optional :config, String, api_name: :Config

              # @!attribute file
              #   Load credential spec from this file. The file is read by the daemon, and must be
              #   present in the `CredentialSpecs` subdirectory in the docker data directory,
              #   which defaults to `C:\ProgramData\Docker\` on Windows.
              #
              #   For example, specifying `spec.json` loads
              #   `C:\ProgramData\Docker\CredentialSpecs\spec.json`.
              #
              #   <p><br /></p>
              #
              #   > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              #   > `CredentialSpec.Config` are mutually exclusive.
              #
              #   @return [String, nil]
              optional :file, String, api_name: :File

              # @!attribute registry
              #   Load credential spec from this value in the Windows registry. The specified
              #   registry value must be located in:
              #
              #   `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs`
              #
              #   <p><br /></p>
              #
              #   > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              #   > `CredentialSpec.Config` are mutually exclusive.
              #
              #   @return [String, nil]
              optional :registry, String, api_name: :Registry

              # @!method initialize(config: nil, file: nil, registry: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec}
              #   for more details.
              #
              #   CredentialSpec for managed service account (Windows only)
              #
              #   @param config [String] Load credential spec from a Swarm Config with the given ID.
              #
              #   @param file [String] Load credential spec from this file. The file is read by
              #
              #   @param registry [String] Load credential spec from this value in the Windows
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges#seccomp
            class Seccomp < Docker::Internal::Type::BaseModel
              # @!attribute mode
              #
              #   @return [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode, nil]
              optional :mode,
                       enum: -> { Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode },
                       api_name: :Mode

              # @!attribute profile
              #   The custom seccomp profile as a json object
              #
              #   @return [String, nil]
              optional :profile, String, api_name: :Profile

              # @!method initialize(mode: nil, profile: nil)
              #   Options for configuring seccomp on the container
              #
              #   @param mode [Symbol, Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode]
              #
              #   @param profile [String] The custom seccomp profile as a json object

              # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp#mode
              module Mode
                extend Docker::Internal::Type::Enum

                DEFAULT = :default
                UNCONFINED = :unconfined
                CUSTOM = :custom

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Privileges#se_linux_context
            class SeLinuxContext < Docker::Internal::Type::BaseModel
              # @!attribute disable
              #   Disable SELinux
              #
              #   @return [Boolean, nil]
              optional :disable, Docker::Internal::Type::Boolean, api_name: :Disable

              # @!attribute level
              #   SELinux level label
              #
              #   @return [String, nil]
              optional :level, String, api_name: :Level

              # @!attribute role
              #   SELinux role label
              #
              #   @return [String, nil]
              optional :role, String, api_name: :Role

              # @!attribute type
              #   SELinux type label
              #
              #   @return [String, nil]
              optional :type, String, api_name: :Type

              # @!attribute user
              #   SELinux user label
              #
              #   @return [String, nil]
              optional :user, String, api_name: :User

              # @!method initialize(disable: nil, level: nil, role: nil, type: nil, user: nil)
              #   SELinux labels of the container
              #
              #   @param disable [Boolean] Disable SELinux
              #
              #   @param level [String] SELinux level label
              #
              #   @param role [String] SELinux role label
              #
              #   @param type [String] SELinux type label
              #
              #   @param user [String] SELinux user label
            end
          end

          class Secret < Docker::Internal::Type::BaseModel
            # @!attribute file
            #   File represents a specific target that is backed by a file.
            #
            #   @return [Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret::File, nil]
            optional :file, -> { Docker::Spec::TaskTemplate::ContainerSpec::Secret::File }, api_name: :File

            # @!attribute secret_id
            #   SecretID represents the ID of the specific secret that we're referencing.
            #
            #   @return [String, nil]
            optional :secret_id, String, api_name: :SecretID

            # @!attribute secret_name
            #   SecretName is the name of the secret that this references, but this is just
            #   provided for lookup/display purposes. The secret in the reference will be
            #   identified by its ID.
            #
            #   @return [String, nil]
            optional :secret_name, String, api_name: :SecretName

            # @!method initialize(file: nil, secret_id: nil, secret_name: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret} for more details.
            #
            #   @param file [Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret::File] File represents a specific target that is backed by a file.
            #
            #   @param secret_id [String] SecretID represents the ID of the specific secret that we're
            #
            #   @param secret_name [String] SecretName is the name of the secret that this references,

            # @see Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret#file
            class File < Docker::Internal::Type::BaseModel
              # @!attribute gid
              #   GID represents the file GID.
              #
              #   @return [String, nil]
              optional :gid, String, api_name: :GID

              # @!attribute mode
              #   Mode represents the FileMode of the file.
              #
              #   @return [Integer, nil]
              optional :mode, Integer, api_name: :Mode

              # @!attribute name
              #   Name represents the final filename in the filesystem.
              #
              #   @return [String, nil]
              optional :name, String, api_name: :Name

              # @!attribute uid
              #   UID represents the file UID.
              #
              #   @return [String, nil]
              optional :uid, String, api_name: :UID

              # @!method initialize(gid: nil, mode: nil, name: nil, uid: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::ContainerSpec::Secret::File} for more
              #   details.
              #
              #   File represents a specific target that is backed by a file.
              #
              #   @param gid [String] GID represents the file GID.
              #
              #   @param mode [Integer] Mode represents the FileMode of the file.
              #
              #   @param name [String] Name represents the final filename in the filesystem.
              #
              #   @param uid [String] UID represents the file UID.
            end
          end

          class Ulimit < Docker::Internal::Type::BaseModel
            # @!attribute hard
            #   Hard limit
            #
            #   @return [Integer, nil]
            optional :hard, Integer, api_name: :Hard

            # @!attribute name
            #   Name of ulimit
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute soft
            #   Soft limit
            #
            #   @return [Integer, nil]
            optional :soft, Integer, api_name: :Soft

            # @!method initialize(hard: nil, name: nil, soft: nil)
            #   @param hard [Integer] Hard limit
            #
            #   @param name [String] Name of ulimit
            #
            #   @param soft [Integer] Soft limit
          end
        end

        # @see Docker::Models::Spec::TaskTemplate#log_driver
        class LogDriver < Docker::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute options
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

          # @!method initialize(name: nil, options: nil)
          #   Specifies the log driver to use for tasks created from this spec. If not
          #   present, the default one for the swarm will be used, finally falling back to the
          #   engine default if not specified.
          #
          #   @param name [String]
          #   @param options [Hash{Symbol=>String}]
        end

        # @see Docker::Models::Spec::TaskTemplate#network_attachment_spec
        class NetworkAttachmentSpec < Docker::Internal::Type::BaseModel
          # @!attribute container_id
          #   ID of the container represented by this task
          #
          #   @return [String, nil]
          optional :container_id, String, api_name: :ContainerID

          # @!method initialize(container_id: nil)
          #   Read-only spec type for non-swarm containers attached to swarm overlay networks.
          #
          #   <p><br /></p>
          #
          #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          #
          #   @param container_id [String] ID of the container represented by this task
        end

        class Network < Docker::Internal::Type::BaseModel
          # @!attribute aliases
          #   Discoverable alternate names for the service on this network.
          #
          #   @return [Array<String>, nil]
          optional :aliases, Docker::Internal::Type::ArrayOf[String], api_name: :Aliases

          # @!attribute driver_opts
          #   Driver attachment options for the network target.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :driver_opts, Docker::Internal::Type::HashOf[String], api_name: :DriverOpts

          # @!attribute target
          #   The target network for attachment. Must be a network name or ID.
          #
          #   @return [String, nil]
          optional :target, String, api_name: :Target

          # @!method initialize(aliases: nil, driver_opts: nil, target: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::TaskTemplate::Network} for more details.
          #
          #   Specifies how a service should be attached to a particular network.
          #
          #   @param aliases [Array<String>] Discoverable alternate names for the service on this network.
          #
          #   @param driver_opts [Hash{Symbol=>String}] Driver attachment options for the network target.
          #
          #   @param target [String] The target network for attachment. Must be a network name or ID.
        end

        # @see Docker::Models::Spec::TaskTemplate#placement
        class Placement < Docker::Internal::Type::BaseModel
          # @!attribute constraints
          #   An array of constraint expressions to limit the set of nodes where a task can be
          #   scheduled. Constraint expressions can either use a _match_ (`==`) or _exclude_
          #   (`!=`) rule. Multiple constraints find nodes that satisfy every expression (AND
          #   match). Constraints can match node or Docker Engine labels as follows:
          #
          #   | node attribute       | matches                        | example                                       |
          #   | -------------------- | ------------------------------ | --------------------------------------------- |
          #   | `node.id`            | Node ID                        | `node.id==2ivku8v2gvtg4`                      |
          #   | `node.hostname`      | Node hostname                  | `node.hostname!=node-2`                       |
          #   | `node.role`          | Node role (`manager`/`worker`) | `node.role==manager`                          |
          #   | `node.platform.os`   | Node operating system          | `node.platform.os==windows`                   |
          #   | `node.platform.arch` | Node architecture              | `node.platform.arch==x86_64`                  |
          #   | `node.labels`        | User-defined node labels       | `node.labels.security==high`                  |
          #   | `engine.labels`      | Docker Engine's labels         | `engine.labels.operatingsystem==ubuntu-24.04` |
          #
          #   `engine.labels` apply to Docker Engine labels like operating system, drivers,
          #   etc. Swarm administrators add `node.labels` for operational purposes by using
          #   the [`node update endpoint`](#operation/NodeUpdate).
          #
          #   @return [Array<String>, nil]
          optional :constraints, Docker::Internal::Type::ArrayOf[String], api_name: :Constraints

          # @!attribute max_replicas
          #   Maximum number of replicas for per node (default value is 0, which is unlimited)
          #
          #   @return [Integer, nil]
          optional :max_replicas, Integer, api_name: :MaxReplicas

          # @!attribute platforms
          #   Platforms stores all the platforms that the service's image can run on. This
          #   field is used in the platform filter for scheduling. If empty, then the platform
          #   filter is off, meaning there are no scheduling restrictions.
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::Placement::Platform>, nil]
          optional :platforms,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::Placement::Platform] },
                   api_name: :Platforms

          # @!attribute preferences
          #   Preferences provide a way to make the scheduler aware of factors such as
          #   topology. They are provided in order from highest to lowest precedence.
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::Placement::Preference>, nil]
          optional :preferences,
                   -> { Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::Placement::Preference] },
                   api_name: :Preferences

          # @!method initialize(constraints: nil, max_replicas: nil, platforms: nil, preferences: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::TaskTemplate::Placement} for more details.
          #
          #   @param constraints [Array<String>] An array of constraint expressions to limit the set of nodes where
          #
          #   @param max_replicas [Integer] Maximum number of replicas for per node (default value is 0, which
          #
          #   @param platforms [Array<Docker::Models::Spec::TaskTemplate::Placement::Platform>] Platforms stores all the platforms that the service's image can
          #
          #   @param preferences [Array<Docker::Models::Spec::TaskTemplate::Placement::Preference>] Preferences provide a way to make the scheduler aware of factors

          class Platform < Docker::Internal::Type::BaseModel
            # @!attribute architecture
            #   Architecture represents the hardware architecture (for example, `x86_64`).
            #
            #   @return [String, nil]
            optional :architecture, String, api_name: :Architecture

            # @!attribute os
            #   OS represents the Operating System (for example, `linux` or `windows`).
            #
            #   @return [String, nil]
            optional :os, String, api_name: :OS

            # @!method initialize(architecture: nil, os: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::Placement::Platform} for more details.
            #
            #   Platform represents the platform (Arch/OS).
            #
            #   @param architecture [String] Architecture represents the hardware architecture (for example,
            #
            #   @param os [String] OS represents the Operating System (for example, `linux` or `windows`).
          end

          class Preference < Docker::Internal::Type::BaseModel
            # @!attribute spread
            #
            #   @return [Docker::Models::Spec::TaskTemplate::Placement::Preference::Spread, nil]
            optional :spread,
                     -> {
                       Docker::Spec::TaskTemplate::Placement::Preference::Spread
                     },
                     api_name: :Spread

            # @!method initialize(spread: nil)
            #   @param spread [Docker::Models::Spec::TaskTemplate::Placement::Preference::Spread]

            # @see Docker::Models::Spec::TaskTemplate::Placement::Preference#spread
            class Spread < Docker::Internal::Type::BaseModel
              # @!attribute spread_descriptor
              #   label descriptor, such as `engine.labels.az`.
              #
              #   @return [String, nil]
              optional :spread_descriptor, String, api_name: :SpreadDescriptor

              # @!method initialize(spread_descriptor: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::Spec::TaskTemplate::Placement::Preference::Spread} for more
              #   details.
              #
              #   @param spread_descriptor [String] label descriptor, such as `engine.labels.az`.
            end
          end
        end

        # @see Docker::Models::Spec::TaskTemplate#plugin_spec
        class PluginSpec < Docker::Internal::Type::BaseModel
          # @!attribute disabled
          #   Disable the plugin once scheduled.
          #
          #   @return [Boolean, nil]
          optional :disabled, Docker::Internal::Type::Boolean, api_name: :Disabled

          # @!attribute name
          #   The name or 'alias' to use for the plugin.
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute plugin_privilege
          #
          #   @return [Array<Docker::Models::Spec::TaskTemplate::PluginSpec::PluginPrivilege>, nil]
          optional :plugin_privilege,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege]
                   },
                   api_name: :PluginPrivilege

          # @!attribute remote
          #   The plugin image reference to use.
          #
          #   @return [String, nil]
          optional :remote, String, api_name: :Remote

          # @!method initialize(disabled: nil, name: nil, plugin_privilege: nil, remote: nil)
          #   Plugin spec for the service. _(Experimental release only.)_
          #
          #   <p><br /></p>
          #
          #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          #
          #   @param disabled [Boolean] Disable the plugin once scheduled.
          #
          #   @param name [String] The name or 'alias' to use for the plugin.
          #
          #   @param plugin_privilege [Array<Docker::Models::Spec::TaskTemplate::PluginSpec::PluginPrivilege>]
          #
          #   @param remote [String] The plugin image reference to use.

          class PluginPrivilege < Docker::Internal::Type::BaseModel
            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String, api_name: :Description

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute value
            #
            #   @return [Array<String>, nil]
            optional :value, Docker::Internal::Type::ArrayOf[String], api_name: :Value

            # @!method initialize(description: nil, name: nil, value: nil)
            #   Describes a permission the user has to accept upon installing the plugin.
            #
            #   @param description [String]
            #   @param name [String]
            #   @param value [Array<String>]
          end
        end

        # @see Docker::Models::Spec::TaskTemplate#resources
        class Resources < Docker::Internal::Type::BaseModel
          # @!attribute limits
          #   An object describing a limit on resources which can be requested by a task.
          #
          #   @return [Docker::Models::Spec::TaskTemplate::Resources::Limits, nil]
          optional :limits, -> { Docker::Spec::TaskTemplate::Resources::Limits }, api_name: :Limits

          # @!attribute memory_swappiness
          #   Tune the service's containers' memory swappiness (0 to 100). If not specified,
          #   defaults to the containers' OS' default, generally 60, or whatever value was
          #   predefined in the image. Set to -1 to unset a previously set value.
          #
          #   @return [Integer, nil]
          optional :memory_swappiness, Integer, api_name: :MemorySwappiness, nil?: true

          # @!attribute reservations
          #   An object describing the resources which can be advertised by a node and
          #   requested by a task.
          #
          #   @return [Docker::Models::Spec::TaskTemplate::Resources::Reservations, nil]
          optional :reservations,
                   -> { Docker::Spec::TaskTemplate::Resources::Reservations },
                   api_name: :Reservations

          # @!attribute swap_bytes
          #   Amount of swap in bytes - can only be used together with a memory limit. If not
          #   specified, the default behaviour is to grant a swap space twice as big as the
          #   memory limit. Set to -1 to enable unlimited swap.
          #
          #   @return [Integer, nil]
          optional :swap_bytes, Integer, api_name: :SwapBytes, nil?: true

          # @!method initialize(limits: nil, memory_swappiness: nil, reservations: nil, swap_bytes: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::TaskTemplate::Resources} for more details.
          #
          #   Resource requirements which apply to each individual container created as part
          #   of the service.
          #
          #   @param limits [Docker::Models::Spec::TaskTemplate::Resources::Limits] An object describing a limit on resources which can be requested by a task.
          #
          #   @param memory_swappiness [Integer, nil] Tune the service's containers' memory swappiness (0 to 100).
          #
          #   @param reservations [Docker::Models::Spec::TaskTemplate::Resources::Reservations] An object describing the resources which can be advertised by a node and
          #
          #   @param swap_bytes [Integer, nil] Amount of swap in bytes - can only be used together with a memory limit.

          # @see Docker::Models::Spec::TaskTemplate::Resources#limits
          class Limits < Docker::Internal::Type::BaseModel
            # @!attribute memory_bytes
            #
            #   @return [Integer, nil]
            optional :memory_bytes, Integer, api_name: :MemoryBytes

            # @!attribute nano_cpus
            #
            #   @return [Integer, nil]
            optional :nano_cpus, Integer, api_name: :NanoCPUs

            # @!attribute pids
            #   Limits the maximum number of PIDs in the container. Set `0` for unlimited.
            #
            #   @return [Integer, nil]
            optional :pids, Integer, api_name: :Pids

            # @!method initialize(memory_bytes: nil, nano_cpus: nil, pids: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::Resources::Limits} for more details.
            #
            #   An object describing a limit on resources which can be requested by a task.
            #
            #   @param memory_bytes [Integer]
            #
            #   @param nano_cpus [Integer]
            #
            #   @param pids [Integer] Limits the maximum number of PIDs in the container. Set `0` for unlimited.
          end

          # @see Docker::Models::Spec::TaskTemplate::Resources#reservations
          class Reservations < Docker::Internal::Type::BaseModel
            # @!attribute generic_resources
            #   User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
            #   resources (e.g, `GPU=UUID1`).
            #
            #   @return [Array<Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource>, nil]
            optional :generic_resources,
                     -> {
                       Docker::Internal::Type::ArrayOf[Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource]
                     },
                     api_name: :GenericResources

            # @!attribute memory_bytes
            #
            #   @return [Integer, nil]
            optional :memory_bytes, Integer, api_name: :MemoryBytes

            # @!attribute nano_cpus
            #
            #   @return [Integer, nil]
            optional :nano_cpus, Integer, api_name: :NanoCPUs

            # @!method initialize(generic_resources: nil, memory_bytes: nil, nano_cpus: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::Spec::TaskTemplate::Resources::Reservations} for more details.
            #
            #   An object describing the resources which can be advertised by a node and
            #   requested by a task.
            #
            #   @param generic_resources [Array<Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource>] User-defined resources can be either Integer resources (e.g, `SSD=3`) or
            #
            #   @param memory_bytes [Integer]
            #
            #   @param nano_cpus [Integer]

            class GenericResource < Docker::Internal::Type::BaseModel
              # @!attribute discrete_resource_spec
              #
              #   @return [Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec, nil]
              optional :discrete_resource_spec,
                       -> {
                         Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec
                       },
                       api_name: :DiscreteResourceSpec

              # @!attribute named_resource_spec
              #
              #   @return [Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec, nil]
              optional :named_resource_spec,
                       -> {
                         Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec
                       },
                       api_name: :NamedResourceSpec

              # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
              #   @param discrete_resource_spec [Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec]
              #   @param named_resource_spec [Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec]

              # @see Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource#discrete_resource_spec
              class DiscreteResourceSpec < Docker::Internal::Type::BaseModel
                # @!attribute kind
                #
                #   @return [String, nil]
                optional :kind, String, api_name: :Kind

                # @!attribute value
                #
                #   @return [Integer, nil]
                optional :value, Integer, api_name: :Value

                # @!method initialize(kind: nil, value: nil)
                #   @param kind [String]
                #   @param value [Integer]
              end

              # @see Docker::Models::Spec::TaskTemplate::Resources::Reservations::GenericResource#named_resource_spec
              class NamedResourceSpec < Docker::Internal::Type::BaseModel
                # @!attribute kind
                #
                #   @return [String, nil]
                optional :kind, String, api_name: :Kind

                # @!attribute value
                #
                #   @return [String, nil]
                optional :value, String, api_name: :Value

                # @!method initialize(kind: nil, value: nil)
                #   @param kind [String]
                #   @param value [String]
              end
            end
          end
        end

        # @see Docker::Models::Spec::TaskTemplate#restart_policy
        class RestartPolicy < Docker::Internal::Type::BaseModel
          # @!attribute condition
          #   Condition for restart.
          #
          #   @return [Symbol, Docker::Models::Spec::TaskTemplate::RestartPolicy::Condition, nil]
          optional :condition,
                   enum: -> { Docker::Spec::TaskTemplate::RestartPolicy::Condition },
                   api_name: :Condition

          # @!attribute delay
          #   Delay between restart attempts.
          #
          #   @return [Integer, nil]
          optional :delay, Integer, api_name: :Delay

          # @!attribute max_attempts
          #   Maximum attempts to restart a given container before giving up (default value is
          #   0, which is ignored).
          #
          #   @return [Integer, nil]
          optional :max_attempts, Integer, api_name: :MaxAttempts

          # @!attribute window
          #   Windows is the time window used to evaluate the restart policy (default value is
          #   0, which is unbounded).
          #
          #   @return [Integer, nil]
          optional :window, Integer, api_name: :Window

          # @!method initialize(condition: nil, delay: nil, max_attempts: nil, window: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::Spec::TaskTemplate::RestartPolicy} for more details.
          #
          #   Specification for the restart policy which applies to containers created as part
          #   of this service.
          #
          #   @param condition [Symbol, Docker::Models::Spec::TaskTemplate::RestartPolicy::Condition] Condition for restart.
          #
          #   @param delay [Integer] Delay between restart attempts.
          #
          #   @param max_attempts [Integer] Maximum attempts to restart a given container before giving up
          #
          #   @param window [Integer] Windows is the time window used to evaluate the restart policy

          # Condition for restart.
          #
          # @see Docker::Models::Spec::TaskTemplate::RestartPolicy#condition
          module Condition
            extend Docker::Internal::Type::Enum

            NONE = :none
            ON_FAILURE = :"on-failure"
            ANY = :any

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see Docker::Models::Spec#update_config
      class UpdateConfig < Docker::Internal::Type::BaseModel
        # @!attribute delay
        #   Amount of time between updates, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #   Action to take if an updated task fails to run, or stops running during the
        #   update.
        #
        #   @return [Symbol, Docker::Models::Spec::UpdateConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> {
                   Docker::Spec::UpdateConfig::FailureAction
                 },
                 api_name: :FailureAction

        # @!attribute max_failure_ratio
        #   The fraction of tasks that may fail during an update before the failure action
        #   is invoked, specified as a floating point number between 0 and 1.
        #
        #   @return [Float, nil]
        optional :max_failure_ratio, Float, api_name: :MaxFailureRatio

        # @!attribute monitor
        #   Amount of time to monitor each updated task for failures, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :monitor, Integer, api_name: :Monitor

        # @!attribute order
        #   The order of operations when rolling out an updated task. Either the old task is
        #   shut down before the new task is started, or the new task is started before the
        #   old task is shut down.
        #
        #   @return [Symbol, Docker::Models::Spec::UpdateConfig::Order, nil]
        optional :order, enum: -> { Docker::Spec::UpdateConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #   Maximum number of tasks to be updated in one iteration (0 means unlimited
        #   parallelism).
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Spec::UpdateConfig} for more details.
        #
        #   Specification for the update strategy of the service.
        #
        #   @param delay [Integer] Amount of time between updates, in nanoseconds.
        #
        #   @param failure_action [Symbol, Docker::Models::Spec::UpdateConfig::FailureAction] Action to take if an updated task fails to run, or stops running
        #
        #   @param max_failure_ratio [Float] The fraction of tasks that may fail during an update before the
        #
        #   @param monitor [Integer] Amount of time to monitor each updated task for failures, in
        #
        #   @param order [Symbol, Docker::Models::Spec::UpdateConfig::Order] The order of operations when rolling out an updated task. Either
        #
        #   @param parallelism [Integer] Maximum number of tasks to be updated in one iteration (0 means

        # Action to take if an updated task fails to run, or stops running during the
        # update.
        #
        # @see Docker::Models::Spec::UpdateConfig#failure_action
        module FailureAction
          extend Docker::Internal::Type::Enum

          CONTINUE = :continue
          PAUSE = :pause
          ROLLBACK = :rollback

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The order of operations when rolling out an updated task. Either the old task is
        # shut down before the new task is started, or the new task is started before the
        # old task is shut down.
        #
        # @see Docker::Models::Spec::UpdateConfig#order
        module Order
          extend Docker::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
