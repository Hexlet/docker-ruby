# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#upgrade
    class PluginUpgradeParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute remote
      #   Remote reference to upgrade to.
      #
      #   The `:latest` tag is optional, and is used as the default if omitted.
      #
      #   @return [String]
      required :remote, String

      # @!attribute body
      #
      #   @return [Array<DockerEngineAPI::Models::Privilege>, nil]
      optional :body, -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Privilege] }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(remote:, body: nil, x_registry_auth: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::PluginUpgradeParams} for more details.
      #
      #   @param remote [String] Remote reference to upgrade to.
      #
      #   @param body [Array<DockerEngineAPI::Models::Privilege>]
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
