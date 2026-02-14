# typed: strong

module DockerEngine
  module Models
    class ImagePullParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::ImagePullParams, DockerEngine::Internal::AnyHash)
        end

      # Apply `Dockerfile` instructions to the image that is created, for example:
      # `changes=ENV DEBUG=true`. Note that `ENV DEBUG=true` should be URI component
      # encoded.
      #
      # Supported `Dockerfile` instructions:
      # `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :changes

      sig { params(changes: T::Array[String]).void }
      attr_writer :changes

      # Name of the image to pull. If the name includes a tag or digest, specific
      # behavior applies:
      #
      # - If only `fromImage` includes a tag, that tag is used.
      # - If both `fromImage` and `tag` are provided, `tag` takes precedence.
      # - If `fromImage` includes a digest, the image is pulled by digest, and `tag` is
      #   ignored.
      # - If neither a tag nor digest is specified, all tags are pulled.
      sig { returns(T.nilable(String)) }
      attr_reader :from_image

      sig { params(from_image: String).void }
      attr_writer :from_image

      # Source to import. The value may be a URL from which the image can be retrieved
      # or `-` to read the image from the request body. This parameter may only be used
      # when importing an image.
      sig { returns(T.nilable(String)) }
      attr_reader :from_src

      sig { params(from_src: String).void }
      attr_writer :from_src

      # Set commit message for imported image.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Platform in the format os[/arch[/variant]].
      #
      # When used in combination with the `fromImage` option, the daemon checks if the
      # given image is present in the local image cache with the given OS and
      # Architecture, and otherwise attempts to pull the image. If the option is not
      # set, the host's native OS and Architecture are used. If the given image does not
      # exist in the local image cache, the daemon attempts to pull the image with the
      # host's native OS and Architecture. If the given image does exists in the local
      # image cache, but its OS or architecture does not match, a warning is produced.
      #
      # When used with the `fromSrc` option to import an image from an archive, this
      # option sets the platform information for the imported image. If the option is
      # not set, the host's native OS and Architecture are used for the imported image.
      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      # Repository name given to an image when it is imported. The repo may include a
      # tag. This parameter may only be used when importing an image.
      sig { returns(T.nilable(String)) }
      attr_reader :repo

      sig { params(repo: String).void }
      attr_writer :repo

      # Tag or digest. If empty when pulling an image, this causes all tags for the
      # given image to be pulled.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig { returns(T.nilable(String)) }
      attr_reader :body

      sig { params(body: String).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          changes: T::Array[String],
          from_image: String,
          from_src: String,
          message: String,
          platform: String,
          repo: String,
          tag: String,
          body: String,
          x_registry_auth: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Apply `Dockerfile` instructions to the image that is created, for example:
        # `changes=ENV DEBUG=true`. Note that `ENV DEBUG=true` should be URI component
        # encoded.
        #
        # Supported `Dockerfile` instructions:
        # `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
        changes: nil,
        # Name of the image to pull. If the name includes a tag or digest, specific
        # behavior applies:
        #
        # - If only `fromImage` includes a tag, that tag is used.
        # - If both `fromImage` and `tag` are provided, `tag` takes precedence.
        # - If `fromImage` includes a digest, the image is pulled by digest, and `tag` is
        #   ignored.
        # - If neither a tag nor digest is specified, all tags are pulled.
        from_image: nil,
        # Source to import. The value may be a URL from which the image can be retrieved
        # or `-` to read the image from the request body. This parameter may only be used
        # when importing an image.
        from_src: nil,
        # Set commit message for imported image.
        message: nil,
        # Platform in the format os[/arch[/variant]].
        #
        # When used in combination with the `fromImage` option, the daemon checks if the
        # given image is present in the local image cache with the given OS and
        # Architecture, and otherwise attempts to pull the image. If the option is not
        # set, the host's native OS and Architecture are used. If the given image does not
        # exist in the local image cache, the daemon attempts to pull the image with the
        # host's native OS and Architecture. If the given image does exists in the local
        # image cache, but its OS or architecture does not match, a warning is produced.
        #
        # When used with the `fromSrc` option to import an image from an archive, this
        # option sets the platform information for the imported image. If the option is
        # not set, the host's native OS and Architecture are used for the imported image.
        platform: nil,
        # Repository name given to an image when it is imported. The repo may include a
        # tag. This parameter may only be used when importing an image.
        repo: nil,
        # Tag or digest. If empty when pulling an image, this causes all tags for the
        # given image to be pulled.
        tag: nil,
        body: nil,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            changes: T::Array[String],
            from_image: String,
            from_src: String,
            message: String,
            platform: String,
            repo: String,
            tag: String,
            body: String,
            x_registry_auth: String,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
