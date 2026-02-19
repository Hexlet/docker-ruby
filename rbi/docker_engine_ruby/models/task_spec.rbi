# typed: strong

module DockerEngineRuby
  module Models
    class TaskSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::TaskSpec, DockerEngineRuby::Internal::AnyHash)
        end

      # Container spec for the service.
      #
      # <p><br /></p>
      #
      # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
      # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
      # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec)) }
      attr_reader :container_spec

      sig do
        params(
          container_spec: DockerEngineRuby::TaskSpec::ContainerSpec::OrHash
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
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::LogDriver)) }
      attr_reader :log_driver

      sig do
        params(log_driver: DockerEngineRuby::TaskSpec::LogDriver::OrHash).void
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
        returns(T.nilable(DockerEngineRuby::TaskSpec::NetworkAttachmentSpec))
      end
      attr_reader :network_attachment_spec

      sig do
        params(
          network_attachment_spec:
            DockerEngineRuby::TaskSpec::NetworkAttachmentSpec::OrHash
        ).void
      end
      attr_writer :network_attachment_spec

      # Specifies which networks the service should attach to.
      sig { returns(T.nilable(T::Array[DockerEngineRuby::TaskSpec::Network])) }
      attr_reader :networks

      sig do
        params(
          networks: T::Array[DockerEngineRuby::TaskSpec::Network::OrHash]
        ).void
      end
      attr_writer :networks

      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::Placement)) }
      attr_reader :placement

      sig do
        params(placement: DockerEngineRuby::TaskSpec::Placement::OrHash).void
      end
      attr_writer :placement

      # Plugin spec for the service. _(Experimental release only.)_
      #
      # <p><br /></p>
      #
      # > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
      # > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
      # > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::PluginSpec)) }
      attr_reader :plugin_spec

      sig do
        params(plugin_spec: DockerEngineRuby::TaskSpec::PluginSpec::OrHash).void
      end
      attr_writer :plugin_spec

      # Resource requirements which apply to each individual container created as part
      # of the service.
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::Resources)) }
      attr_reader :resources

      sig do
        params(resources: DockerEngineRuby::TaskSpec::Resources::OrHash).void
      end
      attr_writer :resources

      # Specification for the restart policy which applies to containers created as part
      # of this service.
      sig { returns(T.nilable(DockerEngineRuby::TaskSpec::RestartPolicy)) }
      attr_reader :restart_policy

      sig do
        params(
          restart_policy: DockerEngineRuby::TaskSpec::RestartPolicy::OrHash
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
          container_spec: DockerEngineRuby::TaskSpec::ContainerSpec::OrHash,
          force_update: Integer,
          log_driver: DockerEngineRuby::TaskSpec::LogDriver::OrHash,
          network_attachment_spec:
            DockerEngineRuby::TaskSpec::NetworkAttachmentSpec::OrHash,
          networks: T::Array[DockerEngineRuby::TaskSpec::Network::OrHash],
          placement: DockerEngineRuby::TaskSpec::Placement::OrHash,
          plugin_spec: DockerEngineRuby::TaskSpec::PluginSpec::OrHash,
          resources: DockerEngineRuby::TaskSpec::Resources::OrHash,
          restart_policy: DockerEngineRuby::TaskSpec::RestartPolicy::OrHash,
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
            container_spec: DockerEngineRuby::TaskSpec::ContainerSpec,
            force_update: Integer,
            log_driver: DockerEngineRuby::TaskSpec::LogDriver,
            network_attachment_spec:
              DockerEngineRuby::TaskSpec::NetworkAttachmentSpec,
            networks: T::Array[DockerEngineRuby::TaskSpec::Network],
            placement: DockerEngineRuby::TaskSpec::Placement,
            plugin_spec: DockerEngineRuby::TaskSpec::PluginSpec,
            resources: DockerEngineRuby::TaskSpec::Resources,
            restart_policy: DockerEngineRuby::TaskSpec::RestartPolicy,
            runtime: String
          }
        )
      end
      def to_hash
      end

      class ContainerSpec < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::ContainerSpec,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :args

        sig { params(args: T::Array[String]).void }
        attr_writer :args

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :capability_add

        sig { params(capability_add: T::Array[String]).void }
        attr_writer :capability_add

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :capability_drop

        sig { params(capability_drop: T::Array[String]).void }
        attr_writer :capability_drop

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :command

        sig { params(command: T::Array[String]).void }
        attr_writer :command

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Config]
            )
          )
        end
        attr_reader :configs

        sig do
          params(
            configs:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Config::OrHash
              ]
          ).void
        end
        attr_writer :configs

        sig { returns(T.nilable(String)) }
        attr_reader :dir

        sig { params(dir: String).void }
        attr_writer :dir

        sig do
          returns(
            T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig)
          )
        end
        attr_reader :dns_config

        sig do
          params(
            dns_config:
              DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig::OrHash
          ).void
        end
        attr_writer :dns_config

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :env

        sig { params(env: T::Array[String]).void }
        attr_writer :env

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :groups

        sig { params(groups: T::Array[String]).void }
        attr_writer :groups

        # A test to perform to check that the container is healthy. Healthcheck commands
        # should be side-effect free.
        sig do
          returns(
            T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck)
          )
        end
        attr_reader :health_check

        sig do
          params(
            health_check:
              DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck::OrHash
          ).void
        end
        attr_writer :health_check

        sig { returns(T.nilable(String)) }
        attr_reader :hostname

        sig { params(hostname: String).void }
        attr_writer :hostname

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :hosts

        sig { params(hosts: T::Array[String]).void }
        attr_writer :hosts

        sig { returns(T.nilable(String)) }
        attr_reader :image

        sig { params(image: String).void }
        attr_writer :image

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :init

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::OrSymbol
            )
          )
        end
        attr_reader :isolation

        sig do
          params(
            isolation:
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::OrSymbol
          ).void
        end
        attr_writer :isolation

        sig { returns(T.nilable(T.anything)) }
        attr_reader :labels

        sig { params(labels: T.anything).void }
        attr_writer :labels

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Mount]
            )
          )
        end
        attr_reader :mounts

        sig do
          params(
            mounts:
              T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Mount::OrHash]
          ).void
        end
        attr_writer :mounts

        sig { returns(T.nilable(Integer)) }
        attr_reader :oom_score_adj

        sig { params(oom_score_adj: Integer).void }
        attr_writer :oom_score_adj

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :open_stdin

        sig { params(open_stdin: T::Boolean).void }
        attr_writer :open_stdin

        sig do
          returns(
            T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec::Privileges)
          )
        end
        attr_reader :privileges

        sig do
          params(
            privileges:
              DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::OrHash
          ).void
        end
        attr_writer :privileges

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :read_only

        sig { params(read_only: T::Boolean).void }
        attr_writer :read_only

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Secret]
            )
          )
        end
        attr_reader :secrets

        sig do
          params(
            secrets:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Secret::OrHash
              ]
          ).void
        end
        attr_writer :secrets

        sig { returns(T.nilable(Integer)) }
        attr_reader :stop_grace_period

        sig { params(stop_grace_period: Integer).void }
        attr_writer :stop_grace_period

        sig { returns(T.nilable(String)) }
        attr_reader :stop_signal

        sig { params(stop_signal: String).void }
        attr_writer :stop_signal

        sig { returns(T.nilable(T.anything)) }
        attr_reader :sysctls

        sig { params(sysctls: T.anything).void }
        attr_writer :sysctls

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :tty

        sig { params(tty: T::Boolean).void }
        attr_writer :tty

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit]
            )
          )
        end
        attr_reader :ulimits

        sig do
          params(
            ulimits:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit::OrHash
              ]
          ).void
        end
        attr_writer :ulimits

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
                DockerEngineRuby::TaskSpec::ContainerSpec::Config::OrHash
              ],
            dir: String,
            dns_config:
              DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig::OrHash,
            env: T::Array[String],
            groups: T::Array[String],
            health_check:
              DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck::OrHash,
            hostname: String,
            hosts: T::Array[String],
            image: String,
            init: T.nilable(T::Boolean),
            isolation:
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::OrSymbol,
            labels: T.anything,
            mounts:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::OrHash
              ],
            oom_score_adj: Integer,
            open_stdin: T::Boolean,
            privileges:
              DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::OrHash,
            read_only: T::Boolean,
            secrets:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Secret::OrHash
              ],
            stop_grace_period: Integer,
            stop_signal: String,
            sysctls: T.anything,
            tty: T::Boolean,
            ulimits:
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit::OrHash
              ],
            user: String
          ).returns(T.attached_class)
        end
        def self.new(
          args: nil,
          capability_add: nil,
          capability_drop: nil,
          command: nil,
          configs: nil,
          dir: nil,
          dns_config: nil,
          env: nil,
          groups: nil,
          # A test to perform to check that the container is healthy. Healthcheck commands
          # should be side-effect free.
          health_check: nil,
          hostname: nil,
          hosts: nil,
          image: nil,
          init: nil,
          isolation: nil,
          labels: nil,
          mounts: nil,
          oom_score_adj: nil,
          open_stdin: nil,
          privileges: nil,
          read_only: nil,
          secrets: nil,
          stop_grace_period: nil,
          stop_signal: nil,
          sysctls: nil,
          tty: nil,
          ulimits: nil,
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
                T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Config],
              dir: String,
              dns_config: DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig,
              env: T::Array[String],
              groups: T::Array[String],
              health_check:
                DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck,
              hostname: String,
              hosts: T::Array[String],
              image: String,
              init: T.nilable(T::Boolean),
              isolation:
                DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::OrSymbol,
              labels: T.anything,
              mounts:
                T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Mount],
              oom_score_adj: Integer,
              open_stdin: T::Boolean,
              privileges: DockerEngineRuby::TaskSpec::ContainerSpec::Privileges,
              read_only: T::Boolean,
              secrets:
                T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Secret],
              stop_grace_period: Integer,
              stop_signal: String,
              sysctls: T.anything,
              tty: T::Boolean,
              ulimits:
                T::Array[DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit],
              user: String
            }
          )
        end
        def to_hash
        end

        class Config < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::Config,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :config_id

          sig { params(config_id: String).void }
          attr_writer :config_id

          sig { returns(T.nilable(String)) }
          attr_reader :config_name

          sig { params(config_name: String).void }
          attr_writer :config_name

          sig do
            returns(
              T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec::Config::File)
            )
          end
          attr_reader :file

          sig do
            params(
              file:
                DockerEngineRuby::TaskSpec::ContainerSpec::Config::File::OrHash
            ).void
          end
          attr_writer :file

          sig { returns(T.nilable(T.anything)) }
          attr_reader :runtime

          sig { params(runtime: T.anything).void }
          attr_writer :runtime

          sig do
            params(
              config_id: String,
              config_name: String,
              file:
                DockerEngineRuby::TaskSpec::ContainerSpec::Config::File::OrHash,
              runtime: T.anything
            ).returns(T.attached_class)
          end
          def self.new(
            config_id: nil,
            config_name: nil,
            file: nil,
            runtime: nil
          )
          end

          sig do
            override.returns(
              {
                config_id: String,
                config_name: String,
                file: DockerEngineRuby::TaskSpec::ContainerSpec::Config::File,
                runtime: T.anything
              }
            )
          end
          def to_hash
          end

          class File < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Config::File,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :gid

            sig { params(gid: String).void }
            attr_writer :gid

            sig { returns(T.nilable(Integer)) }
            attr_reader :mode

            sig { params(mode: Integer).void }
            attr_writer :mode

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { returns(T.nilable(String)) }
            attr_reader :uid

            sig { params(uid: String).void }
            attr_writer :uid

            sig do
              params(
                gid: String,
                mode: Integer,
                name: String,
                uid: String
              ).returns(T.attached_class)
            end
            def self.new(gid: nil, mode: nil, name: nil, uid: nil)
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

        class DNSConfig < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :nameservers

          sig { params(nameservers: T::Array[String]).void }
          attr_writer :nameservers

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :options

          sig { params(options: T::Array[String]).void }
          attr_writer :options

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :search

          sig { params(search: T::Array[String]).void }
          attr_writer :search

          sig do
            params(
              nameservers: T::Array[String],
              options: T::Array[String],
              search: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(nameservers: nil, options: nil, search: nil)
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

        class HealthCheck < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck,
                DockerEngineRuby::Internal::AnyHash
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

        module Isolation
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::TaskSpec::ContainerSpec::Isolation
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEFAULT =
            T.let(
              :default,
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::TaggedSymbol
            )
          PROCESS =
            T.let(
              :process,
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::TaggedSymbol
            )
          HYPERV =
            T.let(
              :hyperv,
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::TaggedSymbol
            )
          EMPTY =
            T.let(
              :"",
              DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::TaskSpec::ContainerSpec::Isolation::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          # Optional configuration for the `bind` type.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions
              )
            )
          end
          attr_reader :bind_options

          sig do
            params(
              bind_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::OrHash
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
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions
              )
            )
          end
          attr_reader :image_options

          sig do
            params(
              image_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions::OrHash
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
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions
              )
            )
          end
          attr_reader :tmpfs_options

          sig do
            params(
              tmpfs_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions::OrHash
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
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::OrSymbol
            ).void
          end
          attr_writer :type

          # Optional configuration for the `volume` type.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions
              )
            )
          end
          attr_reader :volume_options

          sig do
            params(
              volume_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::OrHash
            ).void
          end
          attr_writer :volume_options

          sig do
            params(
              bind_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::OrHash,
              consistency: String,
              image_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions::OrHash,
              read_only: T::Boolean,
              source: String,
              target: String,
              tmpfs_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions::OrHash,
              type:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::OrSymbol,
              volume_options:
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::OrHash
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
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions,
                consistency: String,
                image_options:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions,
                read_only: T::Boolean,
                source: String,
                target: String,
                tmpfs_options:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions,
                type:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::OrSymbol,
                volume_options:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions
              }
            )
          end
          def to_hash
          end

          class BindOptions < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :create_mountpoint

            sig { params(create_mountpoint: T::Boolean).void }
            attr_writer :create_mountpoint

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :non_recursive

            sig { params(non_recursive: T::Boolean).void }
            attr_writer :non_recursive

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol
                )
              )
            end
            attr_reader :propagation

            sig do
              params(
                propagation:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol
              ).void
            end
            attr_writer :propagation

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :read_only_force_recursive

            sig { params(read_only_force_recursive: T::Boolean).void }
            attr_writer :read_only_force_recursive

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
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol,
                read_only_force_recursive: T::Boolean,
                read_only_non_recursive: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              create_mountpoint: nil,
              non_recursive: nil,
              propagation: nil,
              read_only_force_recursive: nil,
              read_only_non_recursive: nil
            )
            end

            sig do
              override.returns(
                {
                  create_mountpoint: T::Boolean,
                  non_recursive: T::Boolean,
                  propagation:
                    DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::OrSymbol,
                  read_only_force_recursive: T::Boolean,
                  read_only_non_recursive: T::Boolean
                }
              )
            end
            def to_hash
            end

            module Propagation
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PRIVATE =
                T.let(
                  :private,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )
              RPRIVATE =
                T.let(
                  :rprivate,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )
              SHARED =
                T.let(
                  :shared,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )
              RSHARED =
                T.let(
                  :rshared,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )
              SLAVE =
                T.let(
                  :slave,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )
              RSLAVE =
                T.let(
                  :rslave,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class ImageOptions < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :subpath

            sig { params(subpath: String).void }
            attr_writer :subpath

            # Optional configuration for the `image` type.
            sig { params(subpath: String).returns(T.attached_class) }
            def self.new(subpath: nil)
            end

            sig { override.returns({ subpath: String }) }
            def to_hash
            end
          end

          class TmpfsOptions < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :mode

            sig { params(mode: Integer).void }
            attr_writer :mode

            sig { returns(T.nilable(T::Array[T::Array[String]])) }
            attr_reader :options

            sig { params(options: T::Array[T::Array[String]]).void }
            attr_writer :options

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
            def self.new(mode: nil, options: nil, size_bytes: nil)
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
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BIND =
              T.let(
                :bind,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )
            CLUSTER =
              T.let(
                :cluster,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )
            NPIPE =
              T.let(
                :npipe,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )
            TMPFS =
              T.let(
                :tmpfs,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )
            VOLUME =
              T.let(
                :volume,
                DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class VolumeOptions < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig
                )
              )
            end
            attr_reader :driver_config

            sig do
              params(
                driver_config:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig::OrHash
              ).void
            end
            attr_writer :driver_config

            sig { returns(T.nilable(T.anything)) }
            attr_reader :labels

            sig { params(labels: T.anything).void }
            attr_writer :labels

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :no_copy

            sig { params(no_copy: T::Boolean).void }
            attr_writer :no_copy

            sig { returns(T.nilable(String)) }
            attr_reader :subpath

            sig { params(subpath: String).void }
            attr_writer :subpath

            # Optional configuration for the `volume` type.
            sig do
              params(
                driver_config:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig::OrHash,
                labels: T.anything,
                no_copy: T::Boolean,
                subpath: String
              ).returns(T.attached_class)
            end
            def self.new(
              driver_config: nil,
              labels: nil,
              no_copy: nil,
              subpath: nil
            )
            end

            sig do
              override.returns(
                {
                  driver_config:
                    DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig,
                  labels: T.anything,
                  no_copy: T::Boolean,
                  subpath: String
                }
              )
            end
            def to_hash
            end

            class DriverConfig < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig,
                    DockerEngineRuby::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              sig { returns(T.nilable(T.anything)) }
              attr_reader :options

              sig { params(options: T.anything).void }
              attr_writer :options

              sig do
                params(name: String, options: T.anything).returns(
                  T.attached_class
                )
              end
              def self.new(name: nil, options: nil)
              end

              sig { override.returns({ name: String, options: T.anything }) }
              def to_hash
              end
            end
          end
        end

        class Privileges < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor
              )
            )
          end
          attr_reader :app_armor

          sig do
            params(
              app_armor:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::OrHash
            ).void
          end
          attr_writer :app_armor

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec
              )
            )
          end
          attr_reader :credential_spec

          sig do
            params(
              credential_spec:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec::OrHash
            ).void
          end
          attr_writer :credential_spec

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :no_new_privileges

          sig { params(no_new_privileges: T::Boolean).void }
          attr_writer :no_new_privileges

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp
              )
            )
          end
          attr_reader :seccomp

          sig do
            params(
              seccomp:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::OrHash
            ).void
          end
          attr_writer :seccomp

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext
              )
            )
          end
          attr_reader :se_linux_context

          sig do
            params(
              se_linux_context:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext::OrHash
            ).void
          end
          attr_writer :se_linux_context

          sig do
            params(
              app_armor:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::OrHash,
              credential_spec:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec::OrHash,
              no_new_privileges: T::Boolean,
              seccomp:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::OrHash,
              se_linux_context:
                DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            app_armor: nil,
            credential_spec: nil,
            no_new_privileges: nil,
            seccomp: nil,
            se_linux_context: nil
          )
          end

          sig do
            override.returns(
              {
                app_armor:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor,
                credential_spec:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec,
                no_new_privileges: T::Boolean,
                seccomp:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp,
                se_linux_context:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext
              }
            )
          end
          def to_hash
          end

          class AppArmor < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                )
              )
            end
            attr_reader :mode

            sig do
              params(
                mode:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
              ).void
            end
            attr_writer :mode

            sig do
              params(
                mode:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(mode: nil)
            end

            sig do
              override.returns(
                {
                  mode:
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Mode
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DEFAULT =
                T.let(
                  :default,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                )
              DISABLED =
                T.let(
                  :disabled,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CredentialSpec < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :config

            sig { params(config: String).void }
            attr_writer :config

            sig { returns(T.nilable(String)) }
            attr_reader :file

            sig { params(file: String).void }
            attr_writer :file

            sig { returns(T.nilable(String)) }
            attr_reader :registry

            sig { params(registry: String).void }
            attr_writer :registry

            sig do
              params(config: String, file: String, registry: String).returns(
                T.attached_class
              )
            end
            def self.new(config: nil, file: nil, registry: nil)
            end

            sig do
              override.returns(
                { config: String, file: String, registry: String }
              )
            end
            def to_hash
            end
          end

          class Seccomp < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol
                )
              )
            end
            attr_reader :mode

            sig do
              params(
                mode:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol
              ).void
            end
            attr_writer :mode

            sig { returns(T.nilable(String)) }
            attr_reader :profile

            sig { params(profile: String).void }
            attr_writer :profile

            sig do
              params(
                mode:
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol,
                profile: String
              ).returns(T.attached_class)
            end
            def self.new(mode: nil, profile: nil)
            end

            sig do
              override.returns(
                {
                  mode:
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::OrSymbol,
                  profile: String
                }
              )
            end
            def to_hash
            end

            module Mode
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DEFAULT =
                T.let(
                  :default,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                )
              UNCONFINED =
                T.let(
                  :unconfined,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                )
              CUSTOM =
                T.let(
                  :custom,
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class SeLinuxContext < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :disable

            sig { params(disable: T::Boolean).void }
            attr_writer :disable

            sig { returns(T.nilable(String)) }
            attr_reader :level

            sig { params(level: String).void }
            attr_writer :level

            sig { returns(T.nilable(String)) }
            attr_reader :role

            sig { params(role: String).void }
            attr_writer :role

            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            sig { returns(T.nilable(String)) }
            attr_reader :user

            sig { params(user: String).void }
            attr_writer :user

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
              disable: nil,
              level: nil,
              role: nil,
              type: nil,
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

        class Secret < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::Secret,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File)
            )
          end
          attr_reader :file

          sig do
            params(
              file:
                DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File::OrHash
            ).void
          end
          attr_writer :file

          sig { returns(T.nilable(String)) }
          attr_reader :secret_id

          sig { params(secret_id: String).void }
          attr_writer :secret_id

          sig { returns(T.nilable(String)) }
          attr_reader :secret_name

          sig { params(secret_name: String).void }
          attr_writer :secret_name

          sig do
            params(
              file:
                DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File::OrHash,
              secret_id: String,
              secret_name: String
            ).returns(T.attached_class)
          end
          def self.new(file: nil, secret_id: nil, secret_name: nil)
          end

          sig do
            override.returns(
              {
                file: DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File,
                secret_id: String,
                secret_name: String
              }
            )
          end
          def to_hash
          end

          class File < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :gid

            sig { params(gid: String).void }
            attr_writer :gid

            sig { returns(T.nilable(Integer)) }
            attr_reader :mode

            sig { params(mode: Integer).void }
            attr_writer :mode

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { returns(T.nilable(String)) }
            attr_reader :uid

            sig { params(uid: String).void }
            attr_writer :uid

            sig do
              params(
                gid: String,
                mode: Integer,
                name: String,
                uid: String
              ).returns(T.attached_class)
            end
            def self.new(gid: nil, mode: nil, name: nil, uid: nil)
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

        class Ulimit < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :hard

          sig { params(hard: Integer).void }
          attr_writer :hard

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(Integer)) }
          attr_reader :soft

          sig { params(soft: Integer).void }
          attr_writer :soft

          sig do
            params(hard: Integer, name: String, soft: Integer).returns(
              T.attached_class
            )
          end
          def self.new(hard: nil, name: nil, soft: nil)
          end

          sig do
            override.returns({ hard: Integer, name: String, soft: Integer })
          end
          def to_hash
          end
        end
      end

      class LogDriver < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::LogDriver,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(T.anything)) }
        attr_reader :options

        sig { params(options: T.anything).void }
        attr_writer :options

        # Specifies the log driver to use for tasks created from this spec. If not
        # present, the default one for the swarm will be used, finally falling back to the
        # engine default if not specified.
        sig do
          params(name: String, options: T.anything).returns(T.attached_class)
        end
        def self.new(name: nil, options: nil)
        end

        sig { override.returns({ name: String, options: T.anything }) }
        def to_hash
        end
      end

      class NetworkAttachmentSpec < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::NetworkAttachmentSpec,
              DockerEngineRuby::Internal::AnyHash
            )
          end

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
        def self.new(container_id: nil)
        end

        sig { override.returns({ container_id: String }) }
        def to_hash
        end
      end

      class Network < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::Network,
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

      class Placement < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::Placement,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :constraints

        sig { params(constraints: T::Array[String]).void }
        attr_writer :constraints

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_replicas

        sig { params(max_replicas: Integer).void }
        attr_writer :max_replicas

        sig do
          returns(
            T.nilable(T::Array[DockerEngineRuby::TaskSpec::Placement::Platform])
          )
        end
        attr_reader :platforms

        sig do
          params(
            platforms:
              T::Array[DockerEngineRuby::TaskSpec::Placement::Platform::OrHash]
          ).void
        end
        attr_writer :platforms

        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::TaskSpec::Placement::Preference]
            )
          )
        end
        attr_reader :preferences

        sig do
          params(
            preferences:
              T::Array[
                DockerEngineRuby::TaskSpec::Placement::Preference::OrHash
              ]
          ).void
        end
        attr_writer :preferences

        sig do
          params(
            constraints: T::Array[String],
            max_replicas: Integer,
            platforms:
              T::Array[DockerEngineRuby::TaskSpec::Placement::Platform::OrHash],
            preferences:
              T::Array[
                DockerEngineRuby::TaskSpec::Placement::Preference::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          constraints: nil,
          max_replicas: nil,
          platforms: nil,
          preferences: nil
        )
        end

        sig do
          override.returns(
            {
              constraints: T::Array[String],
              max_replicas: Integer,
              platforms:
                T::Array[DockerEngineRuby::TaskSpec::Placement::Platform],
              preferences:
                T::Array[DockerEngineRuby::TaskSpec::Placement::Preference]
            }
          )
        end
        def to_hash
        end

        class Platform < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::Placement::Platform,
                DockerEngineRuby::Internal::AnyHash
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

        class Preference < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::Placement::Preference,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::TaskSpec::Placement::Preference::Spread
              )
            )
          end
          attr_reader :spread

          sig do
            params(
              spread:
                DockerEngineRuby::TaskSpec::Placement::Preference::Spread::OrHash
            ).void
          end
          attr_writer :spread

          sig do
            params(
              spread:
                DockerEngineRuby::TaskSpec::Placement::Preference::Spread::OrHash
            ).returns(T.attached_class)
          end
          def self.new(spread: nil)
          end

          sig do
            override.returns(
              {
                spread:
                  DockerEngineRuby::TaskSpec::Placement::Preference::Spread
              }
            )
          end
          def to_hash
          end

          class Spread < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::Placement::Preference::Spread,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :spread_descriptor

            sig { params(spread_descriptor: String).void }
            attr_writer :spread_descriptor

            sig { params(spread_descriptor: String).returns(T.attached_class) }
            def self.new(spread_descriptor: nil)
            end

            sig { override.returns({ spread_descriptor: String }) }
            def to_hash
            end
          end
        end
      end

      class PluginSpec < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::PluginSpec,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disabled

        sig { params(disabled: T::Boolean).void }
        attr_writer :disabled

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(T::Array[DockerEngineRuby::Privilege])) }
        attr_reader :plugin_privilege

        sig do
          params(
            plugin_privilege: T::Array[DockerEngineRuby::Privilege::OrHash]
          ).void
        end
        attr_writer :plugin_privilege

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
            plugin_privilege: T::Array[DockerEngineRuby::Privilege::OrHash],
            remote: String
          ).returns(T.attached_class)
        end
        def self.new(
          disabled: nil,
          name: nil,
          plugin_privilege: nil,
          remote: nil
        )
        end

        sig do
          override.returns(
            {
              disabled: T::Boolean,
              name: String,
              plugin_privilege: T::Array[DockerEngineRuby::Privilege],
              remote: String
            }
          )
        end
        def to_hash
        end
      end

      class Resources < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::Resources,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # An object describing a limit on resources which can be requested by a task.
        sig do
          returns(T.nilable(DockerEngineRuby::TaskSpec::Resources::Limits))
        end
        attr_reader :limits

        sig do
          params(
            limits: DockerEngineRuby::TaskSpec::Resources::Limits::OrHash
          ).void
        end
        attr_writer :limits

        sig { returns(T.nilable(Integer)) }
        attr_accessor :memory_swappiness

        # An object describing the resources which can be advertised by a node and
        # requested by a task.
        sig do
          returns(
            T.nilable(DockerEngineRuby::TaskSpec::Resources::Reservations)
          )
        end
        attr_reader :reservations

        sig do
          params(
            reservations:
              DockerEngineRuby::TaskSpec::Resources::Reservations::OrHash
          ).void
        end
        attr_writer :reservations

        sig { returns(T.nilable(Integer)) }
        attr_accessor :swap_bytes

        # Resource requirements which apply to each individual container created as part
        # of the service.
        sig do
          params(
            limits: DockerEngineRuby::TaskSpec::Resources::Limits::OrHash,
            memory_swappiness: T.nilable(Integer),
            reservations:
              DockerEngineRuby::TaskSpec::Resources::Reservations::OrHash,
            swap_bytes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # An object describing a limit on resources which can be requested by a task.
          limits: nil,
          memory_swappiness: nil,
          # An object describing the resources which can be advertised by a node and
          # requested by a task.
          reservations: nil,
          swap_bytes: nil
        )
        end

        sig do
          override.returns(
            {
              limits: DockerEngineRuby::TaskSpec::Resources::Limits,
              memory_swappiness: T.nilable(Integer),
              reservations: DockerEngineRuby::TaskSpec::Resources::Reservations,
              swap_bytes: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end

        class Limits < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::Resources::Limits,
                DockerEngineRuby::Internal::AnyHash
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

        class Reservations < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::TaskSpec::Resources::Reservations,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource
                ]
              )
            )
          end
          attr_reader :generic_resources

          sig do
            params(
              generic_resources:
                T::Array[
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::OrHash
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
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::OrHash
                ],
              memory_bytes: Integer,
              nano_cpus: Integer
            ).returns(T.attached_class)
          end
          def self.new(
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
                    DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource
                  ],
                memory_bytes: Integer,
                nano_cpus: Integer
              }
            )
          end
          def to_hash
          end

          class GenericResource < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec
                )
              )
            end
            attr_reader :discrete_resource_spec

            sig do
              params(
                discrete_resource_spec:
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec::OrHash
              ).void
            end
            attr_writer :discrete_resource_spec

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec
                )
              )
            end
            attr_reader :named_resource_spec

            sig do
              params(
                named_resource_spec:
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec::OrHash
              ).void
            end
            attr_writer :named_resource_spec

            sig do
              params(
                discrete_resource_spec:
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec::OrHash,
                named_resource_spec:
                  DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec::OrHash
              ).returns(T.attached_class)
            end
            def self.new(discrete_resource_spec: nil, named_resource_spec: nil)
            end

            sig do
              override.returns(
                {
                  discrete_resource_spec:
                    DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec,
                  named_resource_spec:
                    DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec
                }
              )
            end
            def to_hash
            end

            class DiscreteResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec,
                    DockerEngineRuby::Internal::AnyHash
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

            class NamedResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec,
                    DockerEngineRuby::Internal::AnyHash
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

      class RestartPolicy < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::TaskSpec::RestartPolicy,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::OrSymbol
            )
          )
        end
        attr_reader :condition

        sig do
          params(
            condition:
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::OrSymbol
          ).void
        end
        attr_writer :condition

        sig { returns(T.nilable(Integer)) }
        attr_reader :delay

        sig { params(delay: Integer).void }
        attr_writer :delay

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_attempts

        sig { params(max_attempts: Integer).void }
        attr_writer :max_attempts

        sig { returns(T.nilable(Integer)) }
        attr_reader :window

        sig { params(window: Integer).void }
        attr_writer :window

        # Specification for the restart policy which applies to containers created as part
        # of this service.
        sig do
          params(
            condition:
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::OrSymbol,
            delay: Integer,
            max_attempts: Integer,
            window: Integer
          ).returns(T.attached_class)
        end
        def self.new(condition: nil, delay: nil, max_attempts: nil, window: nil)
        end

        sig do
          override.returns(
            {
              condition:
                DockerEngineRuby::TaskSpec::RestartPolicy::Condition::OrSymbol,
              delay: Integer,
              max_attempts: Integer,
              window: Integer
            }
          )
        end
        def to_hash
        end

        module Condition
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::TaskSpec::RestartPolicy::Condition
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NONE =
            T.let(
              :none,
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::TaggedSymbol
            )
          ON_FAILURE =
            T.let(
              :"on-failure",
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::TaggedSymbol
            )
          ANY =
            T.let(
              :any,
              DockerEngineRuby::TaskSpec::RestartPolicy::Condition::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::TaskSpec::RestartPolicy::Condition::TaggedSymbol
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
