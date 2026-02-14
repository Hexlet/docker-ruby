# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#logs
    class ServiceLogsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute details
      #
      #   @return [Boolean, nil]
      optional :details, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute follow
      #
      #   @return [Boolean, nil]
      optional :follow, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute since
      #
      #   @return [Integer, nil]
      optional :since, Integer

      # @!attribute stderr
      #
      #   @return [Boolean, nil]
      optional :stderr, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stdout
      #
      #   @return [Boolean, nil]
      optional :stdout, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute tail
      #
      #   @return [String, nil]
      optional :tail, String

      # @!attribute timestamps
      #
      #   @return [Boolean, nil]
      optional :timestamps, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #   @param details [Boolean]
      #   @param follow [Boolean]
      #   @param since [Integer]
      #   @param stderr [Boolean]
      #   @param stdout [Boolean]
      #   @param tail [String]
      #   @param timestamps [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
