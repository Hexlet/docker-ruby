# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#top
    class ContainerTopParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute ps_args
      #   The arguments to pass to `ps`. For example, `aux`
      #
      #   @return [String, nil]
      optional :ps_args, String

      # @!method initialize(ps_args: nil, request_options: {})
      #   @param ps_args [String] The arguments to pass to `ps`. For example, `aux`
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
