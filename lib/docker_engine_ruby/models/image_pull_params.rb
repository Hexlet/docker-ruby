# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#pull
    class ImagePullParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [String]
      required :body, String

      # @!attribute changes
      #
      #   @return [Array<String>, nil]
      optional :changes, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute from_image
      #
      #   @return [String, nil]
      optional :from_image, String

      # @!attribute from_src
      #
      #   @return [String, nil]
      optional :from_src, String

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute platform
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute repo
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(body:, changes: nil, from_image: nil, from_src: nil, message: nil, platform: nil, repo: nil, tag: nil, x_registry_auth: nil, request_options: {})
      #   @param body [String]
      #   @param changes [Array<String>]
      #   @param from_image [String]
      #   @param from_src [String]
      #   @param message [String]
      #   @param platform [String]
      #   @param repo [String]
      #   @param tag [String]
      #   @param x_registry_auth [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
