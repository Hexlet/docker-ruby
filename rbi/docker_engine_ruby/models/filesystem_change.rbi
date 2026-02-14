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
      sig { returns(DockerEngineRuby::FilesystemChange::Kind::TaggedInteger) }
      attr_accessor :kind

      # Path to file or directory that has changed.
      sig { returns(String) }
      attr_accessor :path

      # Change in the container's filesystem.
      sig do
        params(
          kind: DockerEngineRuby::FilesystemChange::Kind::OrInteger,
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
            kind: DockerEngineRuby::FilesystemChange::Kind::TaggedInteger,
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

        TaggedInteger =
          T.type_alias do
            T.all(Integer, DockerEngineRuby::FilesystemChange::Kind)
          end
        OrInteger = T.type_alias { Integer }

        KIND_0 =
          T.let(0, DockerEngineRuby::FilesystemChange::Kind::TaggedInteger)
        KIND_1 =
          T.let(1, DockerEngineRuby::FilesystemChange::Kind::TaggedInteger)
        KIND_2 =
          T.let(2, DockerEngineRuby::FilesystemChange::Kind::TaggedInteger)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::FilesystemChange::Kind::TaggedInteger]
          )
        end
        def self.values
        end
      end
    end
  end
end
