# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#logs
    class ContainerLogsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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

      # @!attribute until_
      #
      #   @return [Integer, nil]
      optional :until_, Integer

      # @!method initialize(follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, until_: nil, request_options: {})
      #   @param follow [Boolean]
      #   @param since [Integer]
      #   @param stderr [Boolean]
      #   @param stdout [Boolean]
      #   @param tail [String]
      #   @param timestamps [Boolean]
      #   @param until_ [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
