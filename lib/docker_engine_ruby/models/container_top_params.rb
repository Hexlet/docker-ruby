# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#top
    class ContainerTopParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute ps_args
      #   The arguments to pass to `ps`. For example, `aux`
      #
      #   @return [String, nil]
      optional :ps_args, String

      # @!method initialize(ps_args: nil, request_options: {})
      #   @param ps_args [String] The arguments to pass to `ps`. For example, `aux`
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
