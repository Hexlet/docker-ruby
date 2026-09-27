# typed: strong

module DockerEngineRuby
  module Models
    class BuildInfo < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::BuildInfo,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Строка вывода сборки.
      sig { returns(T.nilable(String)) }
      attr_reader :stream

      sig { params(stream: String).void }
      attr_writer :stream

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

      # Классический сборщик кладёт сюда ID образа, BuildKit — base64 protobuf `StatusResponse` при `id` = `moby.buildkit.trace`.
      sig { returns(T.nilable(DockerEngineRuby::BuildInfo::Aux::Variants)) }
      attr_reader :aux

      sig { params(aux: DockerEngineRuby::BuildInfo::Aux::Variants).void }
      attr_writer :aux

      sig do
        params(
          id: String,
          stream: String,
          error: String,
          error_detail: DockerEngineRuby::ErrorDetail::OrHash,
          status: String,
          progress: String,
          progress_detail: DockerEngineRuby::ProgressDetail::OrHash,
          aux: DockerEngineRuby::BuildInfo::Aux::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        stream: nil,
        error: nil,
        error_detail: nil,
        status: nil,
        progress: nil,
        progress_detail: nil,
        aux: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            stream: String,
            error: String,
            error_detail: DockerEngineRuby::ErrorDetail,
            status: String,
            progress: String,
            progress_detail: DockerEngineRuby::ProgressDetail,
            aux: DockerEngineRuby::BuildInfo::Aux::Variants
          }
        )
      end
      def to_hash
      end

      module Aux
        extend DockerEngineRuby::Internal::Type::Union

        Variants = T.type_alias { T.any(DockerEngineRuby::ImageID, String) }

        sig do
          override.returns(T::Array[DockerEngineRuby::BuildInfo::Aux::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
