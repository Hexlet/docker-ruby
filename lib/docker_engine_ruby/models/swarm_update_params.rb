# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#update
    class SwarmUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the swarm object being updated. This is required to avoid
      #   conflicting writes.
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute rotate_manager_token
      #   Rotate the manager join token.
      #
      #   @return [Boolean, nil]
      optional :rotate_manager_token, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute rotate_manager_unlock_key
      #   Rotate the manager unlock key.
      #
      #   @return [Boolean, nil]
      optional :rotate_manager_unlock_key, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute rotate_worker_token
      #   Rotate the worker join token.
      #
      #   @return [Boolean, nil]
      optional :rotate_worker_token, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(version:, rotate_manager_token: nil, rotate_manager_unlock_key: nil, rotate_worker_token: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SwarmUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the swarm object being updated. This is
      #
      #   @param rotate_manager_token [Boolean] Rotate the manager join token.
      #
      #   @param rotate_manager_unlock_key [Boolean] Rotate the manager unlock key.
      #
      #   @param rotate_worker_token [Boolean] Rotate the worker join token.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
