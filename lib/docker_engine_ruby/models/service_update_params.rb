# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#update
    class ServiceUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute registry_auth_from
      #
      #   @return [Symbol, DockerEngineRuby::Models::ServiceUpdateParams::RegistryAuthFrom, nil]
      optional :registry_auth_from, enum: -> { DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom }

      # @!attribute rollback
      #
      #   @return [String, nil]
      optional :rollback, String

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(version:, registry_auth_from: nil, rollback: nil, x_registry_auth: nil, request_options: {})
      #   @param version [Integer]
      #   @param registry_auth_from [Symbol, DockerEngineRuby::Models::ServiceUpdateParams::RegistryAuthFrom]
      #   @param rollback [String]
      #   @param x_registry_auth [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      module RegistryAuthFrom
        extend DockerEngineRuby::Internal::Type::Enum

        SPEC = :spec
        PREVIOUS_SPEC = :"previous-spec"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
