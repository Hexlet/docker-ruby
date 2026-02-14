# typed: strong

module DockerEngineRuby
  module Models
    class Service < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Service, DockerEngineRuby::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      sig { returns(T.nilable(DockerEngineRuby::Service::Endpoint)) }
      attr_reader :endpoint

      sig { params(endpoint: DockerEngineRuby::Service::Endpoint::OrHash).void }
      attr_writer :endpoint

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The status of the service when it is in one of ReplicatedJob or GlobalJob modes.
      # Absent on Replicated and Global mode services. The JobIteration is an
      # ObjectVersion, but unlike the Service's version, does not need to be sent with
      # an update request.
      sig { returns(T.nilable(DockerEngineRuby::Service::JobStatus)) }
      attr_reader :job_status

      sig do
        params(job_status: DockerEngineRuby::Service::JobStatus::OrHash).void
      end
      attr_writer :job_status

      # The status of the service's tasks. Provided only when requested as part of a
      # ServiceList operation.
      sig { returns(T.nilable(DockerEngineRuby::Service::ServiceStatus)) }
      attr_reader :service_status

      sig do
        params(
          service_status: DockerEngineRuby::Service::ServiceStatus::OrHash
        ).void
      end
      attr_writer :service_status

      # User modifiable configuration for a service.
      sig { returns(T.nilable(DockerEngineRuby::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::Spec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # The status of a service update.
      sig { returns(T.nilable(DockerEngineRuby::Service::UpdateStatus)) }
      attr_reader :update_status

      sig do
        params(
          update_status: DockerEngineRuby::Service::UpdateStatus::OrHash
        ).void
      end
      attr_writer :update_status

      # The version number of the object such as node, service, etc. This is needed to
      # avoid conflicting writes. The client must send the version number along with the
      # modified specification when updating these objects.
      #
      # This approach ensures safe concurrency and determinism in that the change on the
      # object may not be applied if the version number has changed from the last read.
      # In other words, if two update requests specify the same base version, only one
      # of the requests can succeed. As a result, two separate update requests that
      # happen at the same time will not unintentionally overwrite each other.
      sig { returns(T.nilable(DockerEngineRuby::Service::Version)) }
      attr_reader :version

      sig { params(version: DockerEngineRuby::Service::Version::OrHash).void }
      attr_writer :version

      sig do
        params(
          created_at: String,
          endpoint: DockerEngineRuby::Service::Endpoint::OrHash,
          id: String,
          job_status: DockerEngineRuby::Service::JobStatus::OrHash,
          service_status: DockerEngineRuby::Service::ServiceStatus::OrHash,
          spec: DockerEngineRuby::Spec::OrHash,
          updated_at: String,
          update_status: DockerEngineRuby::Service::UpdateStatus::OrHash,
          version: DockerEngineRuby::Service::Version::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        endpoint: nil,
        id: nil,
        # The status of the service when it is in one of ReplicatedJob or GlobalJob modes.
        # Absent on Replicated and Global mode services. The JobIteration is an
        # ObjectVersion, but unlike the Service's version, does not need to be sent with
        # an update request.
        job_status: nil,
        # The status of the service's tasks. Provided only when requested as part of a
        # ServiceList operation.
        service_status: nil,
        # User modifiable configuration for a service.
        spec: nil,
        updated_at: nil,
        # The status of a service update.
        update_status: nil,
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
            created_at: String,
            endpoint: DockerEngineRuby::Service::Endpoint,
            id: String,
            job_status: DockerEngineRuby::Service::JobStatus,
            service_status: DockerEngineRuby::Service::ServiceStatus,
            spec: DockerEngineRuby::Spec,
            updated_at: String,
            update_status: DockerEngineRuby::Service::UpdateStatus,
            version: DockerEngineRuby::Service::Version
          }
        )
      end
      def to_hash
      end

      class Endpoint < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Service::Endpoint,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(T::Array[DockerEngineRuby::Service::Endpoint::Port])
          )
        end
        attr_reader :ports

        sig do
          params(
            ports: T::Array[DockerEngineRuby::Service::Endpoint::Port::OrHash]
          ).void
        end
        attr_writer :ports

        # Properties that can be configured to access and load balance a service.
        sig { returns(T.nilable(DockerEngineRuby::Service::Endpoint::Spec)) }
        attr_reader :spec

        sig do
          params(spec: DockerEngineRuby::Service::Endpoint::Spec::OrHash).void
        end
        attr_writer :spec

        sig do
          returns(
            T.nilable(T::Array[DockerEngineRuby::Service::Endpoint::VirtualIP])
          )
        end
        attr_reader :virtual_ips

        sig do
          params(
            virtual_ips:
              T::Array[DockerEngineRuby::Service::Endpoint::VirtualIP::OrHash]
          ).void
        end
        attr_writer :virtual_ips

        sig do
          params(
            ports: T::Array[DockerEngineRuby::Service::Endpoint::Port::OrHash],
            spec: DockerEngineRuby::Service::Endpoint::Spec::OrHash,
            virtual_ips:
              T::Array[DockerEngineRuby::Service::Endpoint::VirtualIP::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          ports: nil,
          # Properties that can be configured to access and load balance a service.
          spec: nil,
          virtual_ips: nil
        )
        end

        sig do
          override.returns(
            {
              ports: T::Array[DockerEngineRuby::Service::Endpoint::Port],
              spec: DockerEngineRuby::Service::Endpoint::Spec,
              virtual_ips:
                T::Array[DockerEngineRuby::Service::Endpoint::VirtualIP]
            }
          )
        end
        def to_hash
        end

        class Port < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Service::Endpoint::Port,
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
                DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                DockerEngineRuby::Service::Endpoint::Port::Protocol::OrSymbol
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
                DockerEngineRuby::Service::Endpoint::Port::PublishMode::TaggedSymbol
              )
            )
          end
          attr_reader :publish_mode

          sig do
            params(
              publish_mode:
                DockerEngineRuby::Service::Endpoint::Port::PublishMode::OrSymbol
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
                DockerEngineRuby::Service::Endpoint::Port::Protocol::OrSymbol,
              published_port: Integer,
              publish_mode:
                DockerEngineRuby::Service::Endpoint::Port::PublishMode::OrSymbol,
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
                  DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol,
                published_port: Integer,
                publish_mode:
                  DockerEngineRuby::Service::Endpoint::Port::PublishMode::TaggedSymbol,
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
                  DockerEngineRuby::Service::Endpoint::Port::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TCP =
              T.let(
                :tcp,
                DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol
              )
            UDP =
              T.let(
                :udp,
                DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol
              )
            SCTP =
              T.let(
                :sctp,
                DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::Service::Endpoint::Port::Protocol::TaggedSymbol
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
                  DockerEngineRuby::Service::Endpoint::Port::PublishMode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INGRESS =
              T.let(
                :ingress,
                DockerEngineRuby::Service::Endpoint::Port::PublishMode::TaggedSymbol
              )
            HOST =
              T.let(
                :host,
                DockerEngineRuby::Service::Endpoint::Port::PublishMode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::Service::Endpoint::Port::PublishMode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Spec < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Service::Endpoint::Spec,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          # The mode of resolution to use for internal load balancing between tasks.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::Service::Endpoint::Spec::Mode::TaggedSymbol
              )
            )
          end
          attr_reader :mode

          sig do
            params(
              mode: DockerEngineRuby::Service::Endpoint::Spec::Mode::OrSymbol
            ).void
          end
          attr_writer :mode

          # List of exposed ports that this service is accessible on from the outside. Ports
          # can only be provided if `vip` resolution mode is used.
          sig do
            returns(
              T.nilable(
                T::Array[DockerEngineRuby::Service::Endpoint::Spec::Port]
              )
            )
          end
          attr_reader :ports

          sig do
            params(
              ports:
                T::Array[
                  DockerEngineRuby::Service::Endpoint::Spec::Port::OrHash
                ]
            ).void
          end
          attr_writer :ports

          # Properties that can be configured to access and load balance a service.
          sig do
            params(
              mode: DockerEngineRuby::Service::Endpoint::Spec::Mode::OrSymbol,
              ports:
                T::Array[
                  DockerEngineRuby::Service::Endpoint::Spec::Port::OrHash
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
                mode:
                  DockerEngineRuby::Service::Endpoint::Spec::Mode::TaggedSymbol,
                ports: T::Array[DockerEngineRuby::Service::Endpoint::Spec::Port]
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
                T.all(Symbol, DockerEngineRuby::Service::Endpoint::Spec::Mode)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIP =
              T.let(
                :vip,
                DockerEngineRuby::Service::Endpoint::Spec::Mode::TaggedSymbol
              )
            DNSRR =
              T.let(
                :dnsrr,
                DockerEngineRuby::Service::Endpoint::Spec::Mode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::Service::Endpoint::Spec::Mode::TaggedSymbol
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
                  DockerEngineRuby::Service::Endpoint::Spec::Port,
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
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol
                )
              )
            end
            attr_reader :protocol

            sig do
              params(
                protocol:
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::OrSymbol
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
                  DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::TaggedSymbol
                )
              )
            end
            attr_reader :publish_mode

            sig do
              params(
                publish_mode:
                  DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::OrSymbol
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
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::OrSymbol,
                published_port: Integer,
                publish_mode:
                  DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::OrSymbol,
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
                    DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol,
                  published_port: Integer,
                  publish_mode:
                    DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::TaggedSymbol,
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
                    DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TCP =
                T.let(
                  :tcp,
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol
                )
              UDP =
                T.let(
                  :udp,
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol
                )
              SCTP =
                T.let(
                  :sctp,
                  DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::Service::Endpoint::Spec::Port::Protocol::TaggedSymbol
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
                    DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INGRESS =
                T.let(
                  :ingress,
                  DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::TaggedSymbol
                )
              HOST =
                T.let(
                  :host,
                  DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::Service::Endpoint::Spec::Port::PublishMode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class VirtualIP < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Service::Endpoint::VirtualIP,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :addr

          sig { params(addr: String).void }
          attr_writer :addr

          sig { returns(T.nilable(String)) }
          attr_reader :network_id

          sig { params(network_id: String).void }
          attr_writer :network_id

          sig do
            params(addr: String, network_id: String).returns(T.attached_class)
          end
          def self.new(addr: nil, network_id: nil)
          end

          sig { override.returns({ addr: String, network_id: String }) }
          def to_hash
          end
        end
      end

      class JobStatus < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Service::JobStatus,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        sig do
          returns(T.nilable(DockerEngineRuby::Service::JobStatus::JobIteration))
        end
        attr_reader :job_iteration

        sig do
          params(
            job_iteration:
              DockerEngineRuby::Service::JobStatus::JobIteration::OrHash
          ).void
        end
        attr_writer :job_iteration

        # The last time, as observed by the server, that this job was started.
        sig { returns(T.nilable(String)) }
        attr_reader :last_execution

        sig { params(last_execution: String).void }
        attr_writer :last_execution

        # The status of the service when it is in one of ReplicatedJob or GlobalJob modes.
        # Absent on Replicated and Global mode services. The JobIteration is an
        # ObjectVersion, but unlike the Service's version, does not need to be sent with
        # an update request.
        sig do
          params(
            job_iteration:
              DockerEngineRuby::Service::JobStatus::JobIteration::OrHash,
            last_execution: String
          ).returns(T.attached_class)
        end
        def self.new(
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
          # The last time, as observed by the server, that this job was started.
          last_execution: nil
        )
        end

        sig do
          override.returns(
            {
              job_iteration: DockerEngineRuby::Service::JobStatus::JobIteration,
              last_execution: String
            }
          )
        end
        def to_hash
        end

        class JobIteration < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Service::JobStatus::JobIteration,
                DockerEngineRuby::Internal::AnyHash
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

      class ServiceStatus < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Service::ServiceStatus,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # The number of tasks for a job that are in the Completed state. This field must
        # be cross-referenced with the service type, as the value of 0 may mean the
        # service is not in a job mode, or it may mean the job-mode service has no tasks
        # yet Completed.
        sig { returns(T.nilable(Integer)) }
        attr_reader :completed_tasks

        sig { params(completed_tasks: Integer).void }
        attr_writer :completed_tasks

        # The number of tasks for the service desired to be running. For replicated
        # services, this is the replica count from the service spec. For global services,
        # this is computed by taking count of all tasks for the service with a Desired
        # State other than Shutdown.
        sig { returns(T.nilable(Integer)) }
        attr_reader :desired_tasks

        sig { params(desired_tasks: Integer).void }
        attr_writer :desired_tasks

        # The number of tasks for the service currently in the Running state.
        sig { returns(T.nilable(Integer)) }
        attr_reader :running_tasks

        sig { params(running_tasks: Integer).void }
        attr_writer :running_tasks

        # The status of the service's tasks. Provided only when requested as part of a
        # ServiceList operation.
        sig do
          params(
            completed_tasks: Integer,
            desired_tasks: Integer,
            running_tasks: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The number of tasks for a job that are in the Completed state. This field must
          # be cross-referenced with the service type, as the value of 0 may mean the
          # service is not in a job mode, or it may mean the job-mode service has no tasks
          # yet Completed.
          completed_tasks: nil,
          # The number of tasks for the service desired to be running. For replicated
          # services, this is the replica count from the service spec. For global services,
          # this is computed by taking count of all tasks for the service with a Desired
          # State other than Shutdown.
          desired_tasks: nil,
          # The number of tasks for the service currently in the Running state.
          running_tasks: nil
        )
        end

        sig do
          override.returns(
            {
              completed_tasks: Integer,
              desired_tasks: Integer,
              running_tasks: Integer
            }
          )
        end
        def to_hash
        end
      end

      class UpdateStatus < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Service::UpdateStatus,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :completed_at

        sig { params(completed_at: String).void }
        attr_writer :completed_at

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig { returns(T.nilable(String)) }
        attr_reader :started_at

        sig { params(started_at: String).void }
        attr_writer :started_at

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
            )
          )
        end
        attr_reader :state

        sig do
          params(
            state: DockerEngineRuby::Service::UpdateStatus::State::OrSymbol
          ).void
        end
        attr_writer :state

        # The status of a service update.
        sig do
          params(
            completed_at: String,
            message: String,
            started_at: String,
            state: DockerEngineRuby::Service::UpdateStatus::State::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          completed_at: nil,
          message: nil,
          started_at: nil,
          state: nil
        )
        end

        sig do
          override.returns(
            {
              completed_at: String,
              message: String,
              started_at: String,
              state:
                DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module State
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::Service::UpdateStatus::State)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UPDATING =
            T.let(
              :updating,
              DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::Service::UpdateStatus::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Version < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Service::Version,
              DockerEngineRuby::Internal::AnyHash
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
