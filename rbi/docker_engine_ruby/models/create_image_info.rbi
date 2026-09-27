# typed: strong

module DockerEngineRuby
  module Models
    class CreateImageInfo < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::CreateImageInfo,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Устаревшее поле: то же, что `error_detail.message`.
      sig { returns(T.nilable(String)) }
      attr_reader :error

      sig { params(error: String).void }
      attr_writer :error

      sig { returns(T.nilable(DockerEngineRuby::ErrorDetail)) }
      attr_reader :error_detail

      sig { params(error_detail: DockerEngineRuby::ErrorDetail::OrHash).void }
      attr_writer :error_detail

      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Устаревшее поле: прогресс строкой.
      sig { returns(T.nilable(String)) }
      attr_reader :progress

      sig { params(progress: String).void }
      attr_writer :progress

      sig { returns(T.nilable(DockerEngineRuby::ProgressDetail)) }
      attr_reader :progress_detail

      sig do
        params(progress_detail: DockerEngineRuby::ProgressDetail::OrHash).void
      end
      attr_writer :progress_detail

      sig do
        params(
          id: String,
          error: String,
          error_detail: DockerEngineRuby::ErrorDetail::OrHash,
          status: String,
          progress: String,
          progress_detail: DockerEngineRuby::ProgressDetail::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        error: nil,
        error_detail: nil,
        status: nil,
        progress: nil,
        progress_detail: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            error: String,
            error_detail: DockerEngineRuby::ErrorDetail,
            status: String,
            progress: String,
            progress_detail: DockerEngineRuby::ProgressDetail
          }
        )
      end
      def to_hash
      end
    end
  end
end
