# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # Ошибка из потока прогресса Docker.
    class ErrorDetail < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute code
      #   Код ошибки.
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute message
      #   Сообщение об ошибке.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(code: nil, message: nil)
      #   @param code [Integer] Код ошибки.
      #
      #   @param message [String] Сообщение об ошибке.
    end
  end
end
