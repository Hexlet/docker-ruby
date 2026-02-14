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

      # Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      sig { returns(T.nilable(String)) }
      attr_reader :author

      sig { params(author: String).void }
      attr_writer :author

      # `Dockerfile` instructions to apply while committing
      sig { returns(T.nilable(String)) }
      attr_reader :changes

      sig { params(changes: String).void }
      attr_writer :changes

      # Commit message
      sig { returns(T.nilable(String)) }
      attr_reader :comment

      sig { params(comment: String).void }
      attr_writer :comment

      # The ID or name of the container to commit
      sig { returns(T.nilable(String)) }
      attr_reader :container

      sig { params(container: String).void }
      attr_writer :container

      # Whether to pause the container before committing
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :pause

      sig { params(pause: T::Boolean).void }
      attr_writer :pause

      # Repository name for the created image
      sig { returns(T.nilable(String)) }
      attr_reader :repo

      sig { params(repo: String).void }
      attr_writer :repo

      # Tag name for the create image
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
        # Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
        author: nil,
        # `Dockerfile` instructions to apply while committing
        changes: nil,
        # Commit message
        comment: nil,
        # The ID or name of the container to commit
        container: nil,
        # Whether to pause the container before committing
        pause: nil,
        # Repository name for the created image
        repo: nil,
        # Tag name for the create image
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
