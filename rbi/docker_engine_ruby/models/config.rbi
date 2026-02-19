# typed: strong

module DockerEngineRuby
  module Models
    class Config < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Config, DockerEngineRuby::Internal::AnyHash)
        end

      # Command is already escaped (Windows only)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :args_escaped

      # Whether to attach to `stderr`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stderr

      sig { params(attach_stderr: T::Boolean).void }
      attr_writer :attach_stderr

      # Whether to attach to `stdin`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdin

      sig { params(attach_stdin: T::Boolean).void }
      attr_writer :attach_stdin

      # Whether to attach to `stdout`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdout

      sig { params(attach_stdout: T::Boolean).void }
      attr_writer :attach_stdout

      # Command to run specified as a string or an array of strings.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cmd

      sig { params(cmd: T::Array[String]).void }
      attr_writer :cmd

      # The domain name to use for the container.
      sig { returns(T.nilable(String)) }
      attr_reader :domainname

      sig { params(domainname: String).void }
      attr_writer :domainname

      # The entry point for the container as a string or an array of strings.
      #
      # If the array consists of exactly one empty string (`[""]`) then the entry point
      # is reset to system default (i.e., the entry point used by docker when there is
      # no `ENTRYPOINT` instruction in the `Dockerfile`).
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :entrypoint

      sig { params(entrypoint: T::Array[String]).void }
      attr_writer :entrypoint

      # A list of environment variables to set inside the container in the form
      # `["VAR=value", ...]`. A variable without `=` is removed from the environment,
      # rather than to have an empty value.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :env

      sig { params(env: T::Array[String]).void }
      attr_writer :env

      # An object mapping ports to an empty object in the form:
      #
      # `{"<port>/<tcp|udp|sctp>": {}}`
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :exposed_ports

      # A test to perform to check that the container is healthy. Healthcheck commands
      # should be side-effect free.
      sig { returns(T.nilable(DockerEngineRuby::Config::Healthcheck)) }
      attr_reader :healthcheck

      sig do
        params(healthcheck: DockerEngineRuby::Config::Healthcheck::OrHash).void
      end
      attr_writer :healthcheck

      # The hostname to use for the container, as a valid RFC 1123 hostname.
      sig { returns(T.nilable(String)) }
      attr_reader :hostname

      sig { params(hostname: String).void }
      attr_writer :hostname

      # The name (or reference) of the image to use when creating the container, or
      # which was used when the container was created.
      sig { returns(T.nilable(String)) }
      attr_reader :image

      sig { params(image: String).void }
      attr_writer :image

      # User-defined key/value metadata.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :labels

      sig { params(labels: T.anything).void }
      attr_writer :labels

      # Disable networking for the container.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :network_disabled

      # `ONBUILD` metadata that were defined in the image's `Dockerfile`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :on_build

      # Open `stdin`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :open_stdin

      sig { params(open_stdin: T::Boolean).void }
      attr_writer :open_stdin

      # Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :shell

      # Close `stdin` after one attached client disconnects
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdin_once

      sig { params(stdin_once: T::Boolean).void }
      attr_writer :stdin_once

      # Signal to stop a container as a string or unsigned integer.
      sig { returns(T.nilable(String)) }
      attr_accessor :stop_signal

      # Timeout to stop a container in seconds.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :stop_timeout

      # Attach standard streams to a TTY, including `stdin` if it is not closed.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      # Commands run as this user inside the container. If omitted, commands run as the
      # user specified in the image the container was started from.
      #
      # Can be either user-name or UID, and optional group-name or GID, separated by a
      # colon (`<user-name|UID>[<:group-name|GID>]`).
      sig { returns(T.nilable(String)) }
      attr_reader :user

      sig { params(user: String).void }
      attr_writer :user

      # An object mapping mount point paths inside the container to empty objects.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :volumes

      sig { params(volumes: T.anything).void }
      attr_writer :volumes

      # The working directory for commands to run in.
      sig { returns(T.nilable(String)) }
      attr_reader :working_dir

      sig { params(working_dir: String).void }
      attr_writer :working_dir

      # Configuration for a container that is portable between hosts.
      sig do
        params(
          args_escaped: T.nilable(T::Boolean),
          attach_stderr: T::Boolean,
          attach_stdin: T::Boolean,
          attach_stdout: T::Boolean,
          cmd: T::Array[String],
          domainname: String,
          entrypoint: T::Array[String],
          env: T::Array[String],
          exposed_ports: T.nilable(T.anything),
          healthcheck: DockerEngineRuby::Config::Healthcheck::OrHash,
          hostname: String,
          image: String,
          labels: T.anything,
          network_disabled: T.nilable(T::Boolean),
          on_build: T.nilable(T::Array[String]),
          open_stdin: T::Boolean,
          shell: T.nilable(T::Array[String]),
          stdin_once: T::Boolean,
          stop_signal: T.nilable(String),
          stop_timeout: T.nilable(Integer),
          tty: T::Boolean,
          user: String,
          volumes: T.anything,
          working_dir: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Command is already escaped (Windows only)
        args_escaped: nil,
        # Whether to attach to `stderr`.
        attach_stderr: nil,
        # Whether to attach to `stdin`.
        attach_stdin: nil,
        # Whether to attach to `stdout`.
        attach_stdout: nil,
        # Command to run specified as a string or an array of strings.
        cmd: nil,
        # The domain name to use for the container.
        domainname: nil,
        # The entry point for the container as a string or an array of strings.
        #
        # If the array consists of exactly one empty string (`[""]`) then the entry point
        # is reset to system default (i.e., the entry point used by docker when there is
        # no `ENTRYPOINT` instruction in the `Dockerfile`).
        entrypoint: nil,
        # A list of environment variables to set inside the container in the form
        # `["VAR=value", ...]`. A variable without `=` is removed from the environment,
        # rather than to have an empty value.
        env: nil,
        # An object mapping ports to an empty object in the form:
        #
        # `{"<port>/<tcp|udp|sctp>": {}}`
        exposed_ports: nil,
        # A test to perform to check that the container is healthy. Healthcheck commands
        # should be side-effect free.
        healthcheck: nil,
        # The hostname to use for the container, as a valid RFC 1123 hostname.
        hostname: nil,
        # The name (or reference) of the image to use when creating the container, or
        # which was used when the container was created.
        image: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Disable networking for the container.
        network_disabled: nil,
        # `ONBUILD` metadata that were defined in the image's `Dockerfile`.
        on_build: nil,
        # Open `stdin`
        open_stdin: nil,
        # Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
        shell: nil,
        # Close `stdin` after one attached client disconnects
        stdin_once: nil,
        # Signal to stop a container as a string or unsigned integer.
        stop_signal: nil,
        # Timeout to stop a container in seconds.
        stop_timeout: nil,
        # Attach standard streams to a TTY, including `stdin` if it is not closed.
        tty: nil,
        # Commands run as this user inside the container. If omitted, commands run as the
        # user specified in the image the container was started from.
        #
        # Can be either user-name or UID, and optional group-name or GID, separated by a
        # colon (`<user-name|UID>[<:group-name|GID>]`).
        user: nil,
        # An object mapping mount point paths inside the container to empty objects.
        volumes: nil,
        # The working directory for commands to run in.
        working_dir: nil
      )
      end

      sig do
        override.returns(
          {
            args_escaped: T.nilable(T::Boolean),
            attach_stderr: T::Boolean,
            attach_stdin: T::Boolean,
            attach_stdout: T::Boolean,
            cmd: T::Array[String],
            domainname: String,
            entrypoint: T::Array[String],
            env: T::Array[String],
            exposed_ports: T.nilable(T.anything),
            healthcheck: DockerEngineRuby::Config::Healthcheck,
            hostname: String,
            image: String,
            labels: T.anything,
            network_disabled: T.nilable(T::Boolean),
            on_build: T.nilable(T::Array[String]),
            open_stdin: T::Boolean,
            shell: T.nilable(T::Array[String]),
            stdin_once: T::Boolean,
            stop_signal: T.nilable(String),
            stop_timeout: T.nilable(Integer),
            tty: T::Boolean,
            user: String,
            volumes: T.anything,
            working_dir: String
          }
        )
      end
      def to_hash
      end

      class Healthcheck < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Config::Healthcheck,
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
    end
  end
end
