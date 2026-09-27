# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # Прогресс шага: сколько сделано из скольки.
    class ProgressDetail < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute current
      #
      #   @return [Integer, nil]
      optional :current, Integer

      # @!attribute total
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!method initialize(current: nil, total: nil)
      #   @param current [Integer]
      #
      #   @param total [Integer]
    end
  end
end
