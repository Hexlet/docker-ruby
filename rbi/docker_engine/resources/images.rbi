# typed: strong

module DockerEngine
  module Resources
    class Images
      # Returns a list of images on the server. Note that it uses a different, smaller
      # representation of an image than inspecting a single image.
      sig do
        params(
          all: T::Boolean,
          digests: T::Boolean,
          filters: String,
          manifests: T::Boolean,
          shared_size: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::Summary])
      end
      def list(
        # Show all images. Only images from a final layer (no children) are shown by
        # default.
        all: nil,
        # Show digest information as a `RepoDigests` field on each image.
        digests: nil,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # images list.
        #
        # Available filters:
        #
        # - `before`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `dangling=true`
        # - `label=key` or `label="key=value"` of an image label
        # - `reference`=(`<image-name>[:<tag>]`)
        # - `since`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `until=<timestamp>`
        filters: nil,
        # Include `Manifests` in the image summary.
        manifests: nil,
        # Compute and show shared size as a `SharedSize` field on each image.
        shared_size: nil,
        request_options: {}
      )
      end

      # Remove an image, along with any untagged parent images that were referenced by
      # that image.
      #
      # Images can't be removed if they have descendant images, are being used by a
      # running container or are being used by a build.
      sig do
        params(
          name: String,
          force: T::Boolean,
          noprune: T::Boolean,
          platforms: T::Array[String],
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::Models::ImageDeleteResponseItem])
      end
      def delete(
        # Image name or ID
        name,
        # Remove the image even if it is being used by stopped containers or has other
        # tags
        force: nil,
        # Do not delete untagged parent images
        noprune: nil,
        # Select platform-specific content to delete. Multiple values are accepted. Each
        # platform is a OCI platform encoded as a JSON string.
        platforms: nil,
        request_options: {}
      )
      end

      # Return low-level information about an image.
      sig do
        params(
          name: String,
          manifests: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Image)
      end
      def inspect_(
        # Image name or id
        name,
        # Include Manifests in the image summary.
        manifests: nil,
        request_options: {}
      )
      end

      # Pull or import an image.
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
        ).void
      end
      def pull(
        # Query param: Apply `Dockerfile` instructions to the image that is created, for
        # example: `changes=ENV DEBUG=true`. Note that `ENV DEBUG=true` should be URI
        # component encoded.
        #
        # Supported `Dockerfile` instructions:
        # `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
        changes: nil,
        # Query param: Name of the image to pull. If the name includes a tag or digest,
        # specific behavior applies:
        #
        # - If only `fromImage` includes a tag, that tag is used.
        # - If both `fromImage` and `tag` are provided, `tag` takes precedence.
        # - If `fromImage` includes a digest, the image is pulled by digest, and `tag` is
        #   ignored.
        # - If neither a tag nor digest is specified, all tags are pulled.
        from_image: nil,
        # Query param: Source to import. The value may be a URL from which the image can
        # be retrieved or `-` to read the image from the request body. This parameter may
        # only be used when importing an image.
        from_src: nil,
        # Query param: Set commit message for imported image.
        message: nil,
        # Query param: Platform in the format os[/arch[/variant]].
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
        # Query param: Repository name given to an image when it is imported. The repo may
        # include a tag. This parameter may only be used when importing an image.
        repo: nil,
        # Query param: Tag or digest. If empty when pulling an image, this causes all tags
        # for the given image to be pulled.
        tag: nil,
        # Body param
        body: nil,
        # Header param: A base64url-encoded auth configuration.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
