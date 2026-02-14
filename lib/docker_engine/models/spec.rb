# frozen_string_literal: true

module DockerEngine
  module Models
    class Spec < DockerEngine::Internal::Type::BaseModel
      # @!attribute endpoint_spec
      #   Properties that can be configured to access and load balance a service.
      #
      #   @return [DockerEngine::Models::Spec::EndpointSpec, nil]
      optional :endpoint_spec, -> { DockerEngine::Spec::EndpointSpec }, api_name: :EndpointSpec

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngine::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute mode
      #   Scheduling mode for the service.
      #
      #   @return [DockerEngine::Models::Spec::Mode, nil]
      optional :mode, -> { DockerEngine::Spec::Mode }, api_name: :Mode

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
      #   @return [Array<DockerEngine::Models::Spec::Network>, nil]
      optional :networks,
               -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Spec::Network] },
               api_name: :Networks

      # @!attribute rollback_config
      #   Specification for the rollback strategy of the service.
      #
      #   @return [DockerEngine::Models::Spec::RollbackConfig, nil]
      optional :rollback_config, -> { DockerEngine::Spec::RollbackConfig }, api_name: :RollbackConfig

      # @!attribute task_template
      #   User modifiable task configuration.
      #
      #   @return [DockerEngine::Models::Spec, nil]
      optional :task_template, -> { DockerEngine::Spec }, api_name: :TaskTemplate

      # @!attribute update_config
      #   Specification for the update strategy of the service.
      #
      #   @return [DockerEngine::Models::Spec::UpdateConfig, nil]
      optional :update_config, -> { DockerEngine::Spec::UpdateConfig }, api_name: :UpdateConfig

      # @!method initialize(endpoint_spec: nil, labels: nil, mode: nil, name: nil, networks: nil, rollback_config: nil, task_template: nil, update_config: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::Spec} for more details.
      #
      #   User modifiable configuration for a service.
      #
      #   @param endpoint_spec [DockerEngine::Models::Spec::EndpointSpec] Properties that can be configured to access and load balance a service.
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param mode [DockerEngine::Models::Spec::Mode] Scheduling mode for the service.
      #
      #   @param name [String] Name of the service.
      #
      #   @param networks [Array<DockerEngine::Models::Spec::Network>] Specifies which networks the service should attach to.
      #
      #   @param rollback_config [DockerEngine::Models::Spec::RollbackConfig] Specification for the rollback strategy of the service.
      #
      #   @param task_template [DockerEngine::Models::Spec] User modifiable task configuration.
      #
      #   @param update_config [DockerEngine::Models::Spec::UpdateConfig] Specification for the update strategy of the service.

      # @see DockerEngine::Models::Spec#endpoint_spec
      class EndpointSpec < DockerEngine::Internal::Type::BaseModel
        # @!attribute mode
        #   The mode of resolution to use for internal load balancing between tasks.
        #
        #   @return [Symbol, DockerEngine::Models::Spec::EndpointSpec::Mode, nil]
        optional :mode, enum: -> { DockerEngine::Spec::EndpointSpec::Mode }, api_name: :Mode

        # @!attribute ports
        #   List of exposed ports that this service is accessible on from the outside. Ports
        #   can only be provided if `vip` resolution mode is used.
        #
        #   @return [Array<DockerEngine::Models::Spec::EndpointSpec::Port>, nil]
        optional :ports,
                 -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Spec::EndpointSpec::Port] },
                 api_name: :Ports

        # @!method initialize(mode: nil, ports: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Spec::EndpointSpec} for more details.
        #
        #   Properties that can be configured to access and load balance a service.
        #
        #   @param mode [Symbol, DockerEngine::Models::Spec::EndpointSpec::Mode] The mode of resolution to use for internal load balancing between tasks.
        #
        #   @param ports [Array<DockerEngine::Models::Spec::EndpointSpec::Port>] List of exposed ports that this service is accessible on from the

        # The mode of resolution to use for internal load balancing between tasks.
        #
        # @see DockerEngine::Models::Spec::EndpointSpec#mode
        module Mode
          extend DockerEngine::Internal::Type::Enum

          VIP = :vip
          DNSRR = :dnsrr

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Port < DockerEngine::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute protocol
          #
          #   @return [Symbol, DockerEngine::Models::Spec::EndpointSpec::Port::Protocol, nil]
          optional :protocol,
                   enum: -> {
                     DockerEngine::Spec::EndpointSpec::Port::Protocol
                   },
                   api_name: :Protocol

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
          #   @return [Symbol, DockerEngine::Models::Spec::EndpointSpec::Port::PublishMode, nil]
          optional :publish_mode,
                   enum: -> { DockerEngine::Spec::EndpointSpec::Port::PublishMode },
                   api_name: :PublishMode

          # @!attribute target_port
          #   The port inside the container.
          #
          #   @return [Integer, nil]
          optional :target_port, Integer, api_name: :TargetPort

          # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngine::Models::Spec::EndpointSpec::Port} for more details.
          #
          #   @param name [String]
          #
          #   @param protocol [Symbol, DockerEngine::Models::Spec::EndpointSpec::Port::Protocol]
          #
          #   @param published_port [Integer] The port on the swarm hosts.
          #
          #   @param publish_mode [Symbol, DockerEngine::Models::Spec::EndpointSpec::Port::PublishMode] The mode in which port is published.
          #
          #   @param target_port [Integer] The port inside the container.

          # @see DockerEngine::Models::Spec::EndpointSpec::Port#protocol
          module Protocol
            extend DockerEngine::Internal::Type::Enum

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
          # @see DockerEngine::Models::Spec::EndpointSpec::Port#publish_mode
          module PublishMode
            extend DockerEngine::Internal::Type::Enum

            INGRESS = :ingress
            HOST = :host

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see DockerEngine::Models::Spec#mode
      class Mode < DockerEngine::Internal::Type::BaseModel
        # @!attribute global
        #
        #   @return [Object, nil]
        optional :global, DockerEngine::Internal::Type::Unknown, api_name: :Global

        # @!attribute global_job
        #   The mode used for services which run a task to the completed state on each valid
        #   node.
        #
        #   @return [Object, nil]
        optional :global_job, DockerEngine::Internal::Type::Unknown, api_name: :GlobalJob

        # @!attribute replicated
        #
        #   @return [DockerEngine::Models::Spec::Mode::Replicated, nil]
        optional :replicated, -> { DockerEngine::Spec::Mode::Replicated }, api_name: :Replicated

        # @!attribute replicated_job
        #   The mode used for services with a finite number of tasks that run to a completed
        #   state.
        #
        #   @return [DockerEngine::Models::Spec::Mode::ReplicatedJob, nil]
        optional :replicated_job, -> { DockerEngine::Spec::Mode::ReplicatedJob }, api_name: :ReplicatedJob

        # @!method initialize(global: nil, global_job: nil, replicated: nil, replicated_job: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Spec::Mode} for more details.
        #
        #   Scheduling mode for the service.
        #
        #   @param global [Object]
        #
        #   @param global_job [Object] The mode used for services which run a task to the completed state
        #
        #   @param replicated [DockerEngine::Models::Spec::Mode::Replicated]
        #
        #   @param replicated_job [DockerEngine::Models::Spec::Mode::ReplicatedJob] The mode used for services with a finite number of tasks that run

        # @see DockerEngine::Models::Spec::Mode#replicated
        class Replicated < DockerEngine::Internal::Type::BaseModel
          # @!attribute replicas
          #
          #   @return [Integer, nil]
          optional :replicas, Integer, api_name: :Replicas

          # @!method initialize(replicas: nil)
          #   @param replicas [Integer]
        end

        # @see DockerEngine::Models::Spec::Mode#replicated_job
        class ReplicatedJob < DockerEngine::Internal::Type::BaseModel
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
          #   {DockerEngine::Models::Spec::Mode::ReplicatedJob} for more details.
          #
          #   The mode used for services with a finite number of tasks that run to a completed
          #   state.
          #
          #   @param max_concurrent [Integer] The maximum number of replicas to run simultaneously.
          #
          #   @param total_completions [Integer] The total number of replicas desired to reach the Completed
        end
      end

      class Network < DockerEngine::Internal::Type::BaseModel
        # @!attribute aliases
        #   Discoverable alternate names for the service on this network.
        #
        #   @return [Array<String>, nil]
        optional :aliases, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Aliases

        # @!attribute driver_opts
        #   Driver attachment options for the network target.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :driver_opts, DockerEngine::Internal::Type::HashOf[String], api_name: :DriverOpts

        # @!attribute target
        #   The target network for attachment. Must be a network name or ID.
        #
        #   @return [String, nil]
        optional :target, String, api_name: :Target

        # @!method initialize(aliases: nil, driver_opts: nil, target: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Spec::Network} for more details.
        #
        #   Specifies how a service should be attached to a particular network.
        #
        #   @param aliases [Array<String>] Discoverable alternate names for the service on this network.
        #
        #   @param driver_opts [Hash{Symbol=>String}] Driver attachment options for the network target.
        #
        #   @param target [String] The target network for attachment. Must be a network name or ID.
      end

      # @see DockerEngine::Models::Spec#rollback_config
      class RollbackConfig < DockerEngine::Internal::Type::BaseModel
        # @!attribute delay
        #   Amount of time between rollback iterations, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #   Action to take if an rolled back task fails to run, or stops running during the
        #   rollback.
        #
        #   @return [Symbol, DockerEngine::Models::Spec::RollbackConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> { DockerEngine::Spec::RollbackConfig::FailureAction },
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
        #   @return [Symbol, DockerEngine::Models::Spec::RollbackConfig::Order, nil]
        optional :order, enum: -> { DockerEngine::Spec::RollbackConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #   Maximum number of tasks to be rolled back in one iteration (0 means unlimited
        #   parallelism).
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Spec::RollbackConfig} for more details.
        #
        #   Specification for the rollback strategy of the service.
        #
        #   @param delay [Integer] Amount of time between rollback iterations, in nanoseconds.
        #
        #   @param failure_action [Symbol, DockerEngine::Models::Spec::RollbackConfig::FailureAction] Action to take if an rolled back task fails to run, or stops
        #
        #   @param max_failure_ratio [Float] The fraction of tasks that may fail during a rollback before the
        #
        #   @param monitor [Integer] Amount of time to monitor each rolled back task for failures, in
        #
        #   @param order [Symbol, DockerEngine::Models::Spec::RollbackConfig::Order] The order of operations when rolling back a task. Either the old
        #
        #   @param parallelism [Integer] Maximum number of tasks to be rolled back in one iteration (0 means

        # Action to take if an rolled back task fails to run, or stops running during the
        # rollback.
        #
        # @see DockerEngine::Models::Spec::RollbackConfig#failure_action
        module FailureAction
          extend DockerEngine::Internal::Type::Enum

          CONTINUE = :continue
          PAUSE = :pause

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The order of operations when rolling back a task. Either the old task is shut
        # down before the new task is started, or the new task is started before the old
        # task is shut down.
        #
        # @see DockerEngine::Models::Spec::RollbackConfig#order
        module Order
          extend DockerEngine::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngine::Models::Spec#update_config
      class UpdateConfig < DockerEngine::Internal::Type::BaseModel
        # @!attribute delay
        #   Amount of time between updates, in nanoseconds.
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #   Action to take if an updated task fails to run, or stops running during the
        #   update.
        #
        #   @return [Symbol, DockerEngine::Models::Spec::UpdateConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> { DockerEngine::Spec::UpdateConfig::FailureAction },
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
        #   @return [Symbol, DockerEngine::Models::Spec::UpdateConfig::Order, nil]
        optional :order, enum: -> { DockerEngine::Spec::UpdateConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #   Maximum number of tasks to be updated in one iteration (0 means unlimited
        #   parallelism).
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Spec::UpdateConfig} for more details.
        #
        #   Specification for the update strategy of the service.
        #
        #   @param delay [Integer] Amount of time between updates, in nanoseconds.
        #
        #   @param failure_action [Symbol, DockerEngine::Models::Spec::UpdateConfig::FailureAction] Action to take if an updated task fails to run, or stops running
        #
        #   @param max_failure_ratio [Float] The fraction of tasks that may fail during an update before the
        #
        #   @param monitor [Integer] Amount of time to monitor each updated task for failures, in
        #
        #   @param order [Symbol, DockerEngine::Models::Spec::UpdateConfig::Order] The order of operations when rolling out an updated task. Either
        #
        #   @param parallelism [Integer] Maximum number of tasks to be updated in one iteration (0 means

        # Action to take if an updated task fails to run, or stops running during the
        # update.
        #
        # @see DockerEngine::Models::Spec::UpdateConfig#failure_action
        module FailureAction
          extend DockerEngine::Internal::Type::Enum

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
        # @see DockerEngine::Models::Spec::UpdateConfig#order
        module Order
          extend DockerEngine::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
