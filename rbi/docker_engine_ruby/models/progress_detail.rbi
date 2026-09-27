# typed: strong

module DockerEngineRuby
  module Models
    class ProgressDetail < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ProgressDetail,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :current

      sig { params(current: Integer).void }
      attr_writer :current

      sig { returns(T.nilable(Integer)) }
      attr_reader :total

      sig { params(total: Integer).void }
      attr_writer :total

      sig { params(current: Integer, total: Integer).returns(T.attached_class) }
      def self.new(current: nil, total: nil)
      end

      sig { override.returns({ current: Integer, total: Integer }) }
      def to_hash
      end
    end
  end
end
