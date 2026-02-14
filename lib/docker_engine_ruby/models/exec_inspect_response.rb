# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Exec#inspect_
    class ExecInspectResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute can_remove
      #
      #   @return [Boolean, nil]
      optional :can_remove, DockerEngineRuby::Internal::Type::Boolean, api_name: :CanRemove

      # @!attribute container_id
      #
      #   @return [String, nil]
      optional :container_id, String, api_name: :ContainerID

      # @!attribute detach_keys
      #
      #   @return [String, nil]
      optional :detach_keys, String, api_name: :DetachKeys

      # @!attribute exit_code
      #
      #   @return [Integer, nil]
      optional :exit_code, Integer, api_name: :ExitCode

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute open_stderr
      #
      #   @return [Boolean, nil]
      optional :open_stderr, DockerEngineRuby::Internal::Type::Boolean, api_name: :OpenStderr

      # @!attribute open_stdin
      #
      #   @return [Boolean, nil]
      optional :open_stdin, DockerEngineRuby::Internal::Type::Boolean, api_name: :OpenStdin

      # @!attribute open_stdout
      #
      #   @return [Boolean, nil]
      optional :open_stdout, DockerEngineRuby::Internal::Type::Boolean, api_name: :OpenStdout

      # @!attribute pid
      #   The system process ID for the exec process.
      #
      #   @return [Integer, nil]
      optional :pid, Integer, api_name: :Pid

      # @!attribute process_config
      #
      #   @return [DockerEngineRuby::Models::InspectResponse, nil]
      optional :process_config, -> { DockerEngineRuby::InspectResponse }, api_name: :ProcessConfig

      # @!attribute running
      #
      #   @return [Boolean, nil]
      optional :running, DockerEngineRuby::Internal::Type::Boolean, api_name: :Running

      # @!method initialize(can_remove: nil, container_id: nil, detach_keys: nil, exit_code: nil, id: nil, open_stderr: nil, open_stdin: nil, open_stdout: nil, pid: nil, process_config: nil, running: nil)
      #   @param can_remove [Boolean]
      #
      #   @param container_id [String]
      #
      #   @param detach_keys [String]
      #
      #   @param exit_code [Integer]
      #
      #   @param id [String]
      #
      #   @param open_stderr [Boolean]
      #
      #   @param open_stdin [Boolean]
      #
      #   @param open_stdout [Boolean]
      #
      #   @param pid [Integer] The system process ID for the exec process.
      #
      #   @param process_config [DockerEngineRuby::Models::InspectResponse]
      #
      #   @param running [Boolean]
    end
  end
end
