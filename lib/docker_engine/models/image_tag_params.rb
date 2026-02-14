# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#tag
    class ImageTagParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute repo
      #   The repository to tag in. For example, `someuser/someimage`.
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #   The name of the new tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(repo: nil, tag: nil, request_options: {})
      #   @param repo [String] The repository to tag in. For example, `someuser/someimage`.
      #
      #   @param tag [String] The name of the new tag.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
