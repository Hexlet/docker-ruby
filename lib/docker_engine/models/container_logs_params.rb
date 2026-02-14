# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#logs
    class ContainerLogsParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute follow
      #   Keep connection after returning logs.
      #
      #   @return [Boolean, nil]
      optional :follow, DockerEngine::Internal::Type::Boolean

      # @!attribute since
      #   Only return logs since this time, as a UNIX timestamp
      #
      #   @return [Integer, nil]
      optional :since, Integer

      # @!attribute stderr
      #   Return logs from `stderr`
      #
      #   @return [Boolean, nil]
      optional :stderr, DockerEngine::Internal::Type::Boolean

      # @!attribute stdout
      #   Return logs from `stdout`
      #
      #   @return [Boolean, nil]
      optional :stdout, DockerEngine::Internal::Type::Boolean

      # @!attribute tail
      #   Only return this number of log lines from the end of the logs. Specify as an
      #   integer or `all` to output all log lines.
      #
      #   @return [String, nil]
      optional :tail, String

      # @!attribute timestamps
      #   Add timestamps to every log line
      #
      #   @return [Boolean, nil]
      optional :timestamps, DockerEngine::Internal::Type::Boolean

      # @!attribute until_
      #   Only return logs before this time, as a UNIX timestamp
      #
      #   @return [Integer, nil]
      optional :until_, Integer

      # @!method initialize(follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, until_: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerLogsParams} for more details.
      #
      #   @param follow [Boolean] Keep connection after returning logs.
      #
      #   @param since [Integer] Only return logs since this time, as a UNIX timestamp
      #
      #   @param stderr [Boolean] Return logs from `stderr`
      #
      #   @param stdout [Boolean] Return logs from `stdout`
      #
      #   @param tail [String] Only return this number of log lines from the end of the logs.
      #
      #   @param timestamps [Boolean] Add timestamps to every log line
      #
      #   @param until_ [Integer] Only return logs before this time, as a UNIX timestamp
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
