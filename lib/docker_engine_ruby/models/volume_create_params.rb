# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#create
    class VolumeCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute create_request
      #
      #   @return [DockerEngineRuby::Models::CreateRequest]
      required :create_request, -> { DockerEngineRuby::CreateRequest }

      # @!method initialize(create_request:, request_options: {})
      #   @param create_request [DockerEngineRuby::Models::CreateRequest]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
