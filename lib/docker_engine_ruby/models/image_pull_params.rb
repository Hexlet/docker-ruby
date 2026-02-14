# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#pull
    class ImagePullParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute changes
      #   Apply `Dockerfile` instructions to the image that is created, for example:
      #   `changes=ENV DEBUG=true`. Note that `ENV DEBUG=true` should be URI component
      #   encoded.
      #
      #   Supported `Dockerfile` instructions:
      #   `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
      #
      #   @return [Array<String>, nil]
      optional :changes, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute from_image
      #   Name of the image to pull. If the name includes a tag or digest, specific
      #   behavior applies:
      #
      #   - If only `fromImage` includes a tag, that tag is used.
      #   - If both `fromImage` and `tag` are provided, `tag` takes precedence.
      #   - If `fromImage` includes a digest, the image is pulled by digest, and `tag` is
      #     ignored.
      #   - If neither a tag nor digest is specified, all tags are pulled.
      #
      #   @return [String, nil]
      optional :from_image, String

      # @!attribute from_src
      #   Source to import. The value may be a URL from which the image can be retrieved
      #   or `-` to read the image from the request body. This parameter may only be used
      #   when importing an image.
      #
      #   @return [String, nil]
      optional :from_src, String

      # @!attribute message
      #   Set commit message for imported image.
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute platform
      #   Platform in the format os[/arch[/variant]].
      #
      #   When used in combination with the `fromImage` option, the daemon checks if the
      #   given image is present in the local image cache with the given OS and
      #   Architecture, and otherwise attempts to pull the image. If the option is not
      #   set, the host's native OS and Architecture are used. If the given image does not
      #   exist in the local image cache, the daemon attempts to pull the image with the
      #   host's native OS and Architecture. If the given image does exists in the local
      #   image cache, but its OS or architecture does not match, a warning is produced.
      #
      #   When used with the `fromSrc` option to import an image from an archive, this
      #   option sets the platform information for the imported image. If the option is
      #   not set, the host's native OS and Architecture are used for the imported image.
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute repo
      #   Repository name given to an image when it is imported. The repo may include a
      #   tag. This parameter may only be used when importing an image.
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #   Tag or digest. If empty when pulling an image, this causes all tags for the
      #   given image to be pulled.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute body
      #
      #   @return [String, nil]
      optional :body, String

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(changes: nil, from_image: nil, from_src: nil, message: nil, platform: nil, repo: nil, tag: nil, body: nil, x_registry_auth: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImagePullParams} for more details.
      #
      #   @param changes [Array<String>] Apply `Dockerfile` instructions to the image that is created,
      #
      #   @param from_image [String] Name of the image to pull. If the name includes a tag or digest, specific behavi
      #
      #   @param from_src [String] Source to import. The value may be a URL from which the image can be retrieved o
      #
      #   @param message [String] Set commit message for imported image.
      #
      #   @param platform [String] Platform in the format os[/arch[/variant]].
      #
      #   @param repo [String] Repository name given to an image when it is imported. The repo may include a ta
      #
      #   @param tag [String] Tag or digest. If empty when pulling an image, this causes all tags for the give
      #
      #   @param body [String]
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
