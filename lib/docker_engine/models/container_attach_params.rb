# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#attach
    class ContainerAttachParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute detach_keys
      #   Override the key sequence for detaching a container.Format is a single character
      #   `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`
      #   or `_`.
      #
      #   @return [String, nil]
      optional :detach_keys, String

      # @!attribute logs
      #   Replay previous logs from the container.
      #
      #   This is useful for attaching to a container that has started and you want to
      #   output everything since the container started.
      #
      #   If `stream` is also enabled, once all the previous output has been returned, it
      #   will seamlessly transition into streaming current output.
      #
      #   @return [Boolean, nil]
      optional :logs, DockerEngine::Internal::Type::Boolean

      # @!attribute stderr
      #   Attach to `stderr`
      #
      #   @return [Boolean, nil]
      optional :stderr, DockerEngine::Internal::Type::Boolean

      # @!attribute stdin
      #   Attach to `stdin`
      #
      #   @return [Boolean, nil]
      optional :stdin, DockerEngine::Internal::Type::Boolean

      # @!attribute stdout
      #   Attach to `stdout`
      #
      #   @return [Boolean, nil]
      optional :stdout, DockerEngine::Internal::Type::Boolean

      # @!attribute stream
      #   Stream attached streams from the time the request was made onwards.
      #
      #   @return [Boolean, nil]
      optional :stream, DockerEngine::Internal::Type::Boolean

      # @!method initialize(detach_keys: nil, logs: nil, stderr: nil, stdin: nil, stdout: nil, stream: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerAttachParams} for more details.
      #
      #   @param detach_keys [String] Override the key sequence for detaching a container.Format is a single
      #
      #   @param logs [Boolean] Replay previous logs from the container.
      #
      #   @param stderr [Boolean] Attach to `stderr`
      #
      #   @param stdin [Boolean] Attach to `stdin`
      #
      #   @param stdout [Boolean] Attach to `stdout`
      #
      #   @param stream [Boolean] Stream attached streams from the time the request was made onwards.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
