# typed: strong

module DockerEngineRuby
  module Models
    class ErrorDetail < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ErrorDetail,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Код ошибки.
      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      # Сообщение об ошибке.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { params(code: Integer, message: String).returns(T.attached_class) }
      def self.new(code: nil, message: nil)
      end

      sig { override.returns({ code: Integer, message: String }) }
      def to_hash
      end
    end
  end
end
