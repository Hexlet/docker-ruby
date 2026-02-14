# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#update
    class UpdateResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute warnings
      #   Warnings encountered when updating the container.
      #
      #   @return [Array<String>, nil]
      optional :warnings, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(warnings: nil)
      #   Response for a successful container-update.
      #
      #   @param warnings [Array<String>] Warnings encountered when updating the container.
    end
  end
end
