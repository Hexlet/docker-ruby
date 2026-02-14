# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#commit
    class ImageCommitParams < DockerEngineAPI::Models::Config
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute author
      #   Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      #
      #   @return [String, nil]
      optional :author, String

      # @!attribute changes
      #   `Dockerfile` instructions to apply while committing
      #
      #   @return [String, nil]
      optional :changes, String

      # @!attribute comment
      #   Commit message
      #
      #   @return [String, nil]
      optional :comment, String

      # @!attribute container
      #   The ID or name of the container to commit
      #
      #   @return [String, nil]
      optional :container, String

      # @!attribute pause
      #   Whether to pause the container before committing
      #
      #   @return [Boolean, nil]
      optional :pause, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute repo
      #   Repository name for the created image
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #   Tag name for the create image
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(author: nil, changes: nil, comment: nil, container: nil, pause: nil, repo: nil, tag: nil, request_options: {})
      #   @param author [String] Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      #
      #   @param changes [String] `Dockerfile` instructions to apply while committing
      #
      #   @param comment [String] Commit message
      #
      #   @param container [String] The ID or name of the container to commit
      #
      #   @param pause [Boolean] Whether to pause the container before committing
      #
      #   @param repo [String] Repository name for the created image
      #
      #   @param tag [String] Tag name for the create image
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
