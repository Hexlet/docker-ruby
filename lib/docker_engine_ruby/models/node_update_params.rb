# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Nodes#update
    class NodeUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the node object being updated. This is required to avoid
      #   conflicting writes.
      #
      #   @return [Integer]
      required :version, Integer

      # @!method initialize(version:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::NodeUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the node object being updated. This is required
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
