# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#commit
    class ImageCommitParams < DockerEngineRuby::Models::Config
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute author
      #
      #   @return [String, nil]
      optional :author, String

      # @!attribute changes
      #
      #   @return [String, nil]
      optional :changes, String

      # @!attribute comment
      #
      #   @return [String, nil]
      optional :comment, String

      # @!attribute container
      #
      #   @return [String, nil]
      optional :container, String

      # @!attribute pause
      #
      #   @return [Boolean, nil]
      optional :pause, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute repo
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(author: nil, changes: nil, comment: nil, container: nil, pause: nil, repo: nil, tag: nil, request_options: {})
      #   @param author [String]
      #   @param changes [String]
      #   @param comment [String]
      #   @param container [String]
      #   @param pause [Boolean]
      #   @param repo [String]
      #   @param tag [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
