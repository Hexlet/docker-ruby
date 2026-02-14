# typed: strong

module DockerEngineAPI
  module Models
    class FilesystemChange < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::FilesystemChange,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Kind of change
      #
      # Can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      sig { returns(DockerEngineAPI::FilesystemChange::Kind::TaggedInteger) }
      attr_accessor :kind

      # Path to file or directory that has changed.
      sig { returns(String) }
      attr_accessor :path

      # Change in the container's filesystem.
      sig do
        params(
          kind: DockerEngineAPI::FilesystemChange::Kind::OrInteger,
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
            kind: DockerEngineAPI::FilesystemChange::Kind::TaggedInteger,
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
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedInteger =
          T.type_alias do
            T.all(Integer, DockerEngineAPI::FilesystemChange::Kind)
          end
        OrInteger = T.type_alias { Integer }

        KIND_0 =
          T.let(0, DockerEngineAPI::FilesystemChange::Kind::TaggedInteger)
        KIND_1 =
          T.let(1, DockerEngineAPI::FilesystemChange::Kind::TaggedInteger)
        KIND_2 =
          T.let(2, DockerEngineAPI::FilesystemChange::Kind::TaggedInteger)

        sig do
          override.returns(
            T::Array[DockerEngineAPI::FilesystemChange::Kind::TaggedInteger]
          )
        end
        def self.values
        end
      end
    end
  end
end
