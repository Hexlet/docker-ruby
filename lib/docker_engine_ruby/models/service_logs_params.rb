# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#logs
    class ServiceLogsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute details
      #   Show service context and extra details provided to logs.
      #
      #   @return [Boolean, nil]
      optional :details, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute follow
      #   Keep connection after returning logs.
      #
      #   @return [Boolean, nil]
      optional :follow, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute since
      #   Only return logs since this time, as a UNIX timestamp
      #
      #   @return [Integer, nil]
      optional :since, Integer

      # @!attribute stderr
      #   Return logs from `stderr`
      #
      #   @return [Boolean, nil]
      optional :stderr, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stdout
      #   Return logs from `stdout`
      #
      #   @return [Boolean, nil]
      optional :stdout, DockerEngineRuby::Internal::Type::Boolean

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
      optional :timestamps, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ServiceLogsParams} for more details.
      #
      #   @param details [Boolean] Show service context and extra details provided to logs.
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
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
