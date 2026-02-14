# frozen_string_literal: true

module DockerEngineAPI
  module Models
    class Privilege < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, api_name: :Description

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute value
      #
      #   @return [Array<String>, nil]
      optional :value, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Value

      # @!method initialize(description: nil, name: nil, value: nil)
      #   Describes a permission the user has to accept upon installing the plugin.
      #
      #   @param description [String]
      #   @param name [String]
      #   @param value [Array<String>]
    end
  end
end
