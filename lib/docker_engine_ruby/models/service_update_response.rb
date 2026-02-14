# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#update
    class ServiceUpdateResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute warnings
      #   Optional warning messages
      #
      #   @return [Array<String>, nil]
      optional :warnings, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(warnings: nil)
      #   @param warnings [Array<String>] Optional warning messages
    end
  end
end
