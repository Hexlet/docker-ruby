# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#delete
    class VolumeDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute force
      #   Force the removal of the volume
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   @param force [Boolean] Force the removal of the volume
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
