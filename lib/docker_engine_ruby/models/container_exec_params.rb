# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#exec_
    class ContainerExecParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute attach_stderr
      #
      #   @return [Boolean, nil]
      optional :attach_stderr, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStderr

      # @!attribute attach_stdin
      #
      #   @return [Boolean, nil]
      optional :attach_stdin, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStdin

      # @!attribute attach_stdout
      #
      #   @return [Boolean, nil]
      optional :attach_stdout, DockerEngineRuby::Internal::Type::Boolean, api_name: :AttachStdout

      # @!attribute cmd
      #
      #   @return [Array<String>, nil]
      optional :cmd, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Cmd

      # @!attribute console_size
      #
      #   @return [Array<Integer>, nil]
      optional :console_size,
               DockerEngineRuby::Internal::Type::ArrayOf[Integer],
               api_name: :ConsoleSize,
               nil?: true

      # @!attribute detach_keys
      #
      #   @return [String, nil]
      optional :detach_keys, String, api_name: :DetachKeys

      # @!attribute env
      #
      #   @return [Array<String>, nil]
      optional :env, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Env

      # @!attribute privileged
      #
      #   @return [Boolean, nil]
      optional :privileged, DockerEngineRuby::Internal::Type::Boolean, api_name: :Privileged

      # @!attribute tty
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngineRuby::Internal::Type::Boolean, api_name: :Tty

      # @!attribute user
      #
      #   @return [String, nil]
      optional :user, String, api_name: :User

      # @!attribute working_dir
      #
      #   @return [String, nil]
      optional :working_dir, String, api_name: :WorkingDir

      # @!method initialize(attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, console_size: nil, detach_keys: nil, env: nil, privileged: nil, tty: nil, user: nil, working_dir: nil, request_options: {})
      #   @param attach_stderr [Boolean]
      #   @param attach_stdin [Boolean]
      #   @param attach_stdout [Boolean]
      #   @param cmd [Array<String>]
      #   @param console_size [Array<Integer>, nil]
      #   @param detach_keys [String]
      #   @param env [Array<String>]
      #   @param privileged [Boolean]
      #   @param tty [Boolean]
      #   @param user [String]
      #   @param working_dir [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
