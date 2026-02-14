# typed: strong

module DockerEngineRuby
  module Models
    class ImageCommitParams < DockerEngineRuby::Models::Config
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageCommitParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :author

      sig { params(author: String).void }
      attr_writer :author

      sig { returns(T.nilable(String)) }
      attr_reader :changes

      sig { params(changes: String).void }
      attr_writer :changes

      sig { returns(T.nilable(String)) }
      attr_reader :comment

      sig { params(comment: String).void }
      attr_writer :comment

      sig { returns(T.nilable(String)) }
      attr_reader :container

      sig { params(container: String).void }
      attr_writer :container

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :pause

      sig { params(pause: T::Boolean).void }
      attr_writer :pause

      sig { returns(T.nilable(String)) }
      attr_reader :repo

      sig { params(repo: String).void }
      attr_writer :repo

      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig do
        params(
          author: String,
          changes: String,
          comment: String,
          container: String,
          pause: T::Boolean,
          repo: String,
          tag: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        author: nil,
        changes: nil,
        comment: nil,
        container: nil,
        pause: nil,
        repo: nil,
        tag: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            author: String,
            changes: String,
            comment: String,
            container: String,
            pause: T::Boolean,
            repo: String,
            tag: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
