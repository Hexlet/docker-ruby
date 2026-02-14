# typed: strong

module DockerEngineAPI
  module Models
    class Task < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineAPI::Task, DockerEngineAPI::Internal::AnyHash)
        end

      # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
      # resources (e.g, `GPU=UUID1`).
      sig do
        returns(
          T.nilable(T::Array[DockerEngineAPI::Task::AssignedGenericResource])
        )
      end
      attr_reader :assigned_generic_resources

      sig do
        params(
          assigned_generic_resources:
            T::Array[DockerEngineAPI::Task::AssignedGenericResource::OrHash]
        ).void
      end
      attr_writer :assigned_generic_resources

      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      sig do
        returns(T.nilable(DockerEngineAPI::Task::DesiredState::TaggedSymbol))
      end
      attr_reader :desired_state

      sig do
        params(
          desired_state: DockerEngineAPI::Task::DesiredState::OrSymbol
        ).void
      end
      attr_writer :desired_state

      # The ID of the task.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The version number of the object such as node, service, etc. This is needed to
      # avoid conflicting writes. The client must send the version number along with the
      # modified specification when updating these objects.
      #
      # This approach ensures safe concurrency and determinism in that the change on the
      # object may not be applied if the version number has changed from the last read.
      # In other words, if two update requests specify the same base version, only one
      # of the requests can succeed. As a result, two separate update requests that
      # happen at the same time will not unintentionally overwrite each other.
      sig { returns(T.nilable(DockerEngineAPI::Task::JobIteration)) }
      attr_reader :job_iteration

      sig do
        params(job_iteration: DockerEngineAPI::Task::JobIteration::OrHash).void
      end
      attr_writer :job_iteration

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Name of the task.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # The ID of the node that this task is on.
      sig { returns(T.nilable(String)) }
      attr_reader :node_id

      sig { params(node_id: String).void }
      attr_writer :node_id

      # The ID of the service this task is part of.
      sig { returns(T.nilable(String)) }
      attr_reader :service_id

      sig { params(service_id: String).void }
      attr_writer :service_id

      sig { returns(T.nilable(Integer)) }
      attr_reader :slot

      sig { params(slot: Integer).void }
      attr_writer :slot

      # User modifiable task configuration.
      sig { returns(T.nilable(DockerEngineAPI::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngineAPI::Spec::OrHash).void }
      attr_writer :spec

      # represents the status of a task.
      sig { returns(T.nilable(DockerEngineAPI::Task::Status)) }
      attr_reader :status

      sig { params(status: DockerEngineAPI::Task::Status::OrHash).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # The version number of the object such as node, service, etc. This is needed to
      # avoid conflicting writes. The client must send the version number along with the
      # modified specification when updating these objects.
      #
      # This approach ensures safe concurrency and determinism in that the change on the
      # object may not be applied if the version number has changed from the last read.
      # In other words, if two update requests specify the same base version, only one
      # of the requests can succeed. As a result, two separate update requests that
      # happen at the same time will not unintentionally overwrite each other.
      sig { returns(T.nilable(DockerEngineAPI::Task::Version)) }
      attr_reader :version

      sig { params(version: DockerEngineAPI::Task::Version::OrHash).void }
      attr_writer :version

      sig do
        params(
          assigned_generic_resources:
            T::Array[DockerEngineAPI::Task::AssignedGenericResource::OrHash],
          created_at: String,
          desired_state: DockerEngineAPI::Task::DesiredState::OrSymbol,
          id: String,
          job_iteration: DockerEngineAPI::Task::JobIteration::OrHash,
          labels: T::Hash[Symbol, String],
          name: String,
          node_id: String,
          service_id: String,
          slot: Integer,
          spec: DockerEngineAPI::Spec::OrHash,
          status: DockerEngineAPI::Task::Status::OrHash,
          updated_at: String,
          version: DockerEngineAPI::Task::Version::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
        # resources (e.g, `GPU=UUID1`).
        assigned_generic_resources: nil,
        created_at: nil,
        desired_state: nil,
        # The ID of the task.
        id: nil,
        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        job_iteration: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Name of the task.
        name: nil,
        # The ID of the node that this task is on.
        node_id: nil,
        # The ID of the service this task is part of.
        service_id: nil,
        slot: nil,
        # User modifiable task configuration.
        spec: nil,
        # represents the status of a task.
        status: nil,
        updated_at: nil,
        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        version: nil
      )
      end

      sig do
        override.returns(
          {
            assigned_generic_resources:
              T::Array[DockerEngineAPI::Task::AssignedGenericResource],
            created_at: String,
            desired_state: DockerEngineAPI::Task::DesiredState::TaggedSymbol,
            id: String,
            job_iteration: DockerEngineAPI::Task::JobIteration,
            labels: T::Hash[Symbol, String],
            name: String,
            node_id: String,
            service_id: String,
            slot: Integer,
            spec: DockerEngineAPI::Spec,
            status: DockerEngineAPI::Task::Status,
            updated_at: String,
            version: DockerEngineAPI::Task::Version
          }
        )
      end
      def to_hash
      end

      class AssignedGenericResource < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Task::AssignedGenericResource,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              DockerEngineAPI::Task::AssignedGenericResource::DiscreteResourceSpec
            )
          )
        end
        attr_reader :discrete_resource_spec

        sig do
          params(
            discrete_resource_spec:
              DockerEngineAPI::Task::AssignedGenericResource::DiscreteResourceSpec::OrHash
          ).void
        end
        attr_writer :discrete_resource_spec

        sig do
          returns(
            T.nilable(
              DockerEngineAPI::Task::AssignedGenericResource::NamedResourceSpec
            )
          )
        end
        attr_reader :named_resource_spec

        sig do
          params(
            named_resource_spec:
              DockerEngineAPI::Task::AssignedGenericResource::NamedResourceSpec::OrHash
          ).void
        end
        attr_writer :named_resource_spec

        sig do
          params(
            discrete_resource_spec:
              DockerEngineAPI::Task::AssignedGenericResource::DiscreteResourceSpec::OrHash,
            named_resource_spec:
              DockerEngineAPI::Task::AssignedGenericResource::NamedResourceSpec::OrHash
          ).returns(T.attached_class)
        end
        def self.new(discrete_resource_spec: nil, named_resource_spec: nil)
        end

        sig do
          override.returns(
            {
              discrete_resource_spec:
                DockerEngineAPI::Task::AssignedGenericResource::DiscreteResourceSpec,
              named_resource_spec:
                DockerEngineAPI::Task::AssignedGenericResource::NamedResourceSpec
            }
          )
        end
        def to_hash
        end

        class DiscreteResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Task::AssignedGenericResource::DiscreteResourceSpec,
                DockerEngineAPI::Internal::AnyHash
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

          sig { params(kind: String, value: Integer).returns(T.attached_class) }
          def self.new(kind: nil, value: nil)
          end

          sig { override.returns({ kind: String, value: Integer }) }
          def to_hash
          end
        end

        class NamedResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Task::AssignedGenericResource::NamedResourceSpec,
                DockerEngineAPI::Internal::AnyHash
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

          sig { params(kind: String, value: String).returns(T.attached_class) }
          def self.new(kind: nil, value: nil)
          end

          sig { override.returns({ kind: String, value: String }) }
          def to_hash
          end
        end
      end

      module DesiredState
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DockerEngineAPI::Task::DesiredState) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NEW = T.let(:new, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        ALLOCATED =
          T.let(:allocated, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        PENDING =
          T.let(:pending, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        ASSIGNED =
          T.let(:assigned, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        ACCEPTED =
          T.let(:accepted, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        PREPARING =
          T.let(:preparing, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        READY = T.let(:ready, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        STARTING =
          T.let(:starting, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        RUNNING =
          T.let(:running, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        COMPLETE =
          T.let(:complete, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        SHUTDOWN =
          T.let(:shutdown, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        FAILED =
          T.let(:failed, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        REJECTED =
          T.let(:rejected, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        REMOVE =
          T.let(:remove, DockerEngineAPI::Task::DesiredState::TaggedSymbol)
        ORPHANED =
          T.let(:orphaned, DockerEngineAPI::Task::DesiredState::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineAPI::Task::DesiredState::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class JobIteration < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Task::JobIteration,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :index

        sig { params(index: Integer).void }
        attr_writer :index

        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        sig { params(index: Integer).returns(T.attached_class) }
        def self.new(index: nil)
        end

        sig { override.returns({ index: Integer }) }
        def to_hash
        end
      end

      class Status < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Task::Status,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # represents the status of a container.
        sig do
          returns(T.nilable(DockerEngineAPI::Task::Status::ContainerStatus))
        end
        attr_reader :container_status

        sig do
          params(
            container_status:
              DockerEngineAPI::Task::Status::ContainerStatus::OrHash
          ).void
        end
        attr_writer :container_status

        sig { returns(T.nilable(String)) }
        attr_reader :err

        sig { params(err: String).void }
        attr_writer :err

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # represents the port status of a task's host ports whose service has published
        # host ports
        sig { returns(T.nilable(DockerEngineAPI::Task::Status::PortStatus)) }
        attr_reader :port_status

        sig do
          params(
            port_status: DockerEngineAPI::Task::Status::PortStatus::OrHash
          ).void
        end
        attr_writer :port_status

        sig do
          returns(T.nilable(DockerEngineAPI::Task::Status::State::TaggedSymbol))
        end
        attr_reader :state

        sig do
          params(state: DockerEngineAPI::Task::Status::State::OrSymbol).void
        end
        attr_writer :state

        sig { returns(T.nilable(String)) }
        attr_reader :timestamp

        sig { params(timestamp: String).void }
        attr_writer :timestamp

        # represents the status of a task.
        sig do
          params(
            container_status:
              DockerEngineAPI::Task::Status::ContainerStatus::OrHash,
            err: String,
            message: String,
            port_status: DockerEngineAPI::Task::Status::PortStatus::OrHash,
            state: DockerEngineAPI::Task::Status::State::OrSymbol,
            timestamp: String
          ).returns(T.attached_class)
        end
        def self.new(
          # represents the status of a container.
          container_status: nil,
          err: nil,
          message: nil,
          # represents the port status of a task's host ports whose service has published
          # host ports
          port_status: nil,
          state: nil,
          timestamp: nil
        )
        end

        sig do
          override.returns(
            {
              container_status: DockerEngineAPI::Task::Status::ContainerStatus,
              err: String,
              message: String,
              port_status: DockerEngineAPI::Task::Status::PortStatus,
              state: DockerEngineAPI::Task::Status::State::TaggedSymbol,
              timestamp: String
            }
          )
        end
        def to_hash
        end

        class ContainerStatus < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Task::Status::ContainerStatus,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :container_id

          sig { params(container_id: String).void }
          attr_writer :container_id

          sig { returns(T.nilable(Integer)) }
          attr_reader :exit_code

          sig { params(exit_code: Integer).void }
          attr_writer :exit_code

          sig { returns(T.nilable(Integer)) }
          attr_reader :pid

          sig { params(pid: Integer).void }
          attr_writer :pid

          # represents the status of a container.
          sig do
            params(
              container_id: String,
              exit_code: Integer,
              pid: Integer
            ).returns(T.attached_class)
          end
          def self.new(container_id: nil, exit_code: nil, pid: nil)
          end

          sig do
            override.returns(
              { container_id: String, exit_code: Integer, pid: Integer }
            )
          end
          def to_hash
          end
        end

        class PortStatus < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Task::Status::PortStatus,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[DockerEngineAPI::Task::Status::PortStatus::Port]
              )
            )
          end
          attr_reader :ports

          sig do
            params(
              ports:
                T::Array[
                  DockerEngineAPI::Task::Status::PortStatus::Port::OrHash
                ]
            ).void
          end
          attr_writer :ports

          # represents the port status of a task's host ports whose service has published
          # host ports
          sig do
            params(
              ports:
                T::Array[
                  DockerEngineAPI::Task::Status::PortStatus::Port::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(ports: nil)
          end

          sig do
            override.returns(
              {
                ports: T::Array[DockerEngineAPI::Task::Status::PortStatus::Port]
              }
            )
          end
          def to_hash
          end

          class Port < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Task::Status::PortStatus::Port,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol
                )
              )
            end
            attr_reader :protocol

            sig do
              params(
                protocol:
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::OrSymbol
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
                  DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::TaggedSymbol
                )
              )
            end
            attr_reader :publish_mode

            sig do
              params(
                publish_mode:
                  DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::OrSymbol
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
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::OrSymbol,
                published_port: Integer,
                publish_mode:
                  DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::OrSymbol,
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
                    DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol,
                  published_port: Integer,
                  publish_mode:
                    DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::TaggedSymbol,
                  target_port: Integer
                }
              )
            end
            def to_hash
            end

            module Protocol
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::Task::Status::PortStatus::Port::Protocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TCP =
                T.let(
                  :tcp,
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol
                )
              UDP =
                T.let(
                  :udp,
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol
                )
              SCTP =
                T.let(
                  :sctp,
                  DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::Task::Status::PortStatus::Port::Protocol::TaggedSymbol
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
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INGRESS =
                T.let(
                  :ingress,
                  DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::TaggedSymbol
                )
              HOST =
                T.let(
                  :host,
                  DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::Task::Status::PortStatus::Port::PublishMode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        module State
          extend DockerEngineAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, DockerEngineAPI::Task::Status::State) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NEW = T.let(:new, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          ALLOCATED =
            T.let(
              :allocated,
              DockerEngineAPI::Task::Status::State::TaggedSymbol
            )
          PENDING =
            T.let(:pending, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          ASSIGNED =
            T.let(:assigned, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          ACCEPTED =
            T.let(:accepted, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          PREPARING =
            T.let(
              :preparing,
              DockerEngineAPI::Task::Status::State::TaggedSymbol
            )
          READY =
            T.let(:ready, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          STARTING =
            T.let(:starting, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          RUNNING =
            T.let(:running, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          COMPLETE =
            T.let(:complete, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          SHUTDOWN =
            T.let(:shutdown, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          FAILED =
            T.let(:failed, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          REJECTED =
            T.let(:rejected, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          REMOVE =
            T.let(:remove, DockerEngineAPI::Task::Status::State::TaggedSymbol)
          ORPHANED =
            T.let(:orphaned, DockerEngineAPI::Task::Status::State::TaggedSymbol)

          sig do
            override.returns(
              T::Array[DockerEngineAPI::Task::Status::State::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class Version < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Task::Version,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :index

        sig { params(index: Integer).void }
        attr_writer :index

        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        sig { params(index: Integer).returns(T.attached_class) }
        def self.new(index: nil)
        end

        sig { override.returns({ index: Integer }) }
        def to_hash
        end
      end
    end
  end
end
