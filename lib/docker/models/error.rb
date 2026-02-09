# frozen_string_literal: true

module Docker
  module Models
    class Error < Docker::Internal::Type::BaseModel
      # @!attribute message
      #   The error message.
      #
      #   @return [String]
      required :message, String

      # @!method initialize(message:)
      #   Represents an error.
      #
      #   @param message [String] The error message.
    end
  end
end
