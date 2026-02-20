# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class ServiceSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute endpoint_spec
      #   Properties that can be configured to access and load balance a service.
      #
      #   @return [DockerEngineRuby::Models::ServiceSpec::EndpointSpec, nil]
      optional :endpoint_spec, -> { DockerEngineRuby::ServiceSpec::EndpointSpec }, api_name: :EndpointSpec

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute mode
      #   Scheduling mode for the service.
      #
      #   @return [DockerEngineRuby::Models::ServiceSpec::Mode, nil]
      optional :mode, -> { DockerEngineRuby::ServiceSpec::Mode }, api_name: :Mode

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
      #   @return [Array<DockerEngineRuby::Models::ServiceSpec::Network>, nil]
      optional :networks,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ServiceSpec::Network] },
               api_name: :Networks

      # @!attribute rollback_config
      #   Specification for the rollback strategy of the service.
      #
      #   @return [DockerEngineRuby::Models::ServiceSpec::RollbackConfig, nil]
      optional :rollback_config,
               -> {
                 DockerEngineRuby::ServiceSpec::RollbackConfig
               },
               api_name: :RollbackConfig

      # @!attribute task_template
      #   User modifiable task configuration.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec, nil]
      optional :task_template, -> { DockerEngineRuby::TaskSpec }, api_name: :TaskTemplate

      # @!attribute update_config
      #   Specification for the update strategy of the service.
      #
      #   @return [DockerEngineRuby::Models::ServiceSpec::UpdateConfig, nil]
      optional :update_config, -> { DockerEngineRuby::ServiceSpec::UpdateConfig }, api_name: :UpdateConfig

      # @!method initialize(endpoint_spec: nil, labels: nil, mode: nil, name: nil, networks: nil, rollback_config: nil, task_template: nil, update_config: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ServiceSpec} for more details.
      #
      #   User modifiable configuration for a service.
      #
      #   @param endpoint_spec [DockerEngineRuby::Models::ServiceSpec::EndpointSpec] Properties that can be configured to access and load balance a service.
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param mode [DockerEngineRuby::Models::ServiceSpec::Mode] Scheduling mode for the service.
      #
      #   @param name [String] Name of the service.
      #
      #   @param networks [Array<DockerEngineRuby::Models::ServiceSpec::Network>] Specifies which networks the service should attach to.
      #
      #   @param rollback_config [DockerEngineRuby::Models::ServiceSpec::RollbackConfig] Specification for the rollback strategy of the service.
      #
      #   @param task_template [DockerEngineRuby::Models::TaskSpec] User modifiable task configuration.
      #
      #   @param update_config [DockerEngineRuby::Models::ServiceSpec::UpdateConfig] Specification for the update strategy of the service.

      # @see DockerEngineRuby::Models::ServiceSpec#endpoint_spec
      class EndpointSpec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute mode
        #   The mode of resolution to use for internal load balancing between tasks.
        #
        #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Mode, nil]
        optional :mode, enum: -> { DockerEngineRuby::ServiceSpec::EndpointSpec::Mode }, api_name: :Mode

        # @!attribute ports
        #   List of exposed ports that this service is accessible on from the outside. Ports
        #   can only be provided if `vip` resolution mode is used.
        #
        #   @return [Array<DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port>, nil]
        optional :ports,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ServiceSpec::EndpointSpec::Port]
                 },
                 api_name: :Ports

        # @!method initialize(mode: nil, ports: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::ServiceSpec::EndpointSpec} for more details.
        #
        #   Properties that can be configured to access and load balance a service.
        #
        #   @param mode [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Mode] The mode of resolution to use for internal load balancing between tasks.
        #
        #   @param ports [Array<DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port>] List of exposed ports that this service is accessible on from the

        # The mode of resolution to use for internal load balancing between tasks.
        #
        # @see DockerEngineRuby::Models::ServiceSpec::EndpointSpec#mode
        module Mode
          extend DockerEngineRuby::Internal::Type::Enum

          VIP = :vip
          DNSRR = :dnsrr

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Port < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute protocol
          #
          #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port::Protocol, nil]
          optional :protocol,
                   enum: -> { DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol },
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
          #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port::PublishMode, nil]
          optional :publish_mode,
                   enum: -> { DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode },
                   api_name: :PublishMode

          # @!attribute target_port
          #   The port inside the container.
          #
          #   @return [Integer, nil]
          optional :target_port, Integer, api_name: :TargetPort

          # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port} for more details.
          #
          #   @param name [String]
          #
          #   @param protocol [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port::Protocol]
          #
          #   @param published_port [Integer] The port on the swarm hosts.
          #
          #   @param publish_mode [Symbol, DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port::PublishMode] The mode in which port is published.
          #
          #   @param target_port [Integer] The port inside the container.

          # @see DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port#protocol
          module Protocol
            extend DockerEngineRuby::Internal::Type::Enum

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
          # @see DockerEngineRuby::Models::ServiceSpec::EndpointSpec::Port#publish_mode
          module PublishMode
            extend DockerEngineRuby::Internal::Type::Enum

            INGRESS = :ingress
            HOST = :host

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see DockerEngineRuby::Models::ServiceSpec#mode
      class Mode < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute global
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :global,
                 DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :Global

        # @!attribute global_job
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :global_job,
                 DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :GlobalJob

        # @!attribute replicated
        #
        #   @return [DockerEngineRuby::Models::ServiceSpec::Mode::Replicated, nil]
        optional :replicated, -> { DockerEngineRuby::ServiceSpec::Mode::Replicated }, api_name: :Replicated

        # @!attribute replicated_job
        #
        #   @return [DockerEngineRuby::Models::ServiceSpec::Mode::ReplicatedJob, nil]
        optional :replicated_job,
                 -> { DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob },
                 api_name: :ReplicatedJob

        # @!method initialize(global: nil, global_job: nil, replicated: nil, replicated_job: nil)
        #   Scheduling mode for the service.
        #
        #   @param global [Hash{Symbol=>Object}]
        #   @param global_job [Hash{Symbol=>Object}]
        #   @param replicated [DockerEngineRuby::Models::ServiceSpec::Mode::Replicated]
        #   @param replicated_job [DockerEngineRuby::Models::ServiceSpec::Mode::ReplicatedJob]

        # @see DockerEngineRuby::Models::ServiceSpec::Mode#replicated
        class Replicated < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute replicas
          #
          #   @return [Integer, nil]
          optional :replicas, Integer, api_name: :Replicas

          # @!method initialize(replicas: nil)
          #   @param replicas [Integer]
        end

        # @see DockerEngineRuby::Models::ServiceSpec::Mode#replicated_job
        class ReplicatedJob < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute max_concurrent
          #
          #   @return [Integer, nil]
          optional :max_concurrent, Integer, api_name: :MaxConcurrent

          # @!attribute total_completions
          #
          #   @return [Integer, nil]
          optional :total_completions, Integer, api_name: :TotalCompletions

          # @!method initialize(max_concurrent: nil, total_completions: nil)
          #   @param max_concurrent [Integer]
          #   @param total_completions [Integer]
        end
      end

      class Network < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute aliases
        #   Discoverable alternate names for the service on this network.
        #
        #   @return [Array<String>, nil]
        optional :aliases, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Aliases

        # @!attribute driver_opts
        #   Driver attachment options for the network target.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :driver_opts, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :DriverOpts

        # @!attribute target
        #   The target network for attachment. Must be a network name or ID.
        #
        #   @return [String, nil]
        optional :target, String, api_name: :Target

        # @!method initialize(aliases: nil, driver_opts: nil, target: nil)
        #   Specifies how a service should be attached to a particular network.
        #
        #   @param aliases [Array<String>] Discoverable alternate names for the service on this network.
        #
        #   @param driver_opts [Hash{Symbol=>String}] Driver attachment options for the network target.
        #
        #   @param target [String] The target network for attachment. Must be a network name or ID.
      end

      # @see DockerEngineRuby::Models::ServiceSpec#rollback_config
      class RollbackConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute delay
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #
        #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::RollbackConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> { DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction },
                 api_name: :FailureAction

        # @!attribute max_failure_ratio
        #
        #   @return [Float, nil]
        optional :max_failure_ratio, Float, api_name: :MaxFailureRatio

        # @!attribute monitor
        #
        #   @return [Integer, nil]
        optional :monitor, Integer, api_name: :Monitor

        # @!attribute order
        #
        #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::RollbackConfig::Order, nil]
        optional :order, enum: -> { DockerEngineRuby::ServiceSpec::RollbackConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Specification for the rollback strategy of the service.
        #
        #   @param delay [Integer]
        #   @param failure_action [Symbol, DockerEngineRuby::Models::ServiceSpec::RollbackConfig::FailureAction]
        #   @param max_failure_ratio [Float]
        #   @param monitor [Integer]
        #   @param order [Symbol, DockerEngineRuby::Models::ServiceSpec::RollbackConfig::Order]
        #   @param parallelism [Integer]

        # @see DockerEngineRuby::Models::ServiceSpec::RollbackConfig#failure_action
        module FailureAction
          extend DockerEngineRuby::Internal::Type::Enum

          CONTINUE = :continue
          PAUSE = :pause

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see DockerEngineRuby::Models::ServiceSpec::RollbackConfig#order
        module Order
          extend DockerEngineRuby::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineRuby::Models::ServiceSpec#update_config
      class UpdateConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute delay
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute failure_action
        #
        #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::UpdateConfig::FailureAction, nil]
        optional :failure_action,
                 enum: -> { DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction },
                 api_name: :FailureAction

        # @!attribute max_failure_ratio
        #
        #   @return [Float, nil]
        optional :max_failure_ratio, Float, api_name: :MaxFailureRatio

        # @!attribute monitor
        #
        #   @return [Integer, nil]
        optional :monitor, Integer, api_name: :Monitor

        # @!attribute order
        #
        #   @return [Symbol, DockerEngineRuby::Models::ServiceSpec::UpdateConfig::Order, nil]
        optional :order, enum: -> { DockerEngineRuby::ServiceSpec::UpdateConfig::Order }, api_name: :Order

        # @!attribute parallelism
        #
        #   @return [Integer, nil]
        optional :parallelism, Integer, api_name: :Parallelism

        # @!method initialize(delay: nil, failure_action: nil, max_failure_ratio: nil, monitor: nil, order: nil, parallelism: nil)
        #   Specification for the update strategy of the service.
        #
        #   @param delay [Integer]
        #   @param failure_action [Symbol, DockerEngineRuby::Models::ServiceSpec::UpdateConfig::FailureAction]
        #   @param max_failure_ratio [Float]
        #   @param monitor [Integer]
        #   @param order [Symbol, DockerEngineRuby::Models::ServiceSpec::UpdateConfig::Order]
        #   @param parallelism [Integer]

        # @see DockerEngineRuby::Models::ServiceSpec::UpdateConfig#failure_action
        module FailureAction
          extend DockerEngineRuby::Internal::Type::Enum

          CONTINUE = :continue
          PAUSE = :pause
          ROLLBACK = :rollback

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see DockerEngineRuby::Models::ServiceSpec::UpdateConfig#order
        module Order
          extend DockerEngineRuby::Internal::Type::Enum

          STOP_FIRST = :"stop-first"
          START_FIRST = :"start-first"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
