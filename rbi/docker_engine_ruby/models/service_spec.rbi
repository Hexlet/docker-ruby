# typed: strong

module DockerEngineRuby
  module Models
    class ServiceSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceSpec,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Properties that can be configured to access and load balance a service.
      sig { returns(T.nilable(DockerEngineRuby::ServiceSpec::EndpointSpec)) }
      attr_reader :endpoint_spec

      sig do
        params(
          endpoint_spec: DockerEngineRuby::ServiceSpec::EndpointSpec::OrHash
        ).void
      end
      attr_writer :endpoint_spec

      # User-defined key/value metadata.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :labels

      sig { params(labels: T.anything).void }
      attr_writer :labels

      # Scheduling mode for the service.
      sig { returns(T.nilable(DockerEngineRuby::ServiceSpec::Mode)) }
      attr_reader :mode

      sig { params(mode: DockerEngineRuby::ServiceSpec::Mode::OrHash).void }
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
      sig do
        returns(T.nilable(T::Array[DockerEngineRuby::ServiceSpec::Network]))
      end
      attr_reader :networks

      sig do
        params(
          networks: T::Array[DockerEngineRuby::ServiceSpec::Network::OrHash]
        ).void
      end
      attr_writer :networks

      # Specification for the rollback strategy of the service.
      sig { returns(T.nilable(DockerEngineRuby::ServiceSpec::RollbackConfig)) }
      attr_reader :rollback_config

      sig do
        params(
          rollback_config: DockerEngineRuby::ServiceSpec::RollbackConfig::OrHash
        ).void
      end
      attr_writer :rollback_config

      # User modifiable task configuration.
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec)) }
      attr_reader :task_template

      sig { params(task_template: DockerEngineRuby::TaskSpec::OrHash).void }
      attr_writer :task_template

      # Specification for the update strategy of the service.
      sig { returns(T.nilable(DockerEngineRuby::ServiceSpec::UpdateConfig)) }
      attr_reader :update_config

      sig do
        params(
          update_config: DockerEngineRuby::ServiceSpec::UpdateConfig::OrHash
        ).void
      end
      attr_writer :update_config

      # User modifiable configuration for a service.
      sig do
        params(
          endpoint_spec: DockerEngineRuby::ServiceSpec::EndpointSpec::OrHash,
          labels: T.anything,
          mode: DockerEngineRuby::ServiceSpec::Mode::OrHash,
          name: String,
          networks: T::Array[DockerEngineRuby::ServiceSpec::Network::OrHash],
          rollback_config:
            DockerEngineRuby::ServiceSpec::RollbackConfig::OrHash,
          task_template: DockerEngineRuby::TaskSpec::OrHash,
          update_config: DockerEngineRuby::ServiceSpec::UpdateConfig::OrHash
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
            endpoint_spec: DockerEngineRuby::ServiceSpec::EndpointSpec,
            labels: T.anything,
            mode: DockerEngineRuby::ServiceSpec::Mode,
            name: String,
            networks: T::Array[DockerEngineRuby::ServiceSpec::Network],
            rollback_config: DockerEngineRuby::ServiceSpec::RollbackConfig,
            task_template: DockerEngineRuby::TaskSpec,
            update_config: DockerEngineRuby::ServiceSpec::UpdateConfig
          }
        )
      end
      def to_hash
      end

      class EndpointSpec < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceSpec::EndpointSpec,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # The mode of resolution to use for internal load balancing between tasks.
        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::OrSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode: DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # List of exposed ports that this service is accessible on from the outside. Ports
        # can only be provided if `vip` resolution mode is used.
        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::ServiceSpec::EndpointSpec::Port]
            )
          )
        end
        attr_reader :ports

        sig do
          params(
            ports:
              T::Array[
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::OrHash
              ]
          ).void
        end
        attr_writer :ports

        # Properties that can be configured to access and load balance a service.
        sig do
          params(
            mode: DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::OrSymbol,
            ports:
              T::Array[
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::OrHash
              ]
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
              mode: DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::OrSymbol,
              ports: T::Array[DockerEngineRuby::ServiceSpec::EndpointSpec::Port]
            }
          )
        end
        def to_hash
        end

        # The mode of resolution to use for internal load balancing between tasks.
        module Mode
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::ServiceSpec::EndpointSpec::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VIP =
            T.let(
              :vip,
              DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::TaggedSymbol
            )
          DNSRR =
            T.let(
              :dnsrr,
              DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ServiceSpec::EndpointSpec::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Port < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::OrSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::OrSymbol
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
              T.nilable(
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::OrSymbol
              )
            )
          end
          attr_reader :publish_mode

          sig do
            params(
              publish_mode:
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::OrSymbol
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
              protocol:
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::OrSymbol,
              published_port: Integer,
              publish_mode:
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::OrSymbol,
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
                protocol:
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::OrSymbol,
                published_port: Integer,
                publish_mode:
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::OrSymbol,
                target_port: Integer
              }
            )
          end
          def to_hash
          end

          module Protocol
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TCP =
              T.let(
                :tcp,
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::TaggedSymbol
              )
            UDP =
              T.let(
                :udp,
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::TaggedSymbol
              )
            SCTP =
              T.let(
                :sctp,
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::Protocol::TaggedSymbol
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
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INGRESS =
              T.let(
                :ingress,
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::TaggedSymbol
              )
            HOST =
              T.let(
                :host,
                DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::ServiceSpec::EndpointSpec::Port::PublishMode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Mode < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceSpec::Mode,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T.anything)) }
        attr_reader :global

        sig { params(global: T.anything).void }
        attr_writer :global

        sig { returns(T.nilable(T.anything)) }
        attr_reader :global_job

        sig { params(global_job: T.anything).void }
        attr_writer :global_job

        sig do
          returns(T.nilable(DockerEngineRuby::ServiceSpec::Mode::Replicated))
        end
        attr_reader :replicated

        sig do
          params(
            replicated: DockerEngineRuby::ServiceSpec::Mode::Replicated::OrHash
          ).void
        end
        attr_writer :replicated

        sig do
          returns(T.nilable(DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob))
        end
        attr_reader :replicated_job

        sig do
          params(
            replicated_job:
              DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob::OrHash
          ).void
        end
        attr_writer :replicated_job

        # Scheduling mode for the service.
        sig do
          params(
            global: T.anything,
            global_job: T.anything,
            replicated: DockerEngineRuby::ServiceSpec::Mode::Replicated::OrHash,
            replicated_job:
              DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          global: nil,
          global_job: nil,
          replicated: nil,
          replicated_job: nil
        )
        end

        sig do
          override.returns(
            {
              global: T.anything,
              global_job: T.anything,
              replicated: DockerEngineRuby::ServiceSpec::Mode::Replicated,
              replicated_job: DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob
            }
          )
        end
        def to_hash
        end

        class Replicated < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ServiceSpec::Mode::Replicated,
                DockerEngineRuby::Internal::AnyHash
              )
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

        class ReplicatedJob < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ServiceSpec::Mode::ReplicatedJob,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :max_concurrent

          sig { params(max_concurrent: Integer).void }
          attr_writer :max_concurrent

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_completions

          sig { params(total_completions: Integer).void }
          attr_writer :total_completions

          sig do
            params(max_concurrent: Integer, total_completions: Integer).returns(
              T.attached_class
            )
          end
          def self.new(max_concurrent: nil, total_completions: nil)
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

      class Network < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceSpec::Network,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Discoverable alternate names for the service on this network.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :aliases

        sig { params(aliases: T::Array[String]).void }
        attr_writer :aliases

        # Driver attachment options for the network target.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :driver_opts

        sig { params(driver_opts: T.anything).void }
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
            driver_opts: T.anything,
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
              driver_opts: T.anything,
              target: String
            }
          )
        end
        def to_hash
        end
      end

      class RollbackConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceSpec::RollbackConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :delay

        sig { params(delay: Integer).void }
        attr_writer :delay

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::OrSymbol
            )
          )
        end
        attr_reader :failure_action

        sig do
          params(
            failure_action:
              DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::OrSymbol
          ).void
        end
        attr_writer :failure_action

        sig { returns(T.nilable(Float)) }
        attr_reader :max_failure_ratio

        sig { params(max_failure_ratio: Float).void }
        attr_writer :max_failure_ratio

        sig { returns(T.nilable(Integer)) }
        attr_reader :monitor

        sig { params(monitor: Integer).void }
        attr_writer :monitor

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ServiceSpec::RollbackConfig::Order::OrSymbol
            )
          )
        end
        attr_reader :order

        sig do
          params(
            order:
              DockerEngineRuby::ServiceSpec::RollbackConfig::Order::OrSymbol
          ).void
        end
        attr_writer :order

        sig { returns(T.nilable(Integer)) }
        attr_reader :parallelism

        sig { params(parallelism: Integer).void }
        attr_writer :parallelism

        # Specification for the rollback strategy of the service.
        sig do
          params(
            delay: Integer,
            failure_action:
              DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::OrSymbol,
            max_failure_ratio: Float,
            monitor: Integer,
            order:
              DockerEngineRuby::ServiceSpec::RollbackConfig::Order::OrSymbol,
            parallelism: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          delay: nil,
          failure_action: nil,
          max_failure_ratio: nil,
          monitor: nil,
          order: nil,
          parallelism: nil
        )
        end

        sig do
          override.returns(
            {
              delay: Integer,
              failure_action:
                DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::OrSymbol,
              max_failure_ratio: Float,
              monitor: Integer,
              order:
                DockerEngineRuby::ServiceSpec::RollbackConfig::Order::OrSymbol,
              parallelism: Integer
            }
          )
        end
        def to_hash
        end

        module FailureAction
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTINUE =
            T.let(
              :continue,
              DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::TaggedSymbol
            )
          PAUSE =
            T.let(
              :pause,
              DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ServiceSpec::RollbackConfig::FailureAction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Order
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::ServiceSpec::RollbackConfig::Order
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STOP_FIRST =
            T.let(
              :"stop-first",
              DockerEngineRuby::ServiceSpec::RollbackConfig::Order::TaggedSymbol
            )
          START_FIRST =
            T.let(
              :"start-first",
              DockerEngineRuby::ServiceSpec::RollbackConfig::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ServiceSpec::RollbackConfig::Order::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UpdateConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceSpec::UpdateConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :delay

        sig { params(delay: Integer).void }
        attr_writer :delay

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::OrSymbol
            )
          )
        end
        attr_reader :failure_action

        sig do
          params(
            failure_action:
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::OrSymbol
          ).void
        end
        attr_writer :failure_action

        sig { returns(T.nilable(Float)) }
        attr_reader :max_failure_ratio

        sig { params(max_failure_ratio: Float).void }
        attr_writer :max_failure_ratio

        sig { returns(T.nilable(Integer)) }
        attr_reader :monitor

        sig { params(monitor: Integer).void }
        attr_writer :monitor

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ServiceSpec::UpdateConfig::Order::OrSymbol
            )
          )
        end
        attr_reader :order

        sig do
          params(
            order: DockerEngineRuby::ServiceSpec::UpdateConfig::Order::OrSymbol
          ).void
        end
        attr_writer :order

        sig { returns(T.nilable(Integer)) }
        attr_reader :parallelism

        sig { params(parallelism: Integer).void }
        attr_writer :parallelism

        # Specification for the update strategy of the service.
        sig do
          params(
            delay: Integer,
            failure_action:
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::OrSymbol,
            max_failure_ratio: Float,
            monitor: Integer,
            order: DockerEngineRuby::ServiceSpec::UpdateConfig::Order::OrSymbol,
            parallelism: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          delay: nil,
          failure_action: nil,
          max_failure_ratio: nil,
          monitor: nil,
          order: nil,
          parallelism: nil
        )
        end

        sig do
          override.returns(
            {
              delay: Integer,
              failure_action:
                DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::OrSymbol,
              max_failure_ratio: Float,
              monitor: Integer,
              order:
                DockerEngineRuby::ServiceSpec::UpdateConfig::Order::OrSymbol,
              parallelism: Integer
            }
          )
        end
        def to_hash
        end

        module FailureAction
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTINUE =
            T.let(
              :continue,
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::TaggedSymbol
            )
          PAUSE =
            T.let(
              :pause,
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::TaggedSymbol
            )
          ROLLBACK =
            T.let(
              :rollback,
              DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ServiceSpec::UpdateConfig::FailureAction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Order
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::ServiceSpec::UpdateConfig::Order)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STOP_FIRST =
            T.let(
              :"stop-first",
              DockerEngineRuby::ServiceSpec::UpdateConfig::Order::TaggedSymbol
            )
          START_FIRST =
            T.let(
              :"start-first",
              DockerEngineRuby::ServiceSpec::UpdateConfig::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ServiceSpec::UpdateConfig::Order::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
