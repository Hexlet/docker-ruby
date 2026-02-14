# typed: strong

module DockerEngineRuby
  module Models
    class FilesystemChange < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::FilesystemChange,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Kind of change
      #
      # Can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      sig { returns(DockerEngineRuby::FilesystemChange::Kind::TaggedFloat) }
      attr_accessor :kind

      # Path to file or directory that has changed.
      sig { returns(String) }
      attr_accessor :path

      # Change in the container's filesystem.
      sig do
        params(
          kind: DockerEngineRuby::FilesystemChange::Kind::OrFloat,
          path: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Kind of change
        #
        # Can be one of:
        #
        # - `0`: Modified ("C")
        # - `1`: Added ("A")
        # - `2`: Deleted ("D")
        kind:,
        # Path to file or directory that has changed.
        path:
      )
      end

      sig do
        override.returns(
          {
            kind: DockerEngineRuby::FilesystemChange::Kind::TaggedFloat,
            path: String
          }
        )
      end
      def to_hash
      end

      # Kind of change
      #
      # Can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      module Kind
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedFloat =
          T.type_alias do
            T.all(Float, DockerEngineRuby::FilesystemChange::Kind)
          end
        OrFloat = T.type_alias { Float }

        KIND_0 = T.let(0, DockerEngineRuby::FilesystemChange::Kind::TaggedFloat)
        KIND_1 = T.let(1, DockerEngineRuby::FilesystemChange::Kind::TaggedFloat)
        KIND_2 = T.let(2, DockerEngineRuby::FilesystemChange::Kind::TaggedFloat)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::FilesystemChange::Kind::TaggedFloat]
          )
        end
        def self.values
        end
      end
    end
  end
end
