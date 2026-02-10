# typed: strong

module Docker
  module Models
    class Spec < Docker::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Docker::Spec, Docker::Internal::AnyHash) }

      # Properties that can be configured to access and load balance a service.
      sig { returns(T.nilable(Docker::Spec::EndpointSpec)) }
      attr_reader :endpoint_spec

      sig { params(endpoint_spec: Docker::Spec::EndpointSpec::OrHash).void }
      attr_writer :endpoint_spec

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Scheduling mode for the service.
      sig { returns(T.nilable(Docker::Spec::Mode)) }
      attr_reader :mode

      sig { params(mode: Docker::Spec::Mode::OrHash).void }
      attr_writer :mode

      # Name of the service.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Specifies which networks the service should attach to.
      #
      # Deprecated: This field is deprecated since v1.44. The Networks field in TaskSpec
      # should be used instead.
      sig { returns(T.nilable(T::Array[Docker::Spec::Network])) }
      attr_reader :networks

      sig { params(networks: T::Array[Docker::Spec::Network::OrHash]).void }
      attr_writer :networks

      # Specification for the rollback strategy of the service.
      sig { returns(T.nilable(Docker::Spec::RollbackConfig)) }
      attr_reader :rollback_config

      sig { params(rollback_config: Docker::Spec::RollbackConfig::OrHash).void }
      attr_writer :rollback_config

      # User modifiable task configuration.
      sig { returns(T.nilable(Docker::Spec::TaskTemplate)) }
      attr_reader :task_template

      sig { params(task_template: Docker::Spec::TaskTemplate::OrHash).void }
      attr_writer :task_template

      # Specification for the update strategy of the service.
      sig { returns(T.nilable(Docker::Spec::UpdateConfig)) }
      attr_reader :update_config

      sig { params(update_config: Docker::Spec::UpdateConfig::OrHash).void }
      attr_writer :update_config

      # User modifiable configuration for a service.
      sig do
        params(
          endpoint_spec: Docker::Spec::EndpointSpec::OrHash,
          labels: T::Hash[Symbol, String],
          mode: Docker::Spec::Mode::OrHash,
          name: String,
          networks: T::Array[Docker::Spec::Network::OrHash],
          rollback_config: Docker::Spec::RollbackConfig::OrHash,
          task_template: Docker::Spec::TaskTemplate::OrHash,
          update_config: Docker::Spec::UpdateConfig::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Properties that can be configured to access and load balance a service.
        endpoint_spec: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Scheduling mode for the service.
        mode: nil,
        # Name of the service.
        name: nil,
        # Specifies which networks the service should attach to.
        #
        # Deprecated: This field is deprecated since v1.44. The Networks field in TaskSpec
        # should be used instead.
        networks: nil,
        # Specification for the rollback strategy of the service.
        rollback_config: nil,
        # User modifiable task configuration.
        task_template: nil,
        # Specification for the update strategy of the service.
        update_config: nil
      )
      end

      sig do
        override.returns(
          {
            endpoint_spec: Docker::Spec::EndpointSpec,
            labels: T::Hash[Symbol, String],
            mode: Docker::Spec::Mode,
            name: String,
            networks: T::Array[Docker::Spec::Network],
            rollback_config: Docker::Spec::RollbackConfig,
            task_template: Docker::Spec::TaskTemplate,
            update_config: Docker::Spec::UpdateConfig
          }
        )
      end
      def to_hash
      end

      class EndpointSpec < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Docker::Spec::EndpointSpec, Docker::Internal::AnyHash)
          end

        # The mode of resolution to use for internal load balancing between tasks.
        sig { returns(T.nilable(Docker::Spec::EndpointSpec::Mode::OrSymbol)) }
        attr_reader :mode

        sig { params(mode: Docker::Spec::EndpointSpec::Mode::OrSymbol).void }
        attr_writer :mode

        # List of exposed ports that this service is accessible on from the outside. Ports
        # can only be provided if `vip` resolution mode is used.
        sig { returns(T.nilable(T::Array[Docker::Spec::EndpointSpec::Port])) }
        attr_reader :ports

        sig do
          params(ports: T::Array[Docker::Spec::EndpointSpec::Port::OrHash]).void
        end
        attr_writer :ports

        # Properties that can be configured to access and load balance a service.
        sig do
          params(
            mode: Docker::Spec::EndpointSpec::Mode::OrSymbol,
            ports: T::Array[Docker::Spec::EndpointSpec::Port::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The mode of resolution to use for internal load balancing between tasks.
          mode: nil,
          # List of exposed ports that this service is accessible on from the outside. Ports
          # can only be provided if `vip` resolution mode is used.
          ports: nil
        )
        end

        sig do
          override.returns(
            {
              mode: Docker::Spec::EndpointSpec::Mode::OrSymbol,
              ports: T::Array[Docker::Spec::EndpointSpec::Port]
            }
          )
        end
        def to_hash
        end

        # The mode of resolution to use for internal load balancing between tasks.
        module Mode
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Docker::Spec::EndpointSpec::Mode) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VIP = T.let(:vip, Docker::Spec::EndpointSpec::Mode::TaggedSymbol)
          DNSRR = T.let(:dnsrr, Docker::Spec::EndpointSpec::Mode::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Docker::Spec::EndpointSpec::Mode::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Port < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Docker::Spec::EndpointSpec::Port, Docker::Internal::AnyHash)
            end

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            returns(
              T.nilable(Docker::Spec::EndpointSpec::Port::Protocol::OrSymbol)
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol: Docker::Spec::EndpointSpec::Port::Protocol::OrSymbol
            ).void
          end
          attr_writer :protocol

          # The port on the swarm hosts.
          sig { returns(T.nilable(Integer)) }
          attr_reader :published_port

          sig { params(published_port: Integer).void }
          attr_writer :published_port

          # The mode in which port is published.
          #
          # <p><br /></p>
          #
          # - "ingress" makes the target port accessible on every node, regardless of
          #   whether there is a task for the service running on that node or not.
          # - "host" bypasses the routing mesh and publish the port directly on the swarm
          #   node where that service is running.
          sig do
            returns(
              T.nilable(Docker::Spec::EndpointSpec::Port::PublishMode::OrSymbol)
            )
          end
          attr_reader :publish_mode

          sig do
            params(
              publish_mode:
                Docker::Spec::EndpointSpec::Port::PublishMode::OrSymbol
            ).void
          end
          attr_writer :publish_mode

          # The port inside the container.
          sig { returns(T.nilable(Integer)) }
          attr_reader :target_port

          sig { params(target_port: Integer).void }
          attr_writer :target_port

          sig do
            params(
              name: String,
              protocol: Docker::Spec::EndpointSpec::Port::Protocol::OrSymbol,
              published_port: Integer,
              publish_mode:
                Docker::Spec::EndpointSpec::Port::PublishMode::OrSymbol,
              target_port: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            name: nil,
            protocol: nil,
            # The port on the swarm hosts.
            published_port: nil,
            # The mode in which port is published.
            #
            # <p><br /></p>
            #
            # - "ingress" makes the target port accessible on every node, regardless of
            #   whether there is a task for the service running on that node or not.
            # - "host" bypasses the routing mesh and publish the port directly on the swarm
            #   node where that service is running.
            publish_mode: nil,
            # The port inside the container.
            target_port: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                protocol: Docker::Spec::EndpointSpec::Port::Protocol::OrSymbol,
                published_port: Integer,
                publish_mode:
                  Docker::Spec::EndpointSpec::Port::PublishMode::OrSymbol,
                target_port: Integer
              }
            )
          end
          def to_hash
          end

          module Protocol
            extend Docker::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Docker::Spec::EndpointSpec::Port::Protocol)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TCP =
              T.let(
                :tcp,
                Docker::Spec::EndpointSpec::Port::Protocol::TaggedSymbol
              )
            UDP =
              T.let(
                :udp,
                Docker::Spec::EndpointSpec::Port::Protocol::TaggedSymbol
              )
            SCTP =
              T.let(
                :sctp,
                Docker::Spec::EndpointSpec::Port::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Docker::Spec::EndpointSpec::Port::Protocol::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The mode in which port is published.
          #
          # <p><br /></p>
          #
          # - "ingress" makes the target port accessible on every node, regardless of
          #   whether there is a task for the service running on that node or not.
          # - "host" bypasses the routing mesh and publish the port directly on the swarm
          #   node where that service is running.
          module PublishMode
            extend Docker::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Docker::Spec::EndpointSpec::Port::PublishMode)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INGRESS =
              T.let(
                :ingress,
                Docker::Spec::EndpointSpec::Port::PublishMode::TaggedSymbol
              )
            HOST =
              T.let(
                :host,
                Docker::Spec::EndpointSpec::Port::PublishMode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Docker::Spec::EndpointSpec::Port::PublishMode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Mode < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(Docker::Spec::Mode, Docker::Internal::AnyHash) }

        sig { returns(T.nilable(T.anything)) }
        attr_reader :global

        sig { params(global: T.anything).void }
        attr_writer :global

        # The mode used for services which run a task to the completed state on each valid
        # node.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :global_job

        sig { params(global_job: T.anything).void }
        attr_writer :global_job

        sig { returns(T.nilable(Docker::Spec::Mode::Replicated)) }
        attr_reader :replicated

        sig { params(replicated: Docker::Spec::Mode::Replicated::OrHash).void }
        attr_writer :replicated

        # The mode used for services with a finite number of tasks that run to a completed
        # state.
        sig { returns(T.nilable(Docker::Spec::Mode::ReplicatedJob)) }
        attr_reader :replicated_job

        sig do
          params(replicated_job: Docker::Spec::Mode::ReplicatedJob::OrHash).void
        end
        attr_writer :replicated_job

        # Scheduling mode for the service.
        sig do
          params(
            global: T.anything,
            global_job: T.anything,
            replicated: Docker::Spec::Mode::Replicated::OrHash,
            replicated_job: Docker::Spec::Mode::ReplicatedJob::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          global: nil,
          # The mode used for services which run a task to the completed state on each valid
          # node.
          global_job: nil,
          replicated: nil,
          # The mode used for services with a finite number of tasks that run to a completed
          # state.
          replicated_job: nil
        )
        end

        sig do
          override.returns(
            {
              global: T.anything,
              global_job: T.anything,
              replicated: Docker::Spec::Mode::Replicated,
              replicated_job: Docker::Spec::Mode::ReplicatedJob
            }
          )
        end
        def to_hash
        end

        class Replicated < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Docker::Spec::Mode::Replicated, Docker::Internal::AnyHash)
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :replicas

          sig { params(replicas: Integer).void }
          attr_writer :replicas

          sig { params(replicas: Integer).returns(T.attached_class) }
          def self.new(replicas: nil)
          end

          sig { override.returns({ replicas: Integer }) }
          def to_hash
          end
        end

        class ReplicatedJob < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::Mode::ReplicatedJob,
                Docker::Internal::AnyHash
              )
            end

          # The maximum number of replicas to run simultaneously.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_concurrent

          sig { params(max_concurrent: Integer).void }
          attr_writer :max_concurrent

          # The total number of replicas desired to reach the Completed state. If unset,
          # will default to the value of `MaxConcurrent`
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_completions

          sig { params(total_completions: Integer).void }
          attr_writer :total_completions

          # The mode used for services with a finite number of tasks that run to a completed
          # state.
          sig do
            params(max_concurrent: Integer, total_completions: Integer).returns(
              T.attached_class
            )
          end
          def self.new(
            # The maximum number of replicas to run simultaneously.
            max_concurrent: nil,
            # The total number of replicas desired to reach the Completed state. If unset,
            # will default to the value of `MaxConcurrent`
            total_completions: nil
          )
          end

          sig do
            override.returns(
              { max_concurrent: Integer, total_completions: Integer }
            )
          end
          def to_hash
          end
        end
      end

      class Network < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Docker::Spec::Network, Docker::Internal::AnyHash)
          end

        # Discoverable alternate names for the service on this network.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :aliases

        sig { params(aliases: T::Array[String]).void }
        attr_writer :aliases

        # Driver attachment options for the network target.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :driver_opts

        sig { params(driver_opts: T::Hash[Symbol, String]).void }
        attr_writer :driver_opts

        # The target network for attachment. Must be a network name or ID.
        sig { returns(T.nilable(String)) }
        attr_reader :target

        sig { params(target: String).void }
        attr_writer :target

        # Specifies how a service should be attached to a particular network.
        sig do
          params(
            aliases: T::Array[String],
            driver_opts: T::Hash[Symbol, String],
            target: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Discoverable alternate names for the service on this network.
          aliases: nil,
          # Driver attachment options for the network target.
          driver_opts: nil,
          # The target network for attachment. Must be a network name or ID.
          target: nil
        )
        end

        sig do
          override.returns(
            {
              aliases: T::Array[String],
              driver_opts: T::Hash[Symbol, String],
              target: String
            }
          )
        end
        def to_hash
        end
      end

      class RollbackConfig < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Docker::Spec::RollbackConfig, Docker::Internal::AnyHash)
          end

        # Amount of time between rollback iterations, in nanoseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :delay

        sig { params(delay: Integer).void }
        attr_writer :delay

        # Action to take if an rolled back task fails to run, or stops running during the
        # rollback.
        sig do
          returns(
            T.nilable(Docker::Spec::RollbackConfig::FailureAction::OrSymbol)
          )
        end
        attr_reader :failure_action

        sig do
          params(
            failure_action:
              Docker::Spec::RollbackConfig::FailureAction::OrSymbol
          ).void
        end
        attr_writer :failure_action

        # The fraction of tasks that may fail during a rollback before the failure action
        # is invoked, specified as a floating point number between 0 and 1.
        sig { returns(T.nilable(Float)) }
        attr_reader :max_failure_ratio

        sig { params(max_failure_ratio: Float).void }
        attr_writer :max_failure_ratio

        # Amount of time to monitor each rolled back task for failures, in nanoseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :monitor

        sig { params(monitor: Integer).void }
        attr_writer :monitor

        # The order of operations when rolling back a task. Either the old task is shut
        # down before the new task is started, or the new task is started before the old
        # task is shut down.
        sig do
          returns(T.nilable(Docker::Spec::RollbackConfig::Order::OrSymbol))
        end
        attr_reader :order

        sig do
          params(order: Docker::Spec::RollbackConfig::Order::OrSymbol).void
        end
        attr_writer :order

        # Maximum number of tasks to be rolled back in one iteration (0 means unlimited
        # parallelism).
        sig { returns(T.nilable(Integer)) }
        attr_reader :parallelism

        sig { params(parallelism: Integer).void }
        attr_writer :parallelism

        # Specification for the rollback strategy of the service.
        sig do
          params(
            delay: Integer,
            failure_action:
              Docker::Spec::RollbackConfig::FailureAction::OrSymbol,
            max_failure_ratio: Float,
            monitor: Integer,
            order: Docker::Spec::RollbackConfig::Order::OrSymbol,
            parallelism: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Amount of time between rollback iterations, in nanoseconds.
          delay: nil,
          # Action to take if an rolled back task fails to run, or stops running during the
          # rollback.
          failure_action: nil,
          # The fraction of tasks that may fail during a rollback before the failure action
          # is invoked, specified as a floating point number between 0 and 1.
          max_failure_ratio: nil,
          # Amount of time to monitor each rolled back task for failures, in nanoseconds.
          monitor: nil,
          # The order of operations when rolling back a task. Either the old task is shut
          # down before the new task is started, or the new task is started before the old
          # task is shut down.
          order: nil,
          # Maximum number of tasks to be rolled back in one iteration (0 means unlimited
          # parallelism).
          parallelism: nil
        )
        end

        sig do
          override.returns(
            {
              delay: Integer,
              failure_action:
                Docker::Spec::RollbackConfig::FailureAction::OrSymbol,
              max_failure_ratio: Float,
              monitor: Integer,
              order: Docker::Spec::RollbackConfig::Order::OrSymbol,
              parallelism: Integer
            }
          )
        end
        def to_hash
        end

        # Action to take if an rolled back task fails to run, or stops running during the
        # rollback.
        module FailureAction
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Docker::Spec::RollbackConfig::FailureAction)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTINUE =
            T.let(
              :continue,
              Docker::Spec::RollbackConfig::FailureAction::TaggedSymbol
            )
          PAUSE =
            T.let(
              :pause,
              Docker::Spec::RollbackConfig::FailureAction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Docker::Spec::RollbackConfig::FailureAction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The order of operations when rolling back a task. Either the old task is shut
        # down before the new task is started, or the new task is started before the old
        # task is shut down.
        module Order
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Docker::Spec::RollbackConfig::Order) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STOP_FIRST =
            T.let(
              :"stop-first",
              Docker::Spec::RollbackConfig::Order::TaggedSymbol
            )
          START_FIRST =
            T.let(
              :"start-first",
              Docker::Spec::RollbackConfig::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Docker::Spec::RollbackConfig::Order::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class TaskTemplate < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Docker::Spec::TaskTemplate, Docker::Internal::AnyHash)
          end

        # Container spec for the service.
        #
        # <p><br /></p>
        #
        # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        sig { returns(T.nilable(Docker::Spec::TaskTemplate::ContainerSpec)) }
        attr_reader :container_spec

        sig do
          params(
            container_spec: Docker::Spec::TaskTemplate::ContainerSpec::OrHash
          ).void
        end
        attr_writer :container_spec

        # A counter that triggers an update even if no relevant parameters have been
        # changed.
        sig { returns(T.nilable(Integer)) }
        attr_reader :force_update

        sig { params(force_update: Integer).void }
        attr_writer :force_update

        # Specifies the log driver to use for tasks created from this spec. If not
        # present, the default one for the swarm will be used, finally falling back to the
        # engine default if not specified.
        sig { returns(T.nilable(Docker::Spec::TaskTemplate::LogDriver)) }
        attr_reader :log_driver

        sig do
          params(log_driver: Docker::Spec::TaskTemplate::LogDriver::OrHash).void
        end
        attr_writer :log_driver

        # Read-only spec type for non-swarm containers attached to swarm overlay networks.
        #
        # <p><br /></p>
        #
        # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        sig do
          returns(T.nilable(Docker::Spec::TaskTemplate::NetworkAttachmentSpec))
        end
        attr_reader :network_attachment_spec

        sig do
          params(
            network_attachment_spec:
              Docker::Spec::TaskTemplate::NetworkAttachmentSpec::OrHash
          ).void
        end
        attr_writer :network_attachment_spec

        # Specifies which networks the service should attach to.
        sig do
          returns(T.nilable(T::Array[Docker::Spec::TaskTemplate::Network]))
        end
        attr_reader :networks

        sig do
          params(
            networks: T::Array[Docker::Spec::TaskTemplate::Network::OrHash]
          ).void
        end
        attr_writer :networks

        sig { returns(T.nilable(Docker::Spec::TaskTemplate::Placement)) }
        attr_reader :placement

        sig do
          params(placement: Docker::Spec::TaskTemplate::Placement::OrHash).void
        end
        attr_writer :placement

        # Plugin spec for the service. _(Experimental release only.)_
        #
        # <p><br /></p>
        #
        # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        sig { returns(T.nilable(Docker::Spec::TaskTemplate::PluginSpec)) }
        attr_reader :plugin_spec

        sig do
          params(
            plugin_spec: Docker::Spec::TaskTemplate::PluginSpec::OrHash
          ).void
        end
        attr_writer :plugin_spec

        # Resource requirements which apply to each individual container created as part
        # of the service.
        sig { returns(T.nilable(Docker::Spec::TaskTemplate::Resources)) }
        attr_reader :resources

        sig do
          params(resources: Docker::Spec::TaskTemplate::Resources::OrHash).void
        end
        attr_writer :resources

        # Specification for the restart policy which applies to containers created as part
        # of this service.
        sig { returns(T.nilable(Docker::Spec::TaskTemplate::RestartPolicy)) }
        attr_reader :restart_policy

        sig do
          params(
            restart_policy: Docker::Spec::TaskTemplate::RestartPolicy::OrHash
          ).void
        end
        attr_writer :restart_policy

        # Runtime is the type of runtime specified for the task executor.
        sig { returns(T.nilable(String)) }
        attr_reader :runtime

        sig { params(runtime: String).void }
        attr_writer :runtime

        # User modifiable task configuration.
        sig do
          params(
            container_spec: Docker::Spec::TaskTemplate::ContainerSpec::OrHash,
            force_update: Integer,
            log_driver: Docker::Spec::TaskTemplate::LogDriver::OrHash,
            network_attachment_spec:
              Docker::Spec::TaskTemplate::NetworkAttachmentSpec::OrHash,
            networks: T::Array[Docker::Spec::TaskTemplate::Network::OrHash],
            placement: Docker::Spec::TaskTemplate::Placement::OrHash,
            plugin_spec: Docker::Spec::TaskTemplate::PluginSpec::OrHash,
            resources: Docker::Spec::TaskTemplate::Resources::OrHash,
            restart_policy: Docker::Spec::TaskTemplate::RestartPolicy::OrHash,
            runtime: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Container spec for the service.
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          container_spec: nil,
          # A counter that triggers an update even if no relevant parameters have been
          # changed.
          force_update: nil,
          # Specifies the log driver to use for tasks created from this spec. If not
          # present, the default one for the swarm will be used, finally falling back to the
          # engine default if not specified.
          log_driver: nil,
          # Read-only spec type for non-swarm containers attached to swarm overlay networks.
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          network_attachment_spec: nil,
          # Specifies which networks the service should attach to.
          networks: nil,
          placement: nil,
          # Plugin spec for the service. _(Experimental release only.)_
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          plugin_spec: nil,
          # Resource requirements which apply to each individual container created as part
          # of the service.
          resources: nil,
          # Specification for the restart policy which applies to containers created as part
          # of this service.
          restart_policy: nil,
          # Runtime is the type of runtime specified for the task executor.
          runtime: nil
        )
        end

        sig do
          override.returns(
            {
              container_spec: Docker::Spec::TaskTemplate::ContainerSpec,
              force_update: Integer,
              log_driver: Docker::Spec::TaskTemplate::LogDriver,
              network_attachment_spec:
                Docker::Spec::TaskTemplate::NetworkAttachmentSpec,
              networks: T::Array[Docker::Spec::TaskTemplate::Network],
              placement: Docker::Spec::TaskTemplate::Placement,
              plugin_spec: Docker::Spec::TaskTemplate::PluginSpec,
              resources: Docker::Spec::TaskTemplate::Resources,
              restart_policy: Docker::Spec::TaskTemplate::RestartPolicy,
              runtime: String
            }
          )
        end
        def to_hash
        end

        class ContainerSpec < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::ContainerSpec,
                Docker::Internal::AnyHash
              )
            end

          # Arguments to the command.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :args

          sig { params(args: T::Array[String]).void }
          attr_writer :args

          # A list of kernel capabilities to add to the default set for the container.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :capability_add

          sig { params(capability_add: T::Array[String]).void }
          attr_writer :capability_add

          # A list of kernel capabilities to drop from the default set for the container.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :capability_drop

          sig { params(capability_drop: T::Array[String]).void }
          attr_writer :capability_drop

          # The command to be run in the image.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :command

          sig { params(command: T::Array[String]).void }
          attr_writer :command

          # Configs contains references to zero or more configs that will be exposed to the
          # service.
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Config]
              )
            )
          end
          attr_reader :configs

          sig do
            params(
              configs:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Config::OrHash
                ]
            ).void
          end
          attr_writer :configs

          # The working directory for commands to run in.
          sig { returns(T.nilable(String)) }
          attr_reader :dir

          sig { params(dir: String).void }
          attr_writer :dir

          # Specification for DNS related configurations in resolver configuration file
          # (`resolv.conf`).
          sig do
            returns(
              T.nilable(Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig)
            )
          end
          attr_reader :dns_config

          sig do
            params(
              dns_config:
                Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig::OrHash
            ).void
          end
          attr_writer :dns_config

          # A list of environment variables in the form `VAR=value`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :env

          sig { params(env: T::Array[String]).void }
          attr_writer :env

          # A list of additional groups that the container process will run as.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :groups

          sig { params(groups: T::Array[String]).void }
          attr_writer :groups

          # A test to perform to check that the container is healthy. Healthcheck commands
          # should be side-effect free.
          sig do
            returns(
              T.nilable(Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck)
            )
          end
          attr_reader :health_check

          sig do
            params(
              health_check:
                Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck::OrHash
            ).void
          end
          attr_writer :health_check

          # The hostname to use for the container, as a valid
          # [RFC 1123](https://tools.ietf.org/html/rfc1123) hostname.
          sig { returns(T.nilable(String)) }
          attr_reader :hostname

          sig { params(hostname: String).void }
          attr_writer :hostname

          # A list of hostname/IP mappings to add to the container's `hosts` file. The
          # format of extra hosts is specified in the
          # [hosts(5)](http://man7.org/linux/man-pages/man5/hosts.5.html) man page:
          #
          #     IP_address canonical_hostname [aliases...]
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :hosts

          sig { params(hosts: T::Array[String]).void }
          attr_writer :hosts

          # The image name to use for the container
          sig { returns(T.nilable(String)) }
          attr_reader :image

          sig { params(image: String).void }
          attr_writer :image

          # Run an init inside the container that forwards signals and reaps processes. This
          # field is omitted if empty, and the default (as configured on the daemon) is
          # used.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :init

          # Isolation technology of the containers running the service. (Windows only)
          sig do
            returns(
              T.nilable(
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::OrSymbol
              )
            )
          end
          attr_reader :isolation

          sig do
            params(
              isolation:
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::OrSymbol
            ).void
          end
          attr_writer :isolation

          # User-defined key/value data.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :labels

          sig { params(labels: T::Hash[Symbol, String]).void }
          attr_writer :labels

          # Specification for mounts to be added to containers created as part of the
          # service.
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Mount]
              )
            )
          end
          attr_reader :mounts

          sig do
            params(
              mounts:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::OrHash
                ]
            ).void
          end
          attr_writer :mounts

          # An integer value containing the score given to the container in order to tune
          # OOM killer preferences.
          sig { returns(T.nilable(Integer)) }
          attr_reader :oom_score_adj

          sig { params(oom_score_adj: Integer).void }
          attr_writer :oom_score_adj

          # Open `stdin`
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :open_stdin

          sig { params(open_stdin: T::Boolean).void }
          attr_writer :open_stdin

          # Security options for the container
          sig do
            returns(
              T.nilable(Docker::Spec::TaskTemplate::ContainerSpec::Privileges)
            )
          end
          attr_reader :privileges

          sig do
            params(
              privileges:
                Docker::Spec::TaskTemplate::ContainerSpec::Privileges::OrHash
            ).void
          end
          attr_writer :privileges

          # Mount the container's root filesystem as read only.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :read_only

          sig { params(read_only: T::Boolean).void }
          attr_writer :read_only

          # Secrets contains references to zero or more secrets that will be exposed to the
          # service.
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Secret]
              )
            )
          end
          attr_reader :secrets

          sig do
            params(
              secrets:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret::OrHash
                ]
            ).void
          end
          attr_writer :secrets

          # Amount of time to wait for the container to terminate before forcefully killing
          # it.
          sig { returns(T.nilable(Integer)) }
          attr_reader :stop_grace_period

          sig { params(stop_grace_period: Integer).void }
          attr_writer :stop_grace_period

          # Signal to stop the container.
          sig { returns(T.nilable(String)) }
          attr_reader :stop_signal

          sig { params(stop_signal: String).void }
          attr_writer :stop_signal

          # Set kernel namedspaced parameters (sysctls) in the container. The Sysctls option
          # on services accepts the same sysctls as the are supported on containers. Note
          # that while the same sysctls are supported, no guarantees or checks are made
          # about their suitability for a clustered environment, and it's up to the user to
          # determine whether a given sysctl will work properly in a Service.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :sysctls

          sig { params(sysctls: T::Hash[Symbol, String]).void }
          attr_writer :sysctls

          # Whether a pseudo-TTY should be allocated.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :tty

          sig { params(tty: T::Boolean).void }
          attr_writer :tty

          # A list of resource limits to set in the container. For example:
          # `{"Name": "nofile", "Soft": 1024, "Hard": 2048}`"
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Ulimit]
              )
            )
          end
          attr_reader :ulimits

          sig do
            params(
              ulimits:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Ulimit::OrHash
                ]
            ).void
          end
          attr_writer :ulimits

          # The user inside the container.
          sig { returns(T.nilable(String)) }
          attr_reader :user

          sig { params(user: String).void }
          attr_writer :user

          # Container spec for the service.
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          sig do
            params(
              args: T::Array[String],
              capability_add: T::Array[String],
              capability_drop: T::Array[String],
              command: T::Array[String],
              configs:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Config::OrHash
                ],
              dir: String,
              dns_config:
                Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig::OrHash,
              env: T::Array[String],
              groups: T::Array[String],
              health_check:
                Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck::OrHash,
              hostname: String,
              hosts: T::Array[String],
              image: String,
              init: T.nilable(T::Boolean),
              isolation:
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::OrSymbol,
              labels: T::Hash[Symbol, String],
              mounts:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::OrHash
                ],
              oom_score_adj: Integer,
              open_stdin: T::Boolean,
              privileges:
                Docker::Spec::TaskTemplate::ContainerSpec::Privileges::OrHash,
              read_only: T::Boolean,
              secrets:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret::OrHash
                ],
              stop_grace_period: Integer,
              stop_signal: String,
              sysctls: T::Hash[Symbol, String],
              tty: T::Boolean,
              ulimits:
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Ulimit::OrHash
                ],
              user: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Arguments to the command.
            args: nil,
            # A list of kernel capabilities to add to the default set for the container.
            capability_add: nil,
            # A list of kernel capabilities to drop from the default set for the container.
            capability_drop: nil,
            # The command to be run in the image.
            command: nil,
            # Configs contains references to zero or more configs that will be exposed to the
            # service.
            configs: nil,
            # The working directory for commands to run in.
            dir: nil,
            # Specification for DNS related configurations in resolver configuration file
            # (`resolv.conf`).
            dns_config: nil,
            # A list of environment variables in the form `VAR=value`.
            env: nil,
            # A list of additional groups that the container process will run as.
            groups: nil,
            # A test to perform to check that the container is healthy. Healthcheck commands
            # should be side-effect free.
            health_check: nil,
            # The hostname to use for the container, as a valid
            # [RFC 1123](https://tools.ietf.org/html/rfc1123) hostname.
            hostname: nil,
            # A list of hostname/IP mappings to add to the container's `hosts` file. The
            # format of extra hosts is specified in the
            # [hosts(5)](http://man7.org/linux/man-pages/man5/hosts.5.html) man page:
            #
            #     IP_address canonical_hostname [aliases...]
            hosts: nil,
            # The image name to use for the container
            image: nil,
            # Run an init inside the container that forwards signals and reaps processes. This
            # field is omitted if empty, and the default (as configured on the daemon) is
            # used.
            init: nil,
            # Isolation technology of the containers running the service. (Windows only)
            isolation: nil,
            # User-defined key/value data.
            labels: nil,
            # Specification for mounts to be added to containers created as part of the
            # service.
            mounts: nil,
            # An integer value containing the score given to the container in order to tune
            # OOM killer preferences.
            oom_score_adj: nil,
            # Open `stdin`
            open_stdin: nil,
            # Security options for the container
            privileges: nil,
            # Mount the container's root filesystem as read only.
            read_only: nil,
            # Secrets contains references to zero or more secrets that will be exposed to the
            # service.
            secrets: nil,
            # Amount of time to wait for the container to terminate before forcefully killing
            # it.
            stop_grace_period: nil,
            # Signal to stop the container.
            stop_signal: nil,
            # Set kernel namedspaced parameters (sysctls) in the container. The Sysctls option
            # on services accepts the same sysctls as the are supported on containers. Note
            # that while the same sysctls are supported, no guarantees or checks are made
            # about their suitability for a clustered environment, and it's up to the user to
            # determine whether a given sysctl will work properly in a Service.
            sysctls: nil,
            # Whether a pseudo-TTY should be allocated.
            tty: nil,
            # A list of resource limits to set in the container. For example:
            # `{"Name": "nofile", "Soft": 1024, "Hard": 2048}`"
            ulimits: nil,
            # The user inside the container.
            user: nil
          )
          end

          sig do
            override.returns(
              {
                args: T::Array[String],
                capability_add: T::Array[String],
                capability_drop: T::Array[String],
                command: T::Array[String],
                configs:
                  T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Config],
                dir: String,
                dns_config:
                  Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig,
                env: T::Array[String],
                groups: T::Array[String],
                health_check:
                  Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck,
                hostname: String,
                hosts: T::Array[String],
                image: String,
                init: T.nilable(T::Boolean),
                isolation:
                  Docker::Spec::TaskTemplate::ContainerSpec::Isolation::OrSymbol,
                labels: T::Hash[Symbol, String],
                mounts:
                  T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Mount],
                oom_score_adj: Integer,
                open_stdin: T::Boolean,
                privileges:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges,
                read_only: T::Boolean,
                secrets:
                  T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Secret],
                stop_grace_period: Integer,
                stop_signal: String,
                sysctls: T::Hash[Symbol, String],
                tty: T::Boolean,
                ulimits:
                  T::Array[Docker::Spec::TaskTemplate::ContainerSpec::Ulimit],
                user: String
              }
            )
          end
          def to_hash
          end

          class Config < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::Config,
                  Docker::Internal::AnyHash
                )
              end

            # ConfigID represents the ID of the specific config that we're referencing.
            sig { returns(T.nilable(String)) }
            attr_reader :config_id

            sig { params(config_id: String).void }
            attr_writer :config_id

            # ConfigName is the name of the config that this references, but this is just
            # provided for lookup/display purposes. The config in the reference will be
            # identified by its ID.
            sig { returns(T.nilable(String)) }
            attr_reader :config_name

            sig { params(config_name: String).void }
            attr_writer :config_name

            # File represents a specific target that is backed by a file.
            #
            # <p><br /><p>
            #
            # > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Config::File
                )
              )
            end
            attr_reader :file

            sig do
              params(
                file:
                  Docker::Spec::TaskTemplate::ContainerSpec::Config::File::OrHash
              ).void
            end
            attr_writer :file

            # Runtime represents a target that is not mounted into the container but is used
            # by the task
            #
            # <p><br /><p>
            #
            # > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
            sig { returns(T.nilable(T.anything)) }
            attr_reader :runtime

            sig { params(runtime: T.anything).void }
            attr_writer :runtime

            sig do
              params(
                config_id: String,
                config_name: String,
                file:
                  Docker::Spec::TaskTemplate::ContainerSpec::Config::File::OrHash,
                runtime: T.anything
              ).returns(T.attached_class)
            end
            def self.new(
              # ConfigID represents the ID of the specific config that we're referencing.
              config_id: nil,
              # ConfigName is the name of the config that this references, but this is just
              # provided for lookup/display purposes. The config in the reference will be
              # identified by its ID.
              config_name: nil,
              # File represents a specific target that is backed by a file.
              #
              # <p><br /><p>
              #
              # > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
              file: nil,
              # Runtime represents a target that is not mounted into the container but is used
              # by the task
              #
              # <p><br /><p>
              #
              # > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
              runtime: nil
            )
            end

            sig do
              override.returns(
                {
                  config_id: String,
                  config_name: String,
                  file: Docker::Spec::TaskTemplate::ContainerSpec::Config::File,
                  runtime: T.anything
                }
              )
            end
            def to_hash
            end

            class File < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Config::File,
                    Docker::Internal::AnyHash
                  )
                end

              # GID represents the file GID.
              sig { returns(T.nilable(String)) }
              attr_reader :gid

              sig { params(gid: String).void }
              attr_writer :gid

              # Mode represents the FileMode of the file.
              sig { returns(T.nilable(Integer)) }
              attr_reader :mode

              sig { params(mode: Integer).void }
              attr_writer :mode

              # Name represents the final filename in the filesystem.
              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              # UID represents the file UID.
              sig { returns(T.nilable(String)) }
              attr_reader :uid

              sig { params(uid: String).void }
              attr_writer :uid

              # File represents a specific target that is backed by a file.
              #
              # <p><br /><p>
              #
              # > **Note**: `Configs.File` and `Configs.Runtime` are mutually exclusive
              sig do
                params(
                  gid: String,
                  mode: Integer,
                  name: String,
                  uid: String
                ).returns(T.attached_class)
              end
              def self.new(
                # GID represents the file GID.
                gid: nil,
                # Mode represents the FileMode of the file.
                mode: nil,
                # Name represents the final filename in the filesystem.
                name: nil,
                # UID represents the file UID.
                uid: nil
              )
              end

              sig do
                override.returns(
                  { gid: String, mode: Integer, name: String, uid: String }
                )
              end
              def to_hash
              end
            end
          end

          class DNSConfig < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::DNSConfig,
                  Docker::Internal::AnyHash
                )
              end

            # The IP addresses of the name servers.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :nameservers

            sig { params(nameservers: T::Array[String]).void }
            attr_writer :nameservers

            # A list of internal resolver variables to be modified (e.g., `debug`, `ndots:3`,
            # etc.).
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :options

            sig { params(options: T::Array[String]).void }
            attr_writer :options

            # A search list for host-name lookup.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :search

            sig { params(search: T::Array[String]).void }
            attr_writer :search

            # Specification for DNS related configurations in resolver configuration file
            # (`resolv.conf`).
            sig do
              params(
                nameservers: T::Array[String],
                options: T::Array[String],
                search: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              # The IP addresses of the name servers.
              nameservers: nil,
              # A list of internal resolver variables to be modified (e.g., `debug`, `ndots:3`,
              # etc.).
              options: nil,
              # A search list for host-name lookup.
              search: nil
            )
            end

            sig do
              override.returns(
                {
                  nameservers: T::Array[String],
                  options: T::Array[String],
                  search: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end

          class HealthCheck < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::HealthCheck,
                  Docker::Internal::AnyHash
                )
              end

            # The time to wait between checks in nanoseconds. It should be 0 or at least
            # 1000000 (1 ms). 0 means inherit.
            sig { returns(T.nilable(Integer)) }
            attr_reader :interval

            sig { params(interval: Integer).void }
            attr_writer :interval

            # The number of consecutive failures needed to consider a container as unhealthy.
            # 0 means inherit.
            sig { returns(T.nilable(Integer)) }
            attr_reader :retries

            sig { params(retries: Integer).void }
            attr_writer :retries

            # The time to wait between checks in nanoseconds during the start period. It
            # should be 0 or at least 1000000 (1 ms). 0 means inherit.
            sig { returns(T.nilable(Integer)) }
            attr_reader :start_interval

            sig { params(start_interval: Integer).void }
            attr_writer :start_interval

            # Start period for the container to initialize before starting health-retries
            # countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
            # inherit.
            sig { returns(T.nilable(Integer)) }
            attr_reader :start_period

            sig { params(start_period: Integer).void }
            attr_writer :start_period

            # The test to perform. Possible values are:
            #
            # - `[]` inherit healthcheck from image or parent image
            # - `["NONE"]` disable healthcheck
            # - `["CMD", args...]` exec arguments directly
            # - `["CMD-SHELL", command]` run command with system's default shell
            #
            # A non-zero exit code indicates a failed healthcheck:
            #
            # - `0` healthy
            # - `1` unhealthy
            # - `2` reserved (treated as unhealthy)
            # - other values: error running probe
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :test_

            sig { params(test_: T::Array[String]).void }
            attr_writer :test_

            # The time to wait before considering the check to have hung. It should be 0 or at
            # least 1000000 (1 ms). 0 means inherit.
            #
            # If the health check command does not complete within this timeout, the check is
            # considered failed and the health check process is forcibly terminated without a
            # graceful shutdown.
            sig { returns(T.nilable(Integer)) }
            attr_reader :timeout

            sig { params(timeout: Integer).void }
            attr_writer :timeout

            # A test to perform to check that the container is healthy. Healthcheck commands
            # should be side-effect free.
            sig do
              params(
                interval: Integer,
                retries: Integer,
                start_interval: Integer,
                start_period: Integer,
                test_: T::Array[String],
                timeout: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # The time to wait between checks in nanoseconds. It should be 0 or at least
              # 1000000 (1 ms). 0 means inherit.
              interval: nil,
              # The number of consecutive failures needed to consider a container as unhealthy.
              # 0 means inherit.
              retries: nil,
              # The time to wait between checks in nanoseconds during the start period. It
              # should be 0 or at least 1000000 (1 ms). 0 means inherit.
              start_interval: nil,
              # Start period for the container to initialize before starting health-retries
              # countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
              # inherit.
              start_period: nil,
              # The test to perform. Possible values are:
              #
              # - `[]` inherit healthcheck from image or parent image
              # - `["NONE"]` disable healthcheck
              # - `["CMD", args...]` exec arguments directly
              # - `["CMD-SHELL", command]` run command with system's default shell
              #
              # A non-zero exit code indicates a failed healthcheck:
              #
              # - `0` healthy
              # - `1` unhealthy
              # - `2` reserved (treated as unhealthy)
              # - other values: error running probe
              test_: nil,
              # The time to wait before considering the check to have hung. It should be 0 or at
              # least 1000000 (1 ms). 0 means inherit.
              #
              # If the health check command does not complete within this timeout, the check is
              # considered failed and the health check process is forcibly terminated without a
              # graceful shutdown.
              timeout: nil
            )
            end

            sig do
              override.returns(
                {
                  interval: Integer,
                  retries: Integer,
                  start_interval: Integer,
                  start_period: Integer,
                  test_: T::Array[String],
                  timeout: Integer
                }
              )
            end
            def to_hash
            end
          end

          # Isolation technology of the containers running the service. (Windows only)
          module Isolation
            extend Docker::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Docker::Spec::TaskTemplate::ContainerSpec::Isolation
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DEFAULT =
              T.let(
                :default,
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::TaggedSymbol
              )
            PROCESS =
              T.let(
                :process,
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::TaggedSymbol
              )
            HYPERV =
              T.let(
                :hyperv,
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::TaggedSymbol
              )
            EMPTY =
              T.let(
                :"",
                Docker::Spec::TaskTemplate::ContainerSpec::Isolation::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Docker::Spec::TaskTemplate::ContainerSpec::Isolation::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Mount < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount,
                  Docker::Internal::AnyHash
                )
              end

            # Optional configuration for the `bind` type.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions
                )
              )
            end
            attr_reader :bind_options

            sig do
              params(
                bind_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::OrHash
              ).void
            end
            attr_writer :bind_options

            # The consistency requirement for the mount: `default`, `consistent`, `cached`, or
            # `delegated`.
            sig { returns(T.nilable(String)) }
            attr_reader :consistency

            sig { params(consistency: String).void }
            attr_writer :consistency

            # Optional configuration for the `image` type.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions
                )
              )
            end
            attr_reader :image_options

            sig do
              params(
                image_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions::OrHash
              ).void
            end
            attr_writer :image_options

            # Whether the mount should be read-only.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :read_only

            sig { params(read_only: T::Boolean).void }
            attr_writer :read_only

            # Mount source (e.g. a volume name, a host path). The source cannot be specified
            # when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
            # the `CreateMountpoint` must be set to `true` to create the source path on the
            # host if missing.
            #
            # For `Type=npipe`, the pipe must exist prior to creating the container.
            sig { returns(T.nilable(String)) }
            attr_reader :source

            sig { params(source: String).void }
            attr_writer :source

            # Container path.
            sig { returns(T.nilable(String)) }
            attr_reader :target

            sig { params(target: String).void }
            attr_writer :target

            # Optional configuration for the `tmpfs` type.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions
                )
              )
            end
            attr_reader :tmpfs_options

            sig do
              params(
                tmpfs_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions::OrHash
              ).void
            end
            attr_writer :tmpfs_options

            # The mount type. Available types:
            #
            # - `bind` a mount of a file or directory from the host into the container.
            # - `cluster` a Swarm cluster volume.
            # - `image` an OCI image.
            # - `npipe` a named pipe from the host into the container.
            # - `tmpfs` a `tmpfs`.
            # - `volume` a docker volume with the given `Name`.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::OrSymbol
              ).void
            end
            attr_writer :type

            # Optional configuration for the `volume` type.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions
                )
              )
            end
            attr_reader :volume_options

            sig do
              params(
                volume_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::OrHash
              ).void
            end
            attr_writer :volume_options

            sig do
              params(
                bind_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::OrHash,
                consistency: String,
                image_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions::OrHash,
                read_only: T::Boolean,
                source: String,
                target: String,
                tmpfs_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions::OrHash,
                type:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::OrSymbol,
                volume_options:
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Optional configuration for the `bind` type.
              bind_options: nil,
              # The consistency requirement for the mount: `default`, `consistent`, `cached`, or
              # `delegated`.
              consistency: nil,
              # Optional configuration for the `image` type.
              image_options: nil,
              # Whether the mount should be read-only.
              read_only: nil,
              # Mount source (e.g. a volume name, a host path). The source cannot be specified
              # when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
              # the `CreateMountpoint` must be set to `true` to create the source path on the
              # host if missing.
              #
              # For `Type=npipe`, the pipe must exist prior to creating the container.
              source: nil,
              # Container path.
              target: nil,
              # Optional configuration for the `tmpfs` type.
              tmpfs_options: nil,
              # The mount type. Available types:
              #
              # - `bind` a mount of a file or directory from the host into the container.
              # - `cluster` a Swarm cluster volume.
              # - `image` an OCI image.
              # - `npipe` a named pipe from the host into the container.
              # - `tmpfs` a `tmpfs`.
              # - `volume` a docker volume with the given `Name`.
              type: nil,
              # Optional configuration for the `volume` type.
              volume_options: nil
            )
            end

            sig do
              override.returns(
                {
                  bind_options:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions,
                  consistency: String,
                  image_options:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions,
                  read_only: T::Boolean,
                  source: String,
                  target: String,
                  tmpfs_options:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions,
                  type:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::OrSymbol,
                  volume_options:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions
                }
              )
            end
            def to_hash
            end

            class BindOptions < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions,
                    Docker::Internal::AnyHash
                  )
                end

              # Create mount point on host if missing
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :create_mountpoint

              sig { params(create_mountpoint: T::Boolean).void }
              attr_writer :create_mountpoint

              # Disable recursive bind mount.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :non_recursive

              sig { params(non_recursive: T::Boolean).void }
              attr_writer :non_recursive

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol
                  )
                )
              end
              attr_reader :propagation

              sig do
                params(
                  propagation:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol
                ).void
              end
              attr_writer :propagation

              # Raise an error if the mount cannot be made recursively read-only.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :read_only_force_recursive

              sig { params(read_only_force_recursive: T::Boolean).void }
              attr_writer :read_only_force_recursive

              # Make the mount non-recursively read-only, but still leave the mount recursive
              # (unless NonRecursive is set to `true` in conjunction).
              #
              # Added in v1.44, before that version all read-only mounts were non-recursive by
              # default. To match the previous behaviour this will default to `true` for clients
              # on versions prior to v1.44.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :read_only_non_recursive

              sig { params(read_only_non_recursive: T::Boolean).void }
              attr_writer :read_only_non_recursive

              # Optional configuration for the `bind` type.
              sig do
                params(
                  create_mountpoint: T::Boolean,
                  non_recursive: T::Boolean,
                  propagation:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol,
                  read_only_force_recursive: T::Boolean,
                  read_only_non_recursive: T::Boolean
                ).returns(T.attached_class)
              end
              def self.new(
                # Create mount point on host if missing
                create_mountpoint: nil,
                # Disable recursive bind mount.
                non_recursive: nil,
                # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
                propagation: nil,
                # Raise an error if the mount cannot be made recursively read-only.
                read_only_force_recursive: nil,
                # Make the mount non-recursively read-only, but still leave the mount recursive
                # (unless NonRecursive is set to `true` in conjunction).
                #
                # Added in v1.44, before that version all read-only mounts were non-recursive by
                # default. To match the previous behaviour this will default to `true` for clients
                # on versions prior to v1.44.
                read_only_non_recursive: nil
              )
              end

              sig do
                override.returns(
                  {
                    create_mountpoint: T::Boolean,
                    non_recursive: T::Boolean,
                    propagation:
                      Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol,
                    read_only_force_recursive: T::Boolean,
                    read_only_non_recursive: T::Boolean
                  }
                )
              end
              def to_hash
              end

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              module Propagation
                extend Docker::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PRIVATE =
                  T.let(
                    :private,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RPRIVATE =
                  T.let(
                    :rprivate,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                SHARED =
                  T.let(
                    :shared,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RSHARED =
                  T.let(
                    :rshared,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                SLAVE =
                  T.let(
                    :slave,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RSLAVE =
                  T.let(
                    :rslave,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Docker::Spec::TaskTemplate::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ImageOptions < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::ImageOptions,
                    Docker::Internal::AnyHash
                  )
                end

              # Source path inside the image. Must be relative without any back traversals.
              sig { returns(T.nilable(String)) }
              attr_reader :subpath

              sig { params(subpath: String).void }
              attr_writer :subpath

              # Optional configuration for the `image` type.
              sig { params(subpath: String).returns(T.attached_class) }
              def self.new(
                # Source path inside the image. Must be relative without any back traversals.
                subpath: nil
              )
              end

              sig { override.returns({ subpath: String }) }
              def to_hash
              end
            end

            class TmpfsOptions < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::TmpfsOptions,
                    Docker::Internal::AnyHash
                  )
                end

              # The permission mode for the tmpfs mount in an integer. The value must not be in
              # octal format (e.g. 755) but rather the decimal representation of the octal value
              # (e.g. 493).
              sig { returns(T.nilable(Integer)) }
              attr_reader :mode

              sig { params(mode: Integer).void }
              attr_writer :mode

              # The options to be passed to the tmpfs mount. An array of arrays. Flag options
              # should be provided as 1-length arrays. Other types should be provided as as
              # 2-length arrays, where the first item is the key and the second the value.
              sig { returns(T.nilable(T::Array[T::Array[String]])) }
              attr_reader :options

              sig { params(options: T::Array[T::Array[String]]).void }
              attr_writer :options

              # The size for the tmpfs mount in bytes.
              sig { returns(T.nilable(Integer)) }
              attr_reader :size_bytes

              sig { params(size_bytes: Integer).void }
              attr_writer :size_bytes

              # Optional configuration for the `tmpfs` type.
              sig do
                params(
                  mode: Integer,
                  options: T::Array[T::Array[String]],
                  size_bytes: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # The permission mode for the tmpfs mount in an integer. The value must not be in
                # octal format (e.g. 755) but rather the decimal representation of the octal value
                # (e.g. 493).
                mode: nil,
                # The options to be passed to the tmpfs mount. An array of arrays. Flag options
                # should be provided as 1-length arrays. Other types should be provided as as
                # 2-length arrays, where the first item is the key and the second the value.
                options: nil,
                # The size for the tmpfs mount in bytes.
                size_bytes: nil
              )
              end

              sig do
                override.returns(
                  {
                    mode: Integer,
                    options: T::Array[T::Array[String]],
                    size_bytes: Integer
                  }
                )
              end
              def to_hash
              end
            end

            # The mount type. Available types:
            #
            # - `bind` a mount of a file or directory from the host into the container.
            # - `cluster` a Swarm cluster volume.
            # - `image` an OCI image.
            # - `npipe` a named pipe from the host into the container.
            # - `tmpfs` a `tmpfs`.
            # - `volume` a docker volume with the given `Name`.
            module Type
              extend Docker::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BIND =
                T.let(
                  :bind,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )
              CLUSTER =
                T.let(
                  :cluster,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )
              IMAGE =
                T.let(
                  :image,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )
              NPIPE =
                T.let(
                  :npipe,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )
              TMPFS =
                T.let(
                  :tmpfs,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )
              VOLUME =
                T.let(
                  :volume,
                  Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class VolumeOptions < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions,
                    Docker::Internal::AnyHash
                  )
                end

              # Map of driver specific options
              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig
                  )
                )
              end
              attr_reader :driver_config

              sig do
                params(
                  driver_config:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig::OrHash
                ).void
              end
              attr_writer :driver_config

              # User-defined key/value metadata.
              sig { returns(T.nilable(T::Hash[Symbol, String])) }
              attr_reader :labels

              sig { params(labels: T::Hash[Symbol, String]).void }
              attr_writer :labels

              # Populate volume with data from the target.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :no_copy

              sig { params(no_copy: T::Boolean).void }
              attr_writer :no_copy

              # Source path inside the volume. Must be relative without any back traversals.
              sig { returns(T.nilable(String)) }
              attr_reader :subpath

              sig { params(subpath: String).void }
              attr_writer :subpath

              # Optional configuration for the `volume` type.
              sig do
                params(
                  driver_config:
                    Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig::OrHash,
                  labels: T::Hash[Symbol, String],
                  no_copy: T::Boolean,
                  subpath: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Map of driver specific options
                driver_config: nil,
                # User-defined key/value metadata.
                labels: nil,
                # Populate volume with data from the target.
                no_copy: nil,
                # Source path inside the volume. Must be relative without any back traversals.
                subpath: nil
              )
              end

              sig do
                override.returns(
                  {
                    driver_config:
                      Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig,
                    labels: T::Hash[Symbol, String],
                    no_copy: T::Boolean,
                    subpath: String
                  }
                )
              end
              def to_hash
              end

              class DriverConfig < Docker::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Docker::Spec::TaskTemplate::ContainerSpec::Mount::VolumeOptions::DriverConfig,
                      Docker::Internal::AnyHash
                    )
                  end

                # Name of the driver to use to create the volume.
                sig { returns(T.nilable(String)) }
                attr_reader :name

                sig { params(name: String).void }
                attr_writer :name

                # key/value map of driver specific options.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :options

                sig { params(options: T::Hash[Symbol, String]).void }
                attr_writer :options

                # Map of driver specific options
                sig do
                  params(
                    name: String,
                    options: T::Hash[Symbol, String]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Name of the driver to use to create the volume.
                  name: nil,
                  # key/value map of driver specific options.
                  options: nil
                )
                end

                sig do
                  override.returns(
                    { name: String, options: T::Hash[Symbol, String] }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class Privileges < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges,
                  Docker::Internal::AnyHash
                )
              end

            # Options for configuring AppArmor on the container
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor
                )
              )
            end
            attr_reader :app_armor

            sig do
              params(
                app_armor:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::OrHash
              ).void
            end
            attr_writer :app_armor

            # CredentialSpec for managed service account (Windows only)
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec
                )
              )
            end
            attr_reader :credential_spec

            sig do
              params(
                credential_spec:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec::OrHash
              ).void
            end
            attr_writer :credential_spec

            # Configuration of the no_new_privs bit in the container
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :no_new_privileges

            sig { params(no_new_privileges: T::Boolean).void }
            attr_writer :no_new_privileges

            # Options for configuring seccomp on the container
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp
                )
              )
            end
            attr_reader :seccomp

            sig do
              params(
                seccomp:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::OrHash
              ).void
            end
            attr_writer :seccomp

            # SELinux labels of the container
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext
                )
              )
            end
            attr_reader :se_linux_context

            sig do
              params(
                se_linux_context:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext::OrHash
              ).void
            end
            attr_writer :se_linux_context

            # Security options for the container
            sig do
              params(
                app_armor:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::OrHash,
                credential_spec:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec::OrHash,
                no_new_privileges: T::Boolean,
                seccomp:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::OrHash,
                se_linux_context:
                  Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Options for configuring AppArmor on the container
              app_armor: nil,
              # CredentialSpec for managed service account (Windows only)
              credential_spec: nil,
              # Configuration of the no_new_privs bit in the container
              no_new_privileges: nil,
              # Options for configuring seccomp on the container
              seccomp: nil,
              # SELinux labels of the container
              se_linux_context: nil
            )
            end

            sig do
              override.returns(
                {
                  app_armor:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor,
                  credential_spec:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec,
                  no_new_privileges: T::Boolean,
                  seccomp:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp,
                  se_linux_context:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext
                }
              )
            end
            def to_hash
            end

            class AppArmor < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor,
                    Docker::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                  )
                )
              end
              attr_reader :mode

              sig do
                params(
                  mode:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                ).void
              end
              attr_writer :mode

              # Options for configuring AppArmor on the container
              sig do
                params(
                  mode:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(mode: nil)
              end

              sig do
                override.returns(
                  {
                    mode:
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                  }
                )
              end
              def to_hash
              end

              module Mode
                extend Docker::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DEFAULT =
                  T.let(
                    :default,
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                  )
                DISABLED =
                  T.let(
                    :disabled,
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class CredentialSpec < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::CredentialSpec,
                    Docker::Internal::AnyHash
                  )
                end

              # Load credential spec from a Swarm Config with the given ID. The specified config
              # must also be present in the Configs field with the Runtime property set.
              #
              # <p><br /></p>
              #
              # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              # > `CredentialSpec.Config` are mutually exclusive.
              sig { returns(T.nilable(String)) }
              attr_reader :config

              sig { params(config: String).void }
              attr_writer :config

              # Load credential spec from this file. The file is read by the daemon, and must be
              # present in the `CredentialSpecs` subdirectory in the docker data directory,
              # which defaults to `C:\ProgramData\Docker\` on Windows.
              #
              # For example, specifying `spec.json` loads
              # `C:\ProgramData\Docker\CredentialSpecs\spec.json`.
              #
              # <p><br /></p>
              #
              # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              # > `CredentialSpec.Config` are mutually exclusive.
              sig { returns(T.nilable(String)) }
              attr_reader :file

              sig { params(file: String).void }
              attr_writer :file

              # Load credential spec from this value in the Windows registry. The specified
              # registry value must be located in:
              #
              # `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs`
              #
              # <p><br /></p>
              #
              # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
              # > `CredentialSpec.Config` are mutually exclusive.
              sig { returns(T.nilable(String)) }
              attr_reader :registry

              sig { params(registry: String).void }
              attr_writer :registry

              # CredentialSpec for managed service account (Windows only)
              sig do
                params(config: String, file: String, registry: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # Load credential spec from a Swarm Config with the given ID. The specified config
                # must also be present in the Configs field with the Runtime property set.
                #
                # <p><br /></p>
                #
                # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
                # > `CredentialSpec.Config` are mutually exclusive.
                config: nil,
                # Load credential spec from this file. The file is read by the daemon, and must be
                # present in the `CredentialSpecs` subdirectory in the docker data directory,
                # which defaults to `C:\ProgramData\Docker\` on Windows.
                #
                # For example, specifying `spec.json` loads
                # `C:\ProgramData\Docker\CredentialSpecs\spec.json`.
                #
                # <p><br /></p>
                #
                # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
                # > `CredentialSpec.Config` are mutually exclusive.
                file: nil,
                # Load credential spec from this value in the Windows registry. The specified
                # registry value must be located in:
                #
                # `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs`
                #
                # <p><br /></p>
                #
                # > **Note**: `CredentialSpec.File`, `CredentialSpec.Registry`, and
                # > `CredentialSpec.Config` are mutually exclusive.
                registry: nil
              )
              end

              sig do
                override.returns(
                  { config: String, file: String, registry: String }
                )
              end
              def to_hash
              end
            end

            class Seccomp < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp,
                    Docker::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol
                  )
                )
              end
              attr_reader :mode

              sig do
                params(
                  mode:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol
                ).void
              end
              attr_writer :mode

              # The custom seccomp profile as a json object
              sig { returns(T.nilable(String)) }
              attr_reader :profile

              sig { params(profile: String).void }
              attr_writer :profile

              # Options for configuring seccomp on the container
              sig do
                params(
                  mode:
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol,
                  profile: String
                ).returns(T.attached_class)
              end
              def self.new(
                mode: nil,
                # The custom seccomp profile as a json object
                profile: nil
              )
              end

              sig do
                override.returns(
                  {
                    mode:
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol,
                    profile: String
                  }
                )
              end
              def to_hash
              end

              module Mode
                extend Docker::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DEFAULT =
                  T.let(
                    :default,
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                  )
                UNCONFINED =
                  T.let(
                    :unconfined,
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                  )
                CUSTOM =
                  T.let(
                    :custom,
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Docker::Spec::TaskTemplate::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class SeLinuxContext < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Privileges::SeLinuxContext,
                    Docker::Internal::AnyHash
                  )
                end

              # Disable SELinux
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :disable

              sig { params(disable: T::Boolean).void }
              attr_writer :disable

              # SELinux level label
              sig { returns(T.nilable(String)) }
              attr_reader :level

              sig { params(level: String).void }
              attr_writer :level

              # SELinux role label
              sig { returns(T.nilable(String)) }
              attr_reader :role

              sig { params(role: String).void }
              attr_writer :role

              # SELinux type label
              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              # SELinux user label
              sig { returns(T.nilable(String)) }
              attr_reader :user

              sig { params(user: String).void }
              attr_writer :user

              # SELinux labels of the container
              sig do
                params(
                  disable: T::Boolean,
                  level: String,
                  role: String,
                  type: String,
                  user: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Disable SELinux
                disable: nil,
                # SELinux level label
                level: nil,
                # SELinux role label
                role: nil,
                # SELinux type label
                type: nil,
                # SELinux user label
                user: nil
              )
              end

              sig do
                override.returns(
                  {
                    disable: T::Boolean,
                    level: String,
                    role: String,
                    type: String,
                    user: String
                  }
                )
              end
              def to_hash
              end
            end
          end

          class Secret < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret,
                  Docker::Internal::AnyHash
                )
              end

            # File represents a specific target that is backed by a file.
            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret::File
                )
              )
            end
            attr_reader :file

            sig do
              params(
                file:
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret::File::OrHash
              ).void
            end
            attr_writer :file

            # SecretID represents the ID of the specific secret that we're referencing.
            sig { returns(T.nilable(String)) }
            attr_reader :secret_id

            sig { params(secret_id: String).void }
            attr_writer :secret_id

            # SecretName is the name of the secret that this references, but this is just
            # provided for lookup/display purposes. The secret in the reference will be
            # identified by its ID.
            sig { returns(T.nilable(String)) }
            attr_reader :secret_name

            sig { params(secret_name: String).void }
            attr_writer :secret_name

            sig do
              params(
                file:
                  Docker::Spec::TaskTemplate::ContainerSpec::Secret::File::OrHash,
                secret_id: String,
                secret_name: String
              ).returns(T.attached_class)
            end
            def self.new(
              # File represents a specific target that is backed by a file.
              file: nil,
              # SecretID represents the ID of the specific secret that we're referencing.
              secret_id: nil,
              # SecretName is the name of the secret that this references, but this is just
              # provided for lookup/display purposes. The secret in the reference will be
              # identified by its ID.
              secret_name: nil
            )
            end

            sig do
              override.returns(
                {
                  file: Docker::Spec::TaskTemplate::ContainerSpec::Secret::File,
                  secret_id: String,
                  secret_name: String
                }
              )
            end
            def to_hash
            end

            class File < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::ContainerSpec::Secret::File,
                    Docker::Internal::AnyHash
                  )
                end

              # GID represents the file GID.
              sig { returns(T.nilable(String)) }
              attr_reader :gid

              sig { params(gid: String).void }
              attr_writer :gid

              # Mode represents the FileMode of the file.
              sig { returns(T.nilable(Integer)) }
              attr_reader :mode

              sig { params(mode: Integer).void }
              attr_writer :mode

              # Name represents the final filename in the filesystem.
              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              # UID represents the file UID.
              sig { returns(T.nilable(String)) }
              attr_reader :uid

              sig { params(uid: String).void }
              attr_writer :uid

              # File represents a specific target that is backed by a file.
              sig do
                params(
                  gid: String,
                  mode: Integer,
                  name: String,
                  uid: String
                ).returns(T.attached_class)
              end
              def self.new(
                # GID represents the file GID.
                gid: nil,
                # Mode represents the FileMode of the file.
                mode: nil,
                # Name represents the final filename in the filesystem.
                name: nil,
                # UID represents the file UID.
                uid: nil
              )
              end

              sig do
                override.returns(
                  { gid: String, mode: Integer, name: String, uid: String }
                )
              end
              def to_hash
              end
            end
          end

          class Ulimit < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::ContainerSpec::Ulimit,
                  Docker::Internal::AnyHash
                )
              end

            # Hard limit
            sig { returns(T.nilable(Integer)) }
            attr_reader :hard

            sig { params(hard: Integer).void }
            attr_writer :hard

            # Name of ulimit
            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            # Soft limit
            sig { returns(T.nilable(Integer)) }
            attr_reader :soft

            sig { params(soft: Integer).void }
            attr_writer :soft

            sig do
              params(hard: Integer, name: String, soft: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # Hard limit
              hard: nil,
              # Name of ulimit
              name: nil,
              # Soft limit
              soft: nil
            )
            end

            sig do
              override.returns({ hard: Integer, name: String, soft: Integer })
            end
            def to_hash
            end
          end
        end

        class LogDriver < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::LogDriver,
                Docker::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :options

          sig { params(options: T::Hash[Symbol, String]).void }
          attr_writer :options

          # Specifies the log driver to use for tasks created from this spec. If not
          # present, the default one for the swarm will be used, finally falling back to the
          # engine default if not specified.
          sig do
            params(name: String, options: T::Hash[Symbol, String]).returns(
              T.attached_class
            )
          end
          def self.new(name: nil, options: nil)
          end

          sig do
            override.returns({ name: String, options: T::Hash[Symbol, String] })
          end
          def to_hash
          end
        end

        class NetworkAttachmentSpec < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::NetworkAttachmentSpec,
                Docker::Internal::AnyHash
              )
            end

          # ID of the container represented by this task
          sig { returns(T.nilable(String)) }
          attr_reader :container_id

          sig { params(container_id: String).void }
          attr_writer :container_id

          # Read-only spec type for non-swarm containers attached to swarm overlay networks.
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          sig { params(container_id: String).returns(T.attached_class) }
          def self.new(
            # ID of the container represented by this task
            container_id: nil
          )
          end

          sig { override.returns({ container_id: String }) }
          def to_hash
          end
        end

        class Network < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::Network,
                Docker::Internal::AnyHash
              )
            end

          # Discoverable alternate names for the service on this network.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :aliases

          sig { params(aliases: T::Array[String]).void }
          attr_writer :aliases

          # Driver attachment options for the network target.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :driver_opts

          sig { params(driver_opts: T::Hash[Symbol, String]).void }
          attr_writer :driver_opts

          # The target network for attachment. Must be a network name or ID.
          sig { returns(T.nilable(String)) }
          attr_reader :target

          sig { params(target: String).void }
          attr_writer :target

          # Specifies how a service should be attached to a particular network.
          sig do
            params(
              aliases: T::Array[String],
              driver_opts: T::Hash[Symbol, String],
              target: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Discoverable alternate names for the service on this network.
            aliases: nil,
            # Driver attachment options for the network target.
            driver_opts: nil,
            # The target network for attachment. Must be a network name or ID.
            target: nil
          )
          end

          sig do
            override.returns(
              {
                aliases: T::Array[String],
                driver_opts: T::Hash[Symbol, String],
                target: String
              }
            )
          end
          def to_hash
          end
        end

        class Placement < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::Placement,
                Docker::Internal::AnyHash
              )
            end

          # An array of constraint expressions to limit the set of nodes where a task can be
          # scheduled. Constraint expressions can either use a _match_ (`==`) or _exclude_
          # (`!=`) rule. Multiple constraints find nodes that satisfy every expression (AND
          # match). Constraints can match node or Docker Engine labels as follows:
          #
          # | node attribute       | matches                        | example                                       |
          # | -------------------- | ------------------------------ | --------------------------------------------- |
          # | `node.id`            | Node ID                        | `node.id==2ivku8v2gvtg4`                      |
          # | `node.hostname`      | Node hostname                  | `node.hostname!=node-2`                       |
          # | `node.role`          | Node role (`manager`/`worker`) | `node.role==manager`                          |
          # | `node.platform.os`   | Node operating system          | `node.platform.os==windows`                   |
          # | `node.platform.arch` | Node architecture              | `node.platform.arch==x86_64`                  |
          # | `node.labels`        | User-defined node labels       | `node.labels.security==high`                  |
          # | `engine.labels`      | Docker Engine's labels         | `engine.labels.operatingsystem==ubuntu-24.04` |
          #
          # `engine.labels` apply to Docker Engine labels like operating system, drivers,
          # etc. Swarm administrators add `node.labels` for operational purposes by using
          # the [`node update endpoint`](#operation/NodeUpdate).
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :constraints

          sig { params(constraints: T::Array[String]).void }
          attr_writer :constraints

          # Maximum number of replicas for per node (default value is 0, which is unlimited)
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_replicas

          sig { params(max_replicas: Integer).void }
          attr_writer :max_replicas

          # Platforms stores all the platforms that the service's image can run on. This
          # field is used in the platform filter for scheduling. If empty, then the platform
          # filter is off, meaning there are no scheduling restrictions.
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::Placement::Platform]
              )
            )
          end
          attr_reader :platforms

          sig do
            params(
              platforms:
                T::Array[
                  Docker::Spec::TaskTemplate::Placement::Platform::OrHash
                ]
            ).void
          end
          attr_writer :platforms

          # Preferences provide a way to make the scheduler aware of factors such as
          # topology. They are provided in order from highest to lowest precedence.
          sig do
            returns(
              T.nilable(
                T::Array[Docker::Spec::TaskTemplate::Placement::Preference]
              )
            )
          end
          attr_reader :preferences

          sig do
            params(
              preferences:
                T::Array[
                  Docker::Spec::TaskTemplate::Placement::Preference::OrHash
                ]
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              constraints: T::Array[String],
              max_replicas: Integer,
              platforms:
                T::Array[
                  Docker::Spec::TaskTemplate::Placement::Platform::OrHash
                ],
              preferences:
                T::Array[
                  Docker::Spec::TaskTemplate::Placement::Preference::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # An array of constraint expressions to limit the set of nodes where a task can be
            # scheduled. Constraint expressions can either use a _match_ (`==`) or _exclude_
            # (`!=`) rule. Multiple constraints find nodes that satisfy every expression (AND
            # match). Constraints can match node or Docker Engine labels as follows:
            #
            # | node attribute       | matches                        | example                                       |
            # | -------------------- | ------------------------------ | --------------------------------------------- |
            # | `node.id`            | Node ID                        | `node.id==2ivku8v2gvtg4`                      |
            # | `node.hostname`      | Node hostname                  | `node.hostname!=node-2`                       |
            # | `node.role`          | Node role (`manager`/`worker`) | `node.role==manager`                          |
            # | `node.platform.os`   | Node operating system          | `node.platform.os==windows`                   |
            # | `node.platform.arch` | Node architecture              | `node.platform.arch==x86_64`                  |
            # | `node.labels`        | User-defined node labels       | `node.labels.security==high`                  |
            # | `engine.labels`      | Docker Engine's labels         | `engine.labels.operatingsystem==ubuntu-24.04` |
            #
            # `engine.labels` apply to Docker Engine labels like operating system, drivers,
            # etc. Swarm administrators add `node.labels` for operational purposes by using
            # the [`node update endpoint`](#operation/NodeUpdate).
            constraints: nil,
            # Maximum number of replicas for per node (default value is 0, which is unlimited)
            max_replicas: nil,
            # Platforms stores all the platforms that the service's image can run on. This
            # field is used in the platform filter for scheduling. If empty, then the platform
            # filter is off, meaning there are no scheduling restrictions.
            platforms: nil,
            # Preferences provide a way to make the scheduler aware of factors such as
            # topology. They are provided in order from highest to lowest precedence.
            preferences: nil
          )
          end

          sig do
            override.returns(
              {
                constraints: T::Array[String],
                max_replicas: Integer,
                platforms:
                  T::Array[Docker::Spec::TaskTemplate::Placement::Platform],
                preferences:
                  T::Array[Docker::Spec::TaskTemplate::Placement::Preference]
              }
            )
          end
          def to_hash
          end

          class Platform < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::Placement::Platform,
                  Docker::Internal::AnyHash
                )
              end

            # Architecture represents the hardware architecture (for example, `x86_64`).
            sig { returns(T.nilable(String)) }
            attr_reader :architecture

            sig { params(architecture: String).void }
            attr_writer :architecture

            # OS represents the Operating System (for example, `linux` or `windows`).
            sig { returns(T.nilable(String)) }
            attr_reader :os

            sig { params(os: String).void }
            attr_writer :os

            # Platform represents the platform (Arch/OS).
            sig do
              params(architecture: String, os: String).returns(T.attached_class)
            end
            def self.new(
              # Architecture represents the hardware architecture (for example, `x86_64`).
              architecture: nil,
              # OS represents the Operating System (for example, `linux` or `windows`).
              os: nil
            )
            end

            sig { override.returns({ architecture: String, os: String }) }
            def to_hash
            end
          end

          class Preference < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::Placement::Preference,
                  Docker::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Docker::Spec::TaskTemplate::Placement::Preference::Spread
                )
              )
            end
            attr_reader :spread

            sig do
              params(
                spread:
                  Docker::Spec::TaskTemplate::Placement::Preference::Spread::OrHash
              ).void
            end
            attr_writer :spread

            sig do
              params(
                spread:
                  Docker::Spec::TaskTemplate::Placement::Preference::Spread::OrHash
              ).returns(T.attached_class)
            end
            def self.new(spread: nil)
            end

            sig do
              override.returns(
                {
                  spread:
                    Docker::Spec::TaskTemplate::Placement::Preference::Spread
                }
              )
            end
            def to_hash
            end

            class Spread < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::Placement::Preference::Spread,
                    Docker::Internal::AnyHash
                  )
                end

              # label descriptor, such as `engine.labels.az`.
              sig { returns(T.nilable(String)) }
              attr_reader :spread_descriptor

              sig { params(spread_descriptor: String).void }
              attr_writer :spread_descriptor

              sig do
                params(spread_descriptor: String).returns(T.attached_class)
              end
              def self.new(
                # label descriptor, such as `engine.labels.az`.
                spread_descriptor: nil
              )
              end

              sig { override.returns({ spread_descriptor: String }) }
              def to_hash
              end
            end
          end
        end

        class PluginSpec < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::PluginSpec,
                Docker::Internal::AnyHash
              )
            end

          # Disable the plugin once scheduled.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disabled

          sig { params(disabled: T::Boolean).void }
          attr_writer :disabled

          # The name or 'alias' to use for the plugin.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            returns(
              T.nilable(
                T::Array[
                  Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege
                ]
              )
            )
          end
          attr_reader :plugin_privilege

          sig do
            params(
              plugin_privilege:
                T::Array[
                  Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege::OrHash
                ]
            ).void
          end
          attr_writer :plugin_privilege

          # The plugin image reference to use.
          sig { returns(T.nilable(String)) }
          attr_reader :remote

          sig { params(remote: String).void }
          attr_writer :remote

          # Plugin spec for the service. _(Experimental release only.)_
          #
          # <p><br /></p>
          #
          # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
          # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
          # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
          sig do
            params(
              disabled: T::Boolean,
              name: String,
              plugin_privilege:
                T::Array[
                  Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege::OrHash
                ],
              remote: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Disable the plugin once scheduled.
            disabled: nil,
            # The name or 'alias' to use for the plugin.
            name: nil,
            plugin_privilege: nil,
            # The plugin image reference to use.
            remote: nil
          )
          end

          sig do
            override.returns(
              {
                disabled: T::Boolean,
                name: String,
                plugin_privilege:
                  T::Array[
                    Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege
                  ],
                remote: String
              }
            )
          end
          def to_hash
          end

          class PluginPrivilege < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::PluginSpec::PluginPrivilege,
                  Docker::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :value

            sig { params(value: T::Array[String]).void }
            attr_writer :value

            # Describes a permission the user has to accept upon installing the plugin.
            sig do
              params(
                description: String,
                name: String,
                value: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(description: nil, name: nil, value: nil)
            end

            sig do
              override.returns(
                { description: String, name: String, value: T::Array[String] }
              )
            end
            def to_hash
            end
          end
        end

        class Resources < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::Resources,
                Docker::Internal::AnyHash
              )
            end

          # An object describing a limit on resources which can be requested by a task.
          sig do
            returns(T.nilable(Docker::Spec::TaskTemplate::Resources::Limits))
          end
          attr_reader :limits

          sig do
            params(
              limits: Docker::Spec::TaskTemplate::Resources::Limits::OrHash
            ).void
          end
          attr_writer :limits

          # Tune the service's containers' memory swappiness (0 to 100). If not specified,
          # defaults to the containers' OS' default, generally 60, or whatever value was
          # predefined in the image. Set to -1 to unset a previously set value.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :memory_swappiness

          # An object describing the resources which can be advertised by a node and
          # requested by a task.
          sig do
            returns(
              T.nilable(Docker::Spec::TaskTemplate::Resources::Reservations)
            )
          end
          attr_reader :reservations

          sig do
            params(
              reservations:
                Docker::Spec::TaskTemplate::Resources::Reservations::OrHash
            ).void
          end
          attr_writer :reservations

          # Amount of swap in bytes - can only be used together with a memory limit. If not
          # specified, the default behaviour is to grant a swap space twice as big as the
          # memory limit. Set to -1 to enable unlimited swap.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :swap_bytes

          # Resource requirements which apply to each individual container created as part
          # of the service.
          sig do
            params(
              limits: Docker::Spec::TaskTemplate::Resources::Limits::OrHash,
              memory_swappiness: T.nilable(Integer),
              reservations:
                Docker::Spec::TaskTemplate::Resources::Reservations::OrHash,
              swap_bytes: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # An object describing a limit on resources which can be requested by a task.
            limits: nil,
            # Tune the service's containers' memory swappiness (0 to 100). If not specified,
            # defaults to the containers' OS' default, generally 60, or whatever value was
            # predefined in the image. Set to -1 to unset a previously set value.
            memory_swappiness: nil,
            # An object describing the resources which can be advertised by a node and
            # requested by a task.
            reservations: nil,
            # Amount of swap in bytes - can only be used together with a memory limit. If not
            # specified, the default behaviour is to grant a swap space twice as big as the
            # memory limit. Set to -1 to enable unlimited swap.
            swap_bytes: nil
          )
          end

          sig do
            override.returns(
              {
                limits: Docker::Spec::TaskTemplate::Resources::Limits,
                memory_swappiness: T.nilable(Integer),
                reservations:
                  Docker::Spec::TaskTemplate::Resources::Reservations,
                swap_bytes: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          class Limits < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::Resources::Limits,
                  Docker::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :memory_bytes

            sig { params(memory_bytes: Integer).void }
            attr_writer :memory_bytes

            sig { returns(T.nilable(Integer)) }
            attr_reader :nano_cpus

            sig { params(nano_cpus: Integer).void }
            attr_writer :nano_cpus

            # Limits the maximum number of PIDs in the container. Set `0` for unlimited.
            sig { returns(T.nilable(Integer)) }
            attr_reader :pids

            sig { params(pids: Integer).void }
            attr_writer :pids

            # An object describing a limit on resources which can be requested by a task.
            sig do
              params(
                memory_bytes: Integer,
                nano_cpus: Integer,
                pids: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              memory_bytes: nil,
              nano_cpus: nil,
              # Limits the maximum number of PIDs in the container. Set `0` for unlimited.
              pids: nil
            )
            end

            sig do
              override.returns(
                { memory_bytes: Integer, nano_cpus: Integer, pids: Integer }
              )
            end
            def to_hash
            end
          end

          class Reservations < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Spec::TaskTemplate::Resources::Reservations,
                  Docker::Internal::AnyHash
                )
              end

            # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
            # resources (e.g, `GPU=UUID1`).
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource
                  ]
                )
              )
            end
            attr_reader :generic_resources

            sig do
              params(
                generic_resources:
                  T::Array[
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::OrHash
                  ]
              ).void
            end
            attr_writer :generic_resources

            sig { returns(T.nilable(Integer)) }
            attr_reader :memory_bytes

            sig { params(memory_bytes: Integer).void }
            attr_writer :memory_bytes

            sig { returns(T.nilable(Integer)) }
            attr_reader :nano_cpus

            sig { params(nano_cpus: Integer).void }
            attr_writer :nano_cpus

            # An object describing the resources which can be advertised by a node and
            # requested by a task.
            sig do
              params(
                generic_resources:
                  T::Array[
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::OrHash
                  ],
                memory_bytes: Integer,
                nano_cpus: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
              # resources (e.g, `GPU=UUID1`).
              generic_resources: nil,
              memory_bytes: nil,
              nano_cpus: nil
            )
            end

            sig do
              override.returns(
                {
                  generic_resources:
                    T::Array[
                      Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource
                    ],
                  memory_bytes: Integer,
                  nano_cpus: Integer
                }
              )
            end
            def to_hash
            end

            class GenericResource < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource,
                    Docker::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec
                  )
                )
              end
              attr_reader :discrete_resource_spec

              sig do
                params(
                  discrete_resource_spec:
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec::OrHash
                ).void
              end
              attr_writer :discrete_resource_spec

              sig do
                returns(
                  T.nilable(
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec
                  )
                )
              end
              attr_reader :named_resource_spec

              sig do
                params(
                  named_resource_spec:
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec::OrHash
                ).void
              end
              attr_writer :named_resource_spec

              sig do
                params(
                  discrete_resource_spec:
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec::OrHash,
                  named_resource_spec:
                    Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                discrete_resource_spec: nil,
                named_resource_spec: nil
              )
              end

              sig do
                override.returns(
                  {
                    discrete_resource_spec:
                      Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec,
                    named_resource_spec:
                      Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec
                  }
                )
              end
              def to_hash
              end

              class DiscreteResourceSpec < Docker::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::DiscreteResourceSpec,
                      Docker::Internal::AnyHash
                    )
                  end

                sig { returns(T.nilable(String)) }
                attr_reader :kind

                sig { params(kind: String).void }
                attr_writer :kind

                sig { returns(T.nilable(Integer)) }
                attr_reader :value

                sig { params(value: Integer).void }
                attr_writer :value

                sig do
                  params(kind: String, value: Integer).returns(T.attached_class)
                end
                def self.new(kind: nil, value: nil)
                end

                sig { override.returns({ kind: String, value: Integer }) }
                def to_hash
                end
              end

              class NamedResourceSpec < Docker::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Docker::Spec::TaskTemplate::Resources::Reservations::GenericResource::NamedResourceSpec,
                      Docker::Internal::AnyHash
                    )
                  end

                sig { returns(T.nilable(String)) }
                attr_reader :kind

                sig { params(kind: String).void }
                attr_writer :kind

                sig { returns(T.nilable(String)) }
                attr_reader :value

                sig { params(value: String).void }
                attr_writer :value

                sig do
                  params(kind: String, value: String).returns(T.attached_class)
                end
                def self.new(kind: nil, value: nil)
                end

                sig { override.returns({ kind: String, value: String }) }
                def to_hash
                end
              end
            end
          end
        end

        class RestartPolicy < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Spec::TaskTemplate::RestartPolicy,
                Docker::Internal::AnyHash
              )
            end

          # Condition for restart.
          sig do
            returns(
              T.nilable(
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::OrSymbol
              )
            )
          end
          attr_reader :condition

          sig do
            params(
              condition:
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::OrSymbol
            ).void
          end
          attr_writer :condition

          # Delay between restart attempts.
          sig { returns(T.nilable(Integer)) }
          attr_reader :delay

          sig { params(delay: Integer).void }
          attr_writer :delay

          # Maximum attempts to restart a given container before giving up (default value is
          # 0, which is ignored).
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_attempts

          sig { params(max_attempts: Integer).void }
          attr_writer :max_attempts

          # Windows is the time window used to evaluate the restart policy (default value is
          # 0, which is unbounded).
          sig { returns(T.nilable(Integer)) }
          attr_reader :window

          sig { params(window: Integer).void }
          attr_writer :window

          # Specification for the restart policy which applies to containers created as part
          # of this service.
          sig do
            params(
              condition:
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::OrSymbol,
              delay: Integer,
              max_attempts: Integer,
              window: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Condition for restart.
            condition: nil,
            # Delay between restart attempts.
            delay: nil,
            # Maximum attempts to restart a given container before giving up (default value is
            # 0, which is ignored).
            max_attempts: nil,
            # Windows is the time window used to evaluate the restart policy (default value is
            # 0, which is unbounded).
            window: nil
          )
          end

          sig do
            override.returns(
              {
                condition:
                  Docker::Spec::TaskTemplate::RestartPolicy::Condition::OrSymbol,
                delay: Integer,
                max_attempts: Integer,
                window: Integer
              }
            )
          end
          def to_hash
          end

          # Condition for restart.
          module Condition
            extend Docker::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Docker::Spec::TaskTemplate::RestartPolicy::Condition
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NONE =
              T.let(
                :none,
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::TaggedSymbol
              )
            ON_FAILURE =
              T.let(
                :"on-failure",
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::TaggedSymbol
              )
            ANY =
              T.let(
                :any,
                Docker::Spec::TaskTemplate::RestartPolicy::Condition::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Docker::Spec::TaskTemplate::RestartPolicy::Condition::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class UpdateConfig < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Docker::Spec::UpdateConfig, Docker::Internal::AnyHash)
          end

        # Amount of time between updates, in nanoseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :delay

        sig { params(delay: Integer).void }
        attr_writer :delay

        # Action to take if an updated task fails to run, or stops running during the
        # update.
        sig do
          returns(
            T.nilable(Docker::Spec::UpdateConfig::FailureAction::OrSymbol)
          )
        end
        attr_reader :failure_action

        sig do
          params(
            failure_action: Docker::Spec::UpdateConfig::FailureAction::OrSymbol
          ).void
        end
        attr_writer :failure_action

        # The fraction of tasks that may fail during an update before the failure action
        # is invoked, specified as a floating point number between 0 and 1.
        sig { returns(T.nilable(Float)) }
        attr_reader :max_failure_ratio

        sig { params(max_failure_ratio: Float).void }
        attr_writer :max_failure_ratio

        # Amount of time to monitor each updated task for failures, in nanoseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :monitor

        sig { params(monitor: Integer).void }
        attr_writer :monitor

        # The order of operations when rolling out an updated task. Either the old task is
        # shut down before the new task is started, or the new task is started before the
        # old task is shut down.
        sig { returns(T.nilable(Docker::Spec::UpdateConfig::Order::OrSymbol)) }
        attr_reader :order

        sig { params(order: Docker::Spec::UpdateConfig::Order::OrSymbol).void }
        attr_writer :order

        # Maximum number of tasks to be updated in one iteration (0 means unlimited
        # parallelism).
        sig { returns(T.nilable(Integer)) }
        attr_reader :parallelism

        sig { params(parallelism: Integer).void }
        attr_writer :parallelism

        # Specification for the update strategy of the service.
        sig do
          params(
            delay: Integer,
            failure_action: Docker::Spec::UpdateConfig::FailureAction::OrSymbol,
            max_failure_ratio: Float,
            monitor: Integer,
            order: Docker::Spec::UpdateConfig::Order::OrSymbol,
            parallelism: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Amount of time between updates, in nanoseconds.
          delay: nil,
          # Action to take if an updated task fails to run, or stops running during the
          # update.
          failure_action: nil,
          # The fraction of tasks that may fail during an update before the failure action
          # is invoked, specified as a floating point number between 0 and 1.
          max_failure_ratio: nil,
          # Amount of time to monitor each updated task for failures, in nanoseconds.
          monitor: nil,
          # The order of operations when rolling out an updated task. Either the old task is
          # shut down before the new task is started, or the new task is started before the
          # old task is shut down.
          order: nil,
          # Maximum number of tasks to be updated in one iteration (0 means unlimited
          # parallelism).
          parallelism: nil
        )
        end

        sig do
          override.returns(
            {
              delay: Integer,
              failure_action:
                Docker::Spec::UpdateConfig::FailureAction::OrSymbol,
              max_failure_ratio: Float,
              monitor: Integer,
              order: Docker::Spec::UpdateConfig::Order::OrSymbol,
              parallelism: Integer
            }
          )
        end
        def to_hash
        end

        # Action to take if an updated task fails to run, or stops running during the
        # update.
        module FailureAction
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Docker::Spec::UpdateConfig::FailureAction)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTINUE =
            T.let(
              :continue,
              Docker::Spec::UpdateConfig::FailureAction::TaggedSymbol
            )
          PAUSE =
            T.let(
              :pause,
              Docker::Spec::UpdateConfig::FailureAction::TaggedSymbol
            )
          ROLLBACK =
            T.let(
              :rollback,
              Docker::Spec::UpdateConfig::FailureAction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Docker::Spec::UpdateConfig::FailureAction::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # The order of operations when rolling out an updated task. Either the old task is
        # shut down before the new task is started, or the new task is started before the
        # old task is shut down.
        module Order
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Docker::Spec::UpdateConfig::Order) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STOP_FIRST =
            T.let(
              :"stop-first",
              Docker::Spec::UpdateConfig::Order::TaggedSymbol
            )
          START_FIRST =
            T.let(
              :"start-first",
              Docker::Spec::UpdateConfig::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Docker::Spec::UpdateConfig::Order::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
