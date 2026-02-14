# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#inspect_
    class NetworkInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute scope
      #
      #   @return [String, nil]
      optional :scope, String

      # @!attribute verbose
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(scope: nil, verbose: nil, request_options: {})
      #   @param scope [String]
      #   @param verbose [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
