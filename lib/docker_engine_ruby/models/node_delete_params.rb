# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Nodes#delete
    class NodeDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute force
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(id:, force: nil, request_options: {})
      #   @param id [String]
      #   @param force [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
