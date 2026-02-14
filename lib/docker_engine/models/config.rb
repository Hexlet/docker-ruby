# frozen_string_literal: true

module DockerEngine
  module Models
    class Config < DockerEngine::Internal::Type::BaseModel
      # @!attribute args_escaped
      #   Command is already escaped (Windows only)
      #
      #   @return [Boolean, nil]
      optional :args_escaped, DockerEngine::Internal::Type::Boolean, api_name: :ArgsEscaped, nil?: true

      # @!attribute attach_stderr
      #   Whether to attach to `stderr`.
      #
      #   @return [Boolean, nil]
      optional :attach_stderr, DockerEngine::Internal::Type::Boolean, api_name: :AttachStderr

      # @!attribute attach_stdin
      #   Whether to attach to `stdin`.
      #
      #   @return [Boolean, nil]
      optional :attach_stdin, DockerEngine::Internal::Type::Boolean, api_name: :AttachStdin

      # @!attribute attach_stdout
      #   Whether to attach to `stdout`.
      #
      #   @return [Boolean, nil]
      optional :attach_stdout, DockerEngine::Internal::Type::Boolean, api_name: :AttachStdout

      # @!attribute cmd
      #   Command to run specified as a string or an array of strings.
      #
      #   @return [Array<String>, nil]
      optional :cmd, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Cmd

      # @!attribute domainname
      #   The domain name to use for the container.
      #
      #   @return [String, nil]
      optional :domainname, String, api_name: :Domainname

      # @!attribute entrypoint
      #   The entry point for the container as a string or an array of strings.
      #
      #   If the array consists of exactly one empty string (`[""]`) then the entry point
      #   is reset to system default (i.e., the entry point used by docker when there is
      #   no `ENTRYPOINT` instruction in the `Dockerfile`).
      #
      #   @return [Array<String>, nil]
      optional :entrypoint, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Entrypoint

      # @!attribute env
      #   A list of environment variables to set inside the container in the form
      #   `["VAR=value", ...]`. A variable without `=` is removed from the environment,
      #   rather than to have an empty value.
      #
      #   @return [Array<String>, nil]
      optional :env, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Env

      # @!attribute exposed_ports
      #   An object mapping ports to an empty object in the form:
      #
      #   `{"<port>/<tcp|udp|sctp>": {}}`
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :exposed_ports,
               DockerEngine::Internal::Type::HashOf[DockerEngine::Internal::Type::Unknown],
               api_name: :ExposedPorts,
               nil?: true

      # @!attribute healthcheck
      #   A test to perform to check that the container is healthy. Healthcheck commands
      #   should be side-effect free.
      #
      #   @return [DockerEngine::Models::Config::Healthcheck, nil]
      optional :healthcheck, -> { DockerEngine::Config::Healthcheck }, api_name: :Healthcheck

      # @!attribute hostname
      #   The hostname to use for the container, as a valid RFC 1123 hostname.
      #
      #   @return [String, nil]
      optional :hostname, String, api_name: :Hostname

      # @!attribute image
      #   The name (or reference) of the image to use when creating the container, or
      #   which was used when the container was created.
      #
      #   @return [String, nil]
      optional :image, String, api_name: :Image

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngine::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute network_disabled
      #   Disable networking for the container.
      #
      #   @return [Boolean, nil]
      optional :network_disabled,
               DockerEngine::Internal::Type::Boolean,
               api_name: :NetworkDisabled,
               nil?: true

      # @!attribute on_build
      #   `ONBUILD` metadata that were defined in the image's `Dockerfile`.
      #
      #   @return [Array<String>, nil]
      optional :on_build, DockerEngine::Internal::Type::ArrayOf[String], api_name: :OnBuild, nil?: true

      # @!attribute open_stdin
      #   Open `stdin`
      #
      #   @return [Boolean, nil]
      optional :open_stdin, DockerEngine::Internal::Type::Boolean, api_name: :OpenStdin

      # @!attribute shell
      #   Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
      #
      #   @return [Array<String>, nil]
      optional :shell, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Shell, nil?: true

      # @!attribute stdin_once
      #   Close `stdin` after one attached client disconnects
      #
      #   @return [Boolean, nil]
      optional :stdin_once, DockerEngine::Internal::Type::Boolean, api_name: :StdinOnce

      # @!attribute stop_signal
      #   Signal to stop a container as a string or unsigned integer.
      #
      #   @return [String, nil]
      optional :stop_signal, String, api_name: :StopSignal, nil?: true

      # @!attribute stop_timeout
      #   Timeout to stop a container in seconds.
      #
      #   @return [Integer, nil]
      optional :stop_timeout, Integer, api_name: :StopTimeout, nil?: true

      # @!attribute tty
      #   Attach standard streams to a TTY, including `stdin` if it is not closed.
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngine::Internal::Type::Boolean, api_name: :Tty

      # @!attribute user
      #   Commands run as this user inside the container. If omitted, commands run as the
      #   user specified in the image the container was started from.
      #
      #   Can be either user-name or UID, and optional group-name or GID, separated by a
      #   colon (`<user-name|UID>[<:group-name|GID>]`).
      #
      #   @return [String, nil]
      optional :user, String, api_name: :User

      # @!attribute volumes
      #   An object mapping mount point paths inside the container to empty objects.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :volumes,
               DockerEngine::Internal::Type::HashOf[DockerEngine::Internal::Type::Unknown],
               api_name: :Volumes

      # @!attribute working_dir
      #   The working directory for commands to run in.
      #
      #   @return [String, nil]
      optional :working_dir, String, api_name: :WorkingDir

      # @!method initialize(args_escaped: nil, attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, domainname: nil, entrypoint: nil, env: nil, exposed_ports: nil, healthcheck: nil, hostname: nil, image: nil, labels: nil, network_disabled: nil, on_build: nil, open_stdin: nil, shell: nil, stdin_once: nil, stop_signal: nil, stop_timeout: nil, tty: nil, user: nil, volumes: nil, working_dir: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::Config} for more details.
      #
      #   Configuration for a container that is portable between hosts.
      #
      #   @param args_escaped [Boolean, nil] Command is already escaped (Windows only)
      #
      #   @param attach_stderr [Boolean] Whether to attach to `stderr`.
      #
      #   @param attach_stdin [Boolean] Whether to attach to `stdin`.
      #
      #   @param attach_stdout [Boolean] Whether to attach to `stdout`.
      #
      #   @param cmd [Array<String>] Command to run specified as a string or an array of strings.
      #
      #   @param domainname [String] The domain name to use for the container.
      #
      #   @param entrypoint [Array<String>] The entry point for the container as a string or an array of strings.
      #
      #   @param env [Array<String>] A list of environment variables to set inside the container in the
      #
      #   @param exposed_ports [Hash{Symbol=>Object}, nil] An object mapping ports to an empty object in the form:
      #
      #   @param healthcheck [DockerEngine::Models::Config::Healthcheck] A test to perform to check that the container is healthy.
      #
      #   @param hostname [String] The hostname to use for the container, as a valid RFC 1123 hostname.
      #
      #   @param image [String] The name (or reference) of the image to use when creating the container,
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param network_disabled [Boolean, nil] Disable networking for the container.
      #
      #   @param on_build [Array<String>, nil] `ONBUILD` metadata that were defined in the image's `Dockerfile`.
      #
      #   @param open_stdin [Boolean] Open `stdin`
      #
      #   @param shell [Array<String>, nil] Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
      #
      #   @param stdin_once [Boolean] Close `stdin` after one attached client disconnects
      #
      #   @param stop_signal [String, nil] Signal to stop a container as a string or unsigned integer.
      #
      #   @param stop_timeout [Integer, nil] Timeout to stop a container in seconds.
      #
      #   @param tty [Boolean] Attach standard streams to a TTY, including `stdin` if it is not closed.
      #
      #   @param user [String] Commands run as this user inside the container. If omitted, commands
      #
      #   @param volumes [Hash{Symbol=>Object}] An object mapping mount point paths inside the container to empty
      #
      #   @param working_dir [String] The working directory for commands to run in.

      # @see DockerEngine::Models::Config#healthcheck
      class Healthcheck < DockerEngine::Internal::Type::BaseModel
        # @!attribute interval
        #   The time to wait between checks in nanoseconds. It should be 0 or at least
        #   1000000 (1 ms). 0 means inherit.
        #
        #   @return [Integer, nil]
        optional :interval, Integer, api_name: :Interval

        # @!attribute retries
        #   The number of consecutive failures needed to consider a container as unhealthy.
        #   0 means inherit.
        #
        #   @return [Integer, nil]
        optional :retries, Integer, api_name: :Retries

        # @!attribute start_interval
        #   The time to wait between checks in nanoseconds during the start period. It
        #   should be 0 or at least 1000000 (1 ms). 0 means inherit.
        #
        #   @return [Integer, nil]
        optional :start_interval, Integer, api_name: :StartInterval

        # @!attribute start_period
        #   Start period for the container to initialize before starting health-retries
        #   countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
        #   inherit.
        #
        #   @return [Integer, nil]
        optional :start_period, Integer, api_name: :StartPeriod

        # @!attribute test_
        #   The test to perform. Possible values are:
        #
        #   - `[]` inherit healthcheck from image or parent image
        #   - `["NONE"]` disable healthcheck
        #   - `["CMD", args...]` exec arguments directly
        #   - `["CMD-SHELL", command]` run command with system's default shell
        #
        #   A non-zero exit code indicates a failed healthcheck:
        #
        #   - `0` healthy
        #   - `1` unhealthy
        #   - `2` reserved (treated as unhealthy)
        #   - other values: error running probe
        #
        #   @return [Array<String>, nil]
        optional :test_, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Test

        # @!attribute timeout
        #   The time to wait before considering the check to have hung. It should be 0 or at
        #   least 1000000 (1 ms). 0 means inherit.
        #
        #   If the health check command does not complete within this timeout, the check is
        #   considered failed and the health check process is forcibly terminated without a
        #   graceful shutdown.
        #
        #   @return [Integer, nil]
        optional :timeout, Integer, api_name: :Timeout

        # @!method initialize(interval: nil, retries: nil, start_interval: nil, start_period: nil, test_: nil, timeout: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Config::Healthcheck} for more details.
        #
        #   A test to perform to check that the container is healthy. Healthcheck commands
        #   should be side-effect free.
        #
        #   @param interval [Integer] The time to wait between checks in nanoseconds. It should be 0 or at
        #
        #   @param retries [Integer] The number of consecutive failures needed to consider a container as
        #
        #   @param start_interval [Integer] The time to wait between checks in nanoseconds during the start period.
        #
        #   @param start_period [Integer] Start period for the container to initialize before starting
        #
        #   @param test_ [Array<String>] The test to perform. Possible values are:
        #
        #   @param timeout [Integer] The time to wait before considering the check to have hung. It should
      end
    end
  end
end
