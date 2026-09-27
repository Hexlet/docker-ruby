# typed: strong

module DockerEngineRuby
  module Models
    class PushImageInfo < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PushImageInfo,
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

      # Итог публикации: тег, дайджест и размер.
      sig { returns(T.nilable(DockerEngineRuby::PushImageInfo::Aux)) }
      attr_reader :aux

      sig { params(aux: DockerEngineRuby::PushImageInfo::Aux::OrHash).void }
      attr_writer :aux

      sig do
        params(
          id: String,
          error: String,
          error_detail: DockerEngineRuby::ErrorDetail::OrHash,
          status: String,
          progress: String,
          progress_detail: DockerEngineRuby::ProgressDetail::OrHash,
          aux: DockerEngineRuby::PushImageInfo::Aux::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
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
            error: String,
            error_detail: DockerEngineRuby::ErrorDetail,
            status: String,
            progress: String,
            progress_detail: DockerEngineRuby::ProgressDetail,
            aux: DockerEngineRuby::PushImageInfo::Aux
          }
        )
      end
      def to_hash
      end

      class Aux < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::PushImageInfo::Aux,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :tag

        sig { params(tag: String).void }
        attr_writer :tag

        sig { returns(T.nilable(String)) }
        attr_reader :digest

        sig { params(digest: String).void }
        attr_writer :digest

        sig { returns(T.nilable(Integer)) }
        attr_reader :size

        sig { params(size: Integer).void }
        attr_writer :size

        sig do
          params(tag: String, digest: String, size: Integer).returns(
            T.attached_class
          )
        end
        def self.new(tag: nil, digest: nil, size: nil)
        end

        sig { override.returns({ tag: String, digest: String, size: Integer }) }
        def to_hash
        end
      end
    end
  end
end
