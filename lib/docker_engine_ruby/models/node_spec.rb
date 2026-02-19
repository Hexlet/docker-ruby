# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class NodeSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute availability
      #   Availability of the node.
      #
      #   @return [Symbol, DockerEngineRuby::Models::NodeSpec::Availability, nil]
      optional :availability, enum: -> { DockerEngineRuby::NodeSpec::Availability }, api_name: :Availability

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Object, nil]
      optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

      # @!attribute name
      #   Name for the node.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute role
      #   Role of the node.
      #
      #   @return [Symbol, DockerEngineRuby::Models::NodeSpec::Role, nil]
      optional :role, enum: -> { DockerEngineRuby::NodeSpec::Role }, api_name: :Role

      # @!method initialize(availability: nil, labels: nil, name: nil, role: nil)
      #   @param availability [Symbol, DockerEngineRuby::Models::NodeSpec::Availability] Availability of the node.
      #
      #   @param labels [Object] User-defined key/value metadata.
      #
      #   @param name [String] Name for the node.
      #
      #   @param role [Symbol, DockerEngineRuby::Models::NodeSpec::Role] Role of the node.

      # Availability of the node.
      #
      # @see DockerEngineRuby::Models::NodeSpec#availability
      module Availability
        extend DockerEngineRuby::Internal::Type::Enum

        ACTIVE = :active
        PAUSE = :pause
        DRAIN = :drain

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Role of the node.
      #
      # @see DockerEngineRuby::Models::NodeSpec#role
      module Role
        extend DockerEngineRuby::Internal::Type::Enum

        WORKER = :worker
        MANAGER = :manager

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
