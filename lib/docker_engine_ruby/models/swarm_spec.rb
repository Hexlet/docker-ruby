# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class SwarmSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute ca_config
      #   CA configuration.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::CaConfig, nil]
      optional :ca_config, -> { DockerEngineRuby::SwarmSpec::CaConfig }, api_name: :CAConfig, nil?: true

      # @!attribute dispatcher
      #   Dispatcher configuration.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::Dispatcher, nil]
      optional :dispatcher, -> { DockerEngineRuby::SwarmSpec::Dispatcher }, api_name: :Dispatcher, nil?: true

      # @!attribute encryption_config
      #   Parameters related to encryption-at-rest.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::EncryptionConfig, nil]
      optional :encryption_config,
               -> { DockerEngineRuby::SwarmSpec::EncryptionConfig },
               api_name: :EncryptionConfig

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute name
      #   Name of the swarm.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute orchestration
      #   Orchestration configuration.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::Orchestration, nil]
      optional :orchestration,
               -> { DockerEngineRuby::SwarmSpec::Orchestration },
               api_name: :Orchestration,
               nil?: true

      # @!attribute raft
      #   Raft configuration.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::Raft, nil]
      optional :raft, -> { DockerEngineRuby::SwarmSpec::Raft }, api_name: :Raft

      # @!attribute task_defaults
      #   Defaults for creating tasks in this cluster.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec::TaskDefaults, nil]
      optional :task_defaults, -> { DockerEngineRuby::SwarmSpec::TaskDefaults }, api_name: :TaskDefaults

      # @!method initialize(ca_config: nil, dispatcher: nil, encryption_config: nil, labels: nil, name: nil, orchestration: nil, raft: nil, task_defaults: nil)
      #   User modifiable swarm configuration.
      #
      #   @param ca_config [DockerEngineRuby::Models::SwarmSpec::CaConfig, nil] CA configuration.
      #
      #   @param dispatcher [DockerEngineRuby::Models::SwarmSpec::Dispatcher, nil] Dispatcher configuration.
      #
      #   @param encryption_config [DockerEngineRuby::Models::SwarmSpec::EncryptionConfig] Parameters related to encryption-at-rest.
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param name [String] Name of the swarm.
      #
      #   @param orchestration [DockerEngineRuby::Models::SwarmSpec::Orchestration, nil] Orchestration configuration.
      #
      #   @param raft [DockerEngineRuby::Models::SwarmSpec::Raft] Raft configuration.
      #
      #   @param task_defaults [DockerEngineRuby::Models::SwarmSpec::TaskDefaults] Defaults for creating tasks in this cluster.

      # @see DockerEngineRuby::Models::SwarmSpec#ca_config
      class CaConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute external_c_as
        #
        #   @return [Array<DockerEngineRuby::Models::SwarmSpec::CaConfig::ExternalCA>, nil]
        optional :external_c_as,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA]
                 },
                 api_name: :ExternalCAs

        # @!attribute force_rotate
        #
        #   @return [Integer, nil]
        optional :force_rotate, Integer, api_name: :ForceRotate

        # @!attribute node_cert_expiry
        #
        #   @return [Integer, nil]
        optional :node_cert_expiry, Integer, api_name: :NodeCertExpiry

        # @!attribute signing_ca_cert
        #
        #   @return [String, nil]
        optional :signing_ca_cert, String, api_name: :SigningCACert

        # @!attribute signing_ca_key
        #
        #   @return [String, nil]
        optional :signing_ca_key, String, api_name: :SigningCAKey

        # @!method initialize(external_c_as: nil, force_rotate: nil, node_cert_expiry: nil, signing_ca_cert: nil, signing_ca_key: nil)
        #   CA configuration.
        #
        #   @param external_c_as [Array<DockerEngineRuby::Models::SwarmSpec::CaConfig::ExternalCA>]
        #   @param force_rotate [Integer]
        #   @param node_cert_expiry [Integer]
        #   @param signing_ca_cert [String]
        #   @param signing_ca_key [String]

        class ExternalCA < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute ca_cert
          #
          #   @return [String, nil]
          optional :ca_cert, String, api_name: :CACert

          # @!attribute options
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :options, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Options

          # @!attribute protocol
          #
          #   @return [Symbol, DockerEngineRuby::Models::SwarmSpec::CaConfig::ExternalCA::Protocol, nil]
          optional :protocol,
                   enum: -> { DockerEngineRuby::SwarmSpec::CaConfig::ExternalCA::Protocol },
                   api_name: :Protocol

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, api_name: :URL

          # @!method initialize(ca_cert: nil, options: nil, protocol: nil, url: nil)
          #   @param ca_cert [String]
          #   @param options [Hash{Symbol=>String}]
          #   @param protocol [Symbol, DockerEngineRuby::Models::SwarmSpec::CaConfig::ExternalCA::Protocol]
          #   @param url [String]

          # @see DockerEngineRuby::Models::SwarmSpec::CaConfig::ExternalCA#protocol
          module Protocol
            extend DockerEngineRuby::Internal::Type::Enum

            CFSSL = :cfssl

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see DockerEngineRuby::Models::SwarmSpec#dispatcher
      class Dispatcher < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute heartbeat_period
        #
        #   @return [Integer, nil]
        optional :heartbeat_period, Integer, api_name: :HeartbeatPeriod

        # @!method initialize(heartbeat_period: nil)
        #   Dispatcher configuration.
        #
        #   @param heartbeat_period [Integer]
      end

      # @see DockerEngineRuby::Models::SwarmSpec#encryption_config
      class EncryptionConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute auto_lock_managers
        #
        #   @return [Boolean, nil]
        optional :auto_lock_managers, DockerEngineRuby::Internal::Type::Boolean, api_name: :AutoLockManagers

        # @!method initialize(auto_lock_managers: nil)
        #   Parameters related to encryption-at-rest.
        #
        #   @param auto_lock_managers [Boolean]
      end

      # @see DockerEngineRuby::Models::SwarmSpec#orchestration
      class Orchestration < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute task_history_retention_limit
        #
        #   @return [Integer, nil]
        optional :task_history_retention_limit, Integer, api_name: :TaskHistoryRetentionLimit

        # @!method initialize(task_history_retention_limit: nil)
        #   Orchestration configuration.
        #
        #   @param task_history_retention_limit [Integer]
      end

      # @see DockerEngineRuby::Models::SwarmSpec#raft
      class Raft < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute election_tick
        #
        #   @return [Integer, nil]
        optional :election_tick, Integer, api_name: :ElectionTick

        # @!attribute heartbeat_tick
        #
        #   @return [Integer, nil]
        optional :heartbeat_tick, Integer, api_name: :HeartbeatTick

        # @!attribute keep_old_snapshots
        #
        #   @return [Integer, nil]
        optional :keep_old_snapshots, Integer, api_name: :KeepOldSnapshots

        # @!attribute log_entries_for_slow_followers
        #
        #   @return [Integer, nil]
        optional :log_entries_for_slow_followers, Integer, api_name: :LogEntriesForSlowFollowers

        # @!attribute snapshot_interval
        #
        #   @return [Integer, nil]
        optional :snapshot_interval, Integer, api_name: :SnapshotInterval

        # @!method initialize(election_tick: nil, heartbeat_tick: nil, keep_old_snapshots: nil, log_entries_for_slow_followers: nil, snapshot_interval: nil)
        #   Raft configuration.
        #
        #   @param election_tick [Integer]
        #   @param heartbeat_tick [Integer]
        #   @param keep_old_snapshots [Integer]
        #   @param log_entries_for_slow_followers [Integer]
        #   @param snapshot_interval [Integer]
      end

      # @see DockerEngineRuby::Models::SwarmSpec#task_defaults
      class TaskDefaults < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute log_driver
        #
        #   @return [DockerEngineRuby::Models::SwarmSpec::TaskDefaults::LogDriver, nil]
        optional :log_driver,
                 -> {
                   DockerEngineRuby::SwarmSpec::TaskDefaults::LogDriver
                 },
                 api_name: :LogDriver

        # @!method initialize(log_driver: nil)
        #   Defaults for creating tasks in this cluster.
        #
        #   @param log_driver [DockerEngineRuby::Models::SwarmSpec::TaskDefaults::LogDriver]

        # @see DockerEngineRuby::Models::SwarmSpec::TaskDefaults#log_driver
        class LogDriver < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute options
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :options, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Options

          # @!method initialize(name: nil, options: nil)
          #   @param name [String]
          #   @param options [Hash{Symbol=>String}]
        end
      end
    end
  end
end
