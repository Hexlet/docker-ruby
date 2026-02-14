# typed: strong

module DockerEngine
  module Models
    class Node < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::Node, DockerEngine::Internal::AnyHash)
        end

      # Date and time at which the node was added to the swarm in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # NodeDescription encapsulates the properties of the Node as reported by the
      # agent.
      sig { returns(T.nilable(DockerEngine::Node::Description)) }
      attr_reader :description

      sig { params(description: DockerEngine::Node::Description::OrHash).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # ManagerStatus represents the status of a manager.
      #
      # It provides the current status of a node's manager component, if the node is a
      # manager.
      sig { returns(T.nilable(DockerEngine::Node::ManagerStatus)) }
      attr_reader :manager_status

      sig do
        params(
          manager_status: T.nilable(DockerEngine::Node::ManagerStatus::OrHash)
        ).void
      end
      attr_writer :manager_status

      sig { returns(T.nilable(DockerEngine::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngine::Spec::OrHash).void }
      attr_writer :spec

      # NodeStatus represents the status of a node.
      #
      # It provides the current status of the node, as seen by the manager.
      sig { returns(T.nilable(DockerEngine::Node::Status)) }
      attr_reader :status

      sig { params(status: DockerEngine::Node::Status::OrHash).void }
      attr_writer :status

      # Date and time at which the node was last updated in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
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
      sig { returns(T.nilable(DockerEngine::Node::Version)) }
      attr_reader :version

      sig { params(version: DockerEngine::Node::Version::OrHash).void }
      attr_writer :version

      sig do
        params(
          created_at: String,
          description: DockerEngine::Node::Description::OrHash,
          id: String,
          manager_status: T.nilable(DockerEngine::Node::ManagerStatus::OrHash),
          spec: DockerEngine::Spec::OrHash,
          status: DockerEngine::Node::Status::OrHash,
          updated_at: String,
          version: DockerEngine::Node::Version::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Date and time at which the node was added to the swarm in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        created_at: nil,
        # NodeDescription encapsulates the properties of the Node as reported by the
        # agent.
        description: nil,
        id: nil,
        # ManagerStatus represents the status of a manager.
        #
        # It provides the current status of a node's manager component, if the node is a
        # manager.
        manager_status: nil,
        spec: nil,
        # NodeStatus represents the status of a node.
        #
        # It provides the current status of the node, as seen by the manager.
        status: nil,
        # Date and time at which the node was last updated in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
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
            created_at: String,
            description: DockerEngine::Node::Description,
            id: String,
            manager_status: T.nilable(DockerEngine::Node::ManagerStatus),
            spec: DockerEngine::Spec,
            status: DockerEngine::Node::Status,
            updated_at: String,
            version: DockerEngine::Node::Version
          }
        )
      end
      def to_hash
      end

      class Description < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::Node::Description,
              DockerEngine::Internal::AnyHash
            )
          end

        # EngineDescription provides information about an engine.
        sig { returns(T.nilable(DockerEngine::Node::Description::Engine)) }
        attr_reader :engine

        sig do
          params(engine: DockerEngine::Node::Description::Engine::OrHash).void
        end
        attr_writer :engine

        sig { returns(T.nilable(String)) }
        attr_reader :hostname

        sig { params(hostname: String).void }
        attr_writer :hostname

        # Platform represents the platform (Arch/OS).
        sig { returns(T.nilable(DockerEngine::Node::Description::Platform)) }
        attr_reader :platform

        sig do
          params(
            platform: DockerEngine::Node::Description::Platform::OrHash
          ).void
        end
        attr_writer :platform

        # An object describing the resources which can be advertised by a node and
        # requested by a task.
        sig { returns(T.nilable(DockerEngine::Node::Description::Resources)) }
        attr_reader :resources

        sig do
          params(
            resources: DockerEngine::Node::Description::Resources::OrHash
          ).void
        end
        attr_writer :resources

        # Information about the issuer of leaf TLS certificates and the trusted root CA
        # certificate.
        sig { returns(T.nilable(DockerEngine::Node::Description::TlsInfo)) }
        attr_reader :tls_info

        sig do
          params(
            tls_info: DockerEngine::Node::Description::TlsInfo::OrHash
          ).void
        end
        attr_writer :tls_info

        # NodeDescription encapsulates the properties of the Node as reported by the
        # agent.
        sig do
          params(
            engine: DockerEngine::Node::Description::Engine::OrHash,
            hostname: String,
            platform: DockerEngine::Node::Description::Platform::OrHash,
            resources: DockerEngine::Node::Description::Resources::OrHash,
            tls_info: DockerEngine::Node::Description::TlsInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # EngineDescription provides information about an engine.
          engine: nil,
          hostname: nil,
          # Platform represents the platform (Arch/OS).
          platform: nil,
          # An object describing the resources which can be advertised by a node and
          # requested by a task.
          resources: nil,
          # Information about the issuer of leaf TLS certificates and the trusted root CA
          # certificate.
          tls_info: nil
        )
        end

        sig do
          override.returns(
            {
              engine: DockerEngine::Node::Description::Engine,
              hostname: String,
              platform: DockerEngine::Node::Description::Platform,
              resources: DockerEngine::Node::Description::Resources,
              tls_info: DockerEngine::Node::Description::TlsInfo
            }
          )
        end
        def to_hash
        end

        class Engine < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Node::Description::Engine,
                DockerEngine::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :engine_version

          sig { params(engine_version: String).void }
          attr_writer :engine_version

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :labels

          sig { params(labels: T::Hash[Symbol, String]).void }
          attr_writer :labels

          sig do
            returns(
              T.nilable(
                T::Array[DockerEngine::Node::Description::Engine::Plugin]
              )
            )
          end
          attr_reader :plugins

          sig do
            params(
              plugins:
                T::Array[
                  DockerEngine::Node::Description::Engine::Plugin::OrHash
                ]
            ).void
          end
          attr_writer :plugins

          # EngineDescription provides information about an engine.
          sig do
            params(
              engine_version: String,
              labels: T::Hash[Symbol, String],
              plugins:
                T::Array[
                  DockerEngine::Node::Description::Engine::Plugin::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(engine_version: nil, labels: nil, plugins: nil)
          end

          sig do
            override.returns(
              {
                engine_version: String,
                labels: T::Hash[Symbol, String],
                plugins:
                  T::Array[DockerEngine::Node::Description::Engine::Plugin]
              }
            )
          end
          def to_hash
          end

          class Plugin < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::Node::Description::Engine::Plugin,
                  DockerEngine::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            sig { params(name: String, type: String).returns(T.attached_class) }
            def self.new(name: nil, type: nil)
            end

            sig { override.returns({ name: String, type: String }) }
            def to_hash
            end
          end
        end

        class Platform < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Node::Description::Platform,
                DockerEngine::Internal::AnyHash
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

        class Resources < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Node::Description::Resources,
                DockerEngine::Internal::AnyHash
              )
            end

          # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
          # resources (e.g, `GPU=UUID1`).
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngine::Node::Description::Resources::GenericResource
                ]
              )
            )
          end
          attr_reader :generic_resources

          sig do
            params(
              generic_resources:
                T::Array[
                  DockerEngine::Node::Description::Resources::GenericResource::OrHash
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
                  DockerEngine::Node::Description::Resources::GenericResource::OrHash
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
                    DockerEngine::Node::Description::Resources::GenericResource
                  ],
                memory_bytes: Integer,
                nano_cpus: Integer
              }
            )
          end
          def to_hash
          end

          class GenericResource < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::Node::Description::Resources::GenericResource,
                  DockerEngine::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngine::Node::Description::Resources::GenericResource::DiscreteResourceSpec
                )
              )
            end
            attr_reader :discrete_resource_spec

            sig do
              params(
                discrete_resource_spec:
                  DockerEngine::Node::Description::Resources::GenericResource::DiscreteResourceSpec::OrHash
              ).void
            end
            attr_writer :discrete_resource_spec

            sig do
              returns(
                T.nilable(
                  DockerEngine::Node::Description::Resources::GenericResource::NamedResourceSpec
                )
              )
            end
            attr_reader :named_resource_spec

            sig do
              params(
                named_resource_spec:
                  DockerEngine::Node::Description::Resources::GenericResource::NamedResourceSpec::OrHash
              ).void
            end
            attr_writer :named_resource_spec

            sig do
              params(
                discrete_resource_spec:
                  DockerEngine::Node::Description::Resources::GenericResource::DiscreteResourceSpec::OrHash,
                named_resource_spec:
                  DockerEngine::Node::Description::Resources::GenericResource::NamedResourceSpec::OrHash
              ).returns(T.attached_class)
            end
            def self.new(discrete_resource_spec: nil, named_resource_spec: nil)
            end

            sig do
              override.returns(
                {
                  discrete_resource_spec:
                    DockerEngine::Node::Description::Resources::GenericResource::DiscreteResourceSpec,
                  named_resource_spec:
                    DockerEngine::Node::Description::Resources::GenericResource::NamedResourceSpec
                }
              )
            end
            def to_hash
            end

            class DiscreteResourceSpec < DockerEngine::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngine::Node::Description::Resources::GenericResource::DiscreteResourceSpec,
                    DockerEngine::Internal::AnyHash
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

            class NamedResourceSpec < DockerEngine::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngine::Node::Description::Resources::GenericResource::NamedResourceSpec,
                    DockerEngine::Internal::AnyHash
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

        class TlsInfo < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Node::Description::TlsInfo,
                DockerEngine::Internal::AnyHash
              )
            end

          # The base64-url-safe-encoded raw public key bytes of the issuer.
          sig { returns(T.nilable(String)) }
          attr_reader :cert_issuer_public_key

          sig { params(cert_issuer_public_key: String).void }
          attr_writer :cert_issuer_public_key

          # The base64-url-safe-encoded raw subject bytes of the issuer.
          sig { returns(T.nilable(String)) }
          attr_reader :cert_issuer_subject

          sig { params(cert_issuer_subject: String).void }
          attr_writer :cert_issuer_subject

          # The root CA certificate(s) that are used to validate leaf TLS certificates.
          sig { returns(T.nilable(String)) }
          attr_reader :trust_root

          sig { params(trust_root: String).void }
          attr_writer :trust_root

          # Information about the issuer of leaf TLS certificates and the trusted root CA
          # certificate.
          sig do
            params(
              cert_issuer_public_key: String,
              cert_issuer_subject: String,
              trust_root: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The base64-url-safe-encoded raw public key bytes of the issuer.
            cert_issuer_public_key: nil,
            # The base64-url-safe-encoded raw subject bytes of the issuer.
            cert_issuer_subject: nil,
            # The root CA certificate(s) that are used to validate leaf TLS certificates.
            trust_root: nil
          )
          end

          sig do
            override.returns(
              {
                cert_issuer_public_key: String,
                cert_issuer_subject: String,
                trust_root: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class ManagerStatus < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::Node::ManagerStatus,
              DockerEngine::Internal::AnyHash
            )
          end

        # The IP address and port at which the manager is reachable.
        sig { returns(T.nilable(String)) }
        attr_reader :addr

        sig { params(addr: String).void }
        attr_writer :addr

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :leader

        sig { params(leader: T::Boolean).void }
        attr_writer :leader

        # Reachability represents the reachability of a node.
        sig do
          returns(
            T.nilable(
              DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
            )
          )
        end
        attr_reader :reachability

        sig do
          params(
            reachability:
              DockerEngine::Node::ManagerStatus::Reachability::OrSymbol
          ).void
        end
        attr_writer :reachability

        # ManagerStatus represents the status of a manager.
        #
        # It provides the current status of a node's manager component, if the node is a
        # manager.
        sig do
          params(
            addr: String,
            leader: T::Boolean,
            reachability:
              DockerEngine::Node::ManagerStatus::Reachability::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The IP address and port at which the manager is reachable.
          addr: nil,
          leader: nil,
          # Reachability represents the reachability of a node.
          reachability: nil
        )
        end

        sig do
          override.returns(
            {
              addr: String,
              leader: T::Boolean,
              reachability:
                DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Reachability represents the reachability of a node.
        module Reachability
          extend DockerEngine::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngine::Node::ManagerStatus::Reachability)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UNKNOWN =
            T.let(
              :unknown,
              DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
            )
          UNREACHABLE =
            T.let(
              :unreachable,
              DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
            )
          REACHABLE =
            T.let(
              :reachable,
              DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngine::Node::ManagerStatus::Reachability::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Status < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(DockerEngine::Node::Status, DockerEngine::Internal::AnyHash)
          end

        # IP address of the node.
        sig { returns(T.nilable(String)) }
        attr_reader :addr

        sig { params(addr: String).void }
        attr_writer :addr

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # NodeState represents the state of a node.
        sig do
          returns(T.nilable(DockerEngine::Node::Status::State::TaggedSymbol))
        end
        attr_reader :state

        sig { params(state: DockerEngine::Node::Status::State::OrSymbol).void }
        attr_writer :state

        # NodeStatus represents the status of a node.
        #
        # It provides the current status of the node, as seen by the manager.
        sig do
          params(
            addr: String,
            message: String,
            state: DockerEngine::Node::Status::State::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # IP address of the node.
          addr: nil,
          message: nil,
          # NodeState represents the state of a node.
          state: nil
        )
        end

        sig do
          override.returns(
            {
              addr: String,
              message: String,
              state: DockerEngine::Node::Status::State::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # NodeState represents the state of a node.
        module State
          extend DockerEngine::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, DockerEngine::Node::Status::State) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UNKNOWN =
            T.let(:unknown, DockerEngine::Node::Status::State::TaggedSymbol)
          DOWN = T.let(:down, DockerEngine::Node::Status::State::TaggedSymbol)
          READY = T.let(:ready, DockerEngine::Node::Status::State::TaggedSymbol)
          DISCONNECTED =
            T.let(
              :disconnected,
              DockerEngine::Node::Status::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[DockerEngine::Node::Status::State::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class Version < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(DockerEngine::Node::Version, DockerEngine::Internal::AnyHash)
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
