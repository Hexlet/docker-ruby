# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#top
    class ContainerTopParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute ps_args
      #   The arguments to pass to `ps`. For example, `aux`
      #
      #   @return [String, nil]
      optional :ps_args, String

      # @!method initialize(ps_args: nil, request_options: {})
      #   @param ps_args [String] The arguments to pass to `ps`. For example, `aux`
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
