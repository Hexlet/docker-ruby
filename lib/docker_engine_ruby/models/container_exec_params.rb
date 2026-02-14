# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#exec_
    class ContainerExecParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute attach_stderr
      #   Attach to `stderr` of the exec command.
      #
      #   @return [Boolean, nil]
      optional :attach_stderr, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStderr

      # @!attribute attach_stdin
      #   Attach to `stdin` of the exec command.
      #
      #   @return [Boolean, nil]
      optional :attach_stdin, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStdin

      # @!attribute attach_stdout
      #   Attach to `stdout` of the exec command.
      #
      #   @return [Boolean, nil]
      optional :attach_stdout, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStdout

      # @!attribute cmd
      #   Command to run, as a string or array of strings.
      #
      #   @return [Array<String>, nil]
      optional :cmd, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Cmd

      # @!attribute console_size
      #   Initial console size, as an `[height, width]` array.
      #
      #   @return [Array<Integer>, nil]
      optional :console_size,
               DockerEngineRuby::Internal::Type::ArrayOf[Integer],
               api_name: :ConsoleSize,
               nil?: true

      # @!attribute detach_keys
      #   Override the key sequence for detaching a container. Format is a single
      #   character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      #   `[`, `,` or `_`.
      #
      #   @return [String, nil]
      optional :detach_keys, String, api_name: :DetachKeys

      # @!attribute env
      #   A list of environment variables in the form `["VAR=value", ...]`.
      #
      #   @return [Array<String>, nil]
      optional :env, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Env

      # @!attribute privileged
      #   Runs the exec process with extended privileges.
      #
      #   @return [Boolean, nil]
      optional :privileged, DockerEngineRuby::Internal::Type::Boolean, api_name: :Privileged

      # @!attribute tty
      #   Allocate a pseudo-TTY.
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngineRuby::Internal::Type::Boolean, api_name: :Tty

      # @!attribute user
      #   The user, and optionally, group to run the exec process inside the container.
      #   Format is one of: `user`, `user:group`, `uid`, or `uid:gid`.
      #
      #   @return [String, nil]
      optional :user, String, api_name: :User

      # @!attribute working_dir
      #   The working directory for the exec process inside the container.
      #
      #   @return [String, nil]
      optional :working_dir, String, api_name: :WorkingDir

      # @!method initialize(attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, console_size: nil, detach_keys: nil, env: nil, privileged: nil, tty: nil, user: nil, working_dir: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ContainerExecParams} for more details.
      #
      #   @param attach_stderr [Boolean] Attach to `stderr` of the exec command.
      #
      #   @param attach_stdin [Boolean] Attach to `stdin` of the exec command.
      #
      #   @param attach_stdout [Boolean] Attach to `stdout` of the exec command.
      #
      #   @param cmd [Array<String>] Command to run, as a string or array of strings.
      #
      #   @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
      #
      #   @param detach_keys [String] Override the key sequence for detaching a container. Format is
      #
      #   @param env [Array<String>] A list of environment variables in the form `["VAR=value", ...]`.
      #
      #   @param privileged [Boolean] Runs the exec process with extended privileges.
      #
      #   @param tty [Boolean] Allocate a pseudo-TTY.
      #
      #   @param user [String] The user, and optionally, group to run the exec process inside
      #
      #   @param working_dir [String] The working directory for the exec process inside the container.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
