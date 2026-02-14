# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#update
    class SwarmUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute rotate_manager_token
      #
      #   @return [Boolean, nil]
      optional :rotate_manager_token, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute rotate_manager_unlock_key
      #
      #   @return [Boolean, nil]
      optional :rotate_manager_unlock_key, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute rotate_worker_token
      #
      #   @return [Boolean, nil]
      optional :rotate_worker_token, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(version:, rotate_manager_token: nil, rotate_manager_unlock_key: nil, rotate_worker_token: nil, request_options: {})
      #   @param version [Integer]
      #   @param rotate_manager_token [Boolean]
      #   @param rotate_manager_unlock_key [Boolean]
      #   @param rotate_worker_token [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
