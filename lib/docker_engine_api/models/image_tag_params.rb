# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#tag
    class ImageTagParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

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
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
