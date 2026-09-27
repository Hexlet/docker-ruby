# typed: strong

module DockerEngineRuby
  module Models
    class ImageID < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::ImageID, DockerEngineRuby::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { params(id: String).returns(T.attached_class) }
      def self.new(id: nil)
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
