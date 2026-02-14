# typed: strong

module DockerEngineRuby
  module Models
    class SwarmSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SwarmSpec,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # CA configuration.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::CaConfig)) }
      attr_reader :ca_config

      sig do
        params(
          ca_config: T.nilable(DockerEngineRuby::SwarmSpec::CaConfig::OrHash)
        ).void
      end
      attr_writer :ca_config

      # Dispatcher configuration.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::Dispatcher)) }
      attr_reader :dispatcher

      sig do
        params(
          dispatcher: T.nilable(DockerEngineRuby::SwarmSpec::Dispatcher::OrHash)
        ).void
      end
      attr_writer :dispatcher

      # Parameters related to encryption-at-rest.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::EncryptionConfig)) }
      attr_reader :encryption_config

      sig do
        params(
          encryption_config:
            DockerEngineRuby::SwarmSpec::EncryptionConfig::OrHash
        ).void
      end
      attr_writer :encryption_config

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Name of the swarm.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Orchestration configuration.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::Orchestration)) }
      attr_reader :orchestration

      sig do
        params(
          orchestration:
            T.nilable(DockerEngineRuby::SwarmSpec::Orchestration::OrHash)
        ).void
      end
      attr_writer :orchestration

      # Raft configuration.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::Raft)) }
      attr_reader :raft

      sig { params(raft: DockerEngineRuby::SwarmSpec::Raft::OrHash).void }
      attr_writer :raft

      # Defaults for creating tasks in this cluster.
      sig { returns(T.nilable(DockerEngineRuby::SwarmSpec::TaskDefaults)) }
      attr_reader :task_defaults

      sig do
        params(
          task_defaults: DockerEngineRuby::SwarmSpec::TaskDefaults::OrHash
        ).void
      end
      attr_writer :task_defaults

      # User modifiable swarm configuration.
      sig do
        params(
          ca_config: T.nilable(DockerEngineRuby::SwarmSpec::CaConfig::OrHash),
          dispatcher:
            T.nilable(DockerEngineRuby::SwarmSpec::Dispatcher::OrHash),
          encryption_config:
            DockerEngineRuby::SwarmSpec::EncryptionConfig::OrHash,
          labels: T::Hash[Symbol, String],
          name: String,
          orchestration:
            T.nilable(DockerEngineRuby::SwarmSpec::Orchestration::OrHash),
          raft: DockerEngineRuby::SwarmSpec::Raft::OrHash,
          task_defaults: DockerEngineRuby::SwarmSpec::TaskDefaults::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # CA configuration.
        ca_config: nil,
        # Dispatcher configuration.
        dispatcher: nil,
        # Parameters related to encryption-at-rest.
        encryption_config: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Name of the swarm.
        name: nil,
        # Orchestration configuration.
        orchestration: nil,
        # Raft configuration.
        raft: nil,
        # Defaults for creating tasks in this cluster.
        task_defaults: nil
      )
      end

      sig do
        override.returns(
          {
            ca_config: T.nilable(DockerEngineRuby::SwarmSpec::CaConfig),
            dispatcher: T.nilable(DockerEngineRuby::SwarmSpec::Dispatcher),
            encryption_config: DockerEngineRuby::SwarmSpec::EncryptionConfig,
            labels: T::Hash[Symbol, String],
            name: String,
            orchestration:
              T.nilable(DockerEngineRuby::SwarmSpec::Orchestration),
            raft: DockerEngineRuby::SwarmSpec::Raft,
            task_defaults: DockerEngineRuby::SwarmSpec::TaskDefaults
          }
        )
      end
      def to_hash
      end

      class CaConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::CaConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA]
            )
          )
        end
        attr_reader :external_c_as

        sig do
          params(
            external_c_as:
              T::Array[
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::OrHash
              ]
          ).void
        end
        attr_writer :external_c_as

        sig { returns(T.nilable(Integer)) }
        attr_reader :force_rotate

        sig { params(force_rotate: Integer).void }
        attr_writer :force_rotate

        sig { returns(T.nilable(Integer)) }
        attr_reader :node_cert_expiry

        sig { params(node_cert_expiry: Integer).void }
        attr_writer :node_cert_expiry

        sig { returns(T.nilable(String)) }
        attr_reader :signing_ca_cert

        sig { params(signing_ca_cert: String).void }
        attr_writer :signing_ca_cert

        sig { returns(T.nilable(String)) }
        attr_reader :signing_ca_key

        sig { params(signing_ca_key: String).void }
        attr_writer :signing_ca_key

        # CA configuration.
        sig do
          params(
            external_c_as:
              T::Array[
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::OrHash
              ],
            force_rotate: Integer,
            node_cert_expiry: Integer,
            signing_ca_cert: String,
            signing_ca_key: String
          ).returns(T.attached_class)
        end
        def self.new(
          external_c_as: nil,
          force_rotate: nil,
          node_cert_expiry: nil,
          signing_ca_cert: nil,
          signing_ca_key: nil
        )
        end

        sig do
          override.returns(
            {
              external_c_as:
                T::Array[DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA],
              force_rotate: Integer,
              node_cert_expiry: Integer,
              signing_ca_cert: String,
              signing_ca_key: String
            }
          )
        end
        def to_hash
        end

        class ExternalCA < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :ca_cert

          sig { params(ca_cert: String).void }
          attr_writer :ca_cert

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :options

          sig { params(options: T::Hash[Symbol, String]).void }
          attr_writer :options

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::OrSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::OrSymbol
            ).void
          end
          attr_writer :protocol

          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(
              ca_cert: String,
              options: T::Hash[Symbol, String],
              protocol:
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(ca_cert: nil, options: nil, protocol: nil, url: nil)
          end

          sig do
            override.returns(
              {
                ca_cert: String,
                options: T::Hash[Symbol, String],
                protocol:
                  DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::OrSymbol,
                url: String
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
                  DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CFSSL =
              T.let(
                :cfssl,
                DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Dispatcher < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::Dispatcher,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :heartbeat_period

        sig { params(heartbeat_period: Integer).void }
        attr_writer :heartbeat_period

        # Dispatcher configuration.
        sig { params(heartbeat_period: Integer).returns(T.attached_class) }
        def self.new(heartbeat_period: nil)
        end

        sig { override.returns({ heartbeat_period: Integer }) }
        def to_hash
        end
      end

      class EncryptionConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::EncryptionConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :auto_lock_managers

        sig { params(auto_lock_managers: T::Boolean).void }
        attr_writer :auto_lock_managers

        # Parameters related to encryption-at-rest.
        sig { params(auto_lock_managers: T::Boolean).returns(T.attached_class) }
        def self.new(auto_lock_managers: nil)
        end

        sig { override.returns({ auto_lock_managers: T::Boolean }) }
        def to_hash
        end
      end

      class Orchestration < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::Orchestration,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :task_history_retention_limit

        sig { params(task_history_retention_limit: Integer).void }
        attr_writer :task_history_retention_limit

        # Orchestration configuration.
        sig do
          params(task_history_retention_limit: Integer).returns(
            T.attached_class
          )
        end
        def self.new(task_history_retention_limit: nil)
        end

        sig { override.returns({ task_history_retention_limit: Integer }) }
        def to_hash
        end
      end

      class Raft < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::Raft,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :election_tick

        sig { params(election_tick: Integer).void }
        attr_writer :election_tick

        sig { returns(T.nilable(Integer)) }
        attr_reader :heartbeat_tick

        sig { params(heartbeat_tick: Integer).void }
        attr_writer :heartbeat_tick

        sig { returns(T.nilable(Integer)) }
        attr_reader :keep_old_snapshots

        sig { params(keep_old_snapshots: Integer).void }
        attr_writer :keep_old_snapshots

        sig { returns(T.nilable(Integer)) }
        attr_reader :log_entries_for_slow_followers

        sig { params(log_entries_for_slow_followers: Integer).void }
        attr_writer :log_entries_for_slow_followers

        sig { returns(T.nilable(Integer)) }
        attr_reader :snapshot_interval

        sig { params(snapshot_interval: Integer).void }
        attr_writer :snapshot_interval

        # Raft configuration.
        sig do
          params(
            election_tick: Integer,
            heartbeat_tick: Integer,
            keep_old_snapshots: Integer,
            log_entries_for_slow_followers: Integer,
            snapshot_interval: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          election_tick: nil,
          heartbeat_tick: nil,
          keep_old_snapshots: nil,
          log_entries_for_slow_followers: nil,
          snapshot_interval: nil
        )
        end

        sig do
          override.returns(
            {
              election_tick: Integer,
              heartbeat_tick: Integer,
              keep_old_snapshots: Integer,
              log_entries_for_slow_followers: Integer,
              snapshot_interval: Integer
            }
          )
        end
        def to_hash
        end
      end

      class TaskDefaults < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmSpec::TaskDefaults,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver)
          )
        end
        attr_reader :log_driver

        sig do
          params(
            log_driver:
              DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver::OrHash
          ).void
        end
        attr_writer :log_driver

        # Defaults for creating tasks in this cluster.
        sig do
          params(
            log_driver:
              DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver::OrHash
          ).returns(T.attached_class)
        end
        def self.new(log_driver: nil)
        end

        sig do
          override.returns(
            { log_driver: DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver }
          )
        end
        def to_hash
        end

        class LogDriver < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver,
                DockerEngineRuby::Internal::AnyHash
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
      end
    end
  end
end
