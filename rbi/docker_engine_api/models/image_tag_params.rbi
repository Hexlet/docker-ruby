# typed: strong

module DockerEngineAPI
  module Models
    class ImageTagParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ImageTagParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The repository to tag in. For example, `someuser/someimage`.
      sig { returns(T.nilable(String)) }
      attr_reader :repo

      sig { params(repo: String).void }
      attr_writer :repo

      # The name of the new tag.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig do
        params(
          repo: String,
          tag: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The repository to tag in. For example, `someuser/someimage`.
        repo: nil,
        # The name of the new tag.
        tag: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            repo: String,
            tag: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
