# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # Сообщение из потока `/images/create` (pull).
    class CreateImageInfo < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute error
      #   Устаревшее поле: то же, что `error_detail.message`.
      #
      #   @return [String, nil]
      optional :error, String

      # @!attribute error_detail
      #
      #   @return [DockerEngineRuby::Models::ErrorDetail, nil]
      optional :error_detail, -> { DockerEngineRuby::ErrorDetail }, api_name: :errorDetail

      # @!attribute status
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute progress
      #   Устаревшее поле: прогресс строкой.
      #
      #   @return [String, nil]
      optional :progress, String

      # @!attribute progress_detail
      #
      #   @return [DockerEngineRuby::Models::ProgressDetail, nil]
      optional :progress_detail, -> { DockerEngineRuby::ProgressDetail }, api_name: :progressDetail

      # @!method initialize(id: nil, error: nil, error_detail: nil, status: nil, progress: nil, progress_detail: nil)
      #   @param id [String]
      #
      #   @param error [String] Устаревшее поле: то же, что `error_detail.message`.
      #
      #   @param error_detail [DockerEngineRuby::Models::ErrorDetail]
      #
      #   @param status [String]
      #
      #   @param progress [String] Устаревшее поле: прогресс строкой.
      #
      #   @param progress_detail [DockerEngineRuby::Models::ProgressDetail]
    end
  end
end
