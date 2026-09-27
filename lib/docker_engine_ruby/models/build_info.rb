# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # Сообщение из потока `/build`.
    class BuildInfo < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute stream
      #   Строка вывода сборки.
      #
      #   @return [String, nil]
      optional :stream, String

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

      # @!attribute aux
      #   Классический сборщик кладёт сюда ID образа, BuildKit — base64 protobuf `StatusResponse` при `id` = `moby.buildkit.trace`.
      #
      #   @return [DockerEngineRuby::Models::ImageID, String, nil]
      optional :aux, union: -> { DockerEngineRuby::BuildInfo::Aux }

      # @!method initialize(id: nil, stream: nil, error: nil, error_detail: nil, status: nil, progress: nil, progress_detail: nil, aux: nil)
      #   @param id [String]
      #
      #   @param stream [String] Строка вывода сборки.
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
      #
      #   @param aux [DockerEngineRuby::Models::ImageID, String] Классический сборщик кладёт сюда ID образа, BuildKit — base64 protobuf `StatusResponse` при `id` = `moby.buildkit.trace`.

      # @see DockerEngineRuby::Models::BuildInfo#aux
      module Aux
        extend DockerEngineRuby::Internal::Type::Union

        variant -> { DockerEngineRuby::ImageID }

        variant String

        # @!method self.variants
        #   @return [Array(DockerEngineRuby::Models::ImageID, String)]
      end
    end
  end
end
