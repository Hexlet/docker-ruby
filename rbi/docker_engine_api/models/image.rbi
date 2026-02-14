# typed: strong

module DockerEngineAPI
  module Models
    class Image < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineAPI::Image, DockerEngineAPI::Internal::AnyHash)
        end

      # Hardware CPU architecture that the image runs on.
      sig { returns(T.nilable(String)) }
      attr_reader :architecture

      sig { params(architecture: String).void }
      attr_writer :architecture

      # Name of the author that was specified when committing the image, or as specified
      # through MAINTAINER (deprecated) in the Dockerfile.
      sig { returns(T.nilable(String)) }
      attr_accessor :author

      # Optional message that was set when committing or importing the image.
      sig { returns(T.nilable(String)) }
      attr_accessor :comment

      # Configuration of the image. These fields are used as defaults when starting a
      # container from the image.
      sig { returns(T.nilable(DockerEngineAPI::Image::Config)) }
      attr_reader :config

      sig { params(config: DockerEngineAPI::Image::Config::OrHash).void }
      attr_writer :config

      # Date and time at which the image was created, formatted in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      # This information is only available if present in the image, and omitted
      # otherwise.
      sig { returns(T.nilable(String)) }
      attr_accessor :created

      # A descriptor struct containing digest, media type, and size, as defined in the
      # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      sig { returns(T.nilable(DockerEngineAPI::Image::Descriptor)) }
      attr_reader :descriptor

      sig do
        params(descriptor: DockerEngineAPI::Image::Descriptor::OrHash).void
      end
      attr_writer :descriptor

      # Information about the storage driver used to store the container's and image's
      # filesystem.
      sig { returns(T.nilable(DockerEngineAPI::Image::GraphDriver)) }
      attr_reader :graph_driver

      sig do
        params(graph_driver: DockerEngineAPI::Image::GraphDriver::OrHash).void
      end
      attr_writer :graph_driver

      # ID is the content-addressable ID of an image.
      #
      # This identifier is a content-addressable digest calculated from the image's
      # configuration (which includes the digests of layers used by the image).
      #
      # Note that this digest differs from the `RepoDigests` below, which holds digests
      # of image manifests that reference the image.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Identity holds information about the identity and origin of the image. This is
      # trusted information verified by the daemon and cannot be modified by tagging an
      # image to a different name.
      sig { returns(T.nilable(DockerEngineAPI::Image::Identity)) }
      attr_reader :identity

      sig { params(identity: DockerEngineAPI::Image::Identity::OrHash).void }
      attr_writer :identity

      # Manifests is a list of image manifests available in this image. It provides a
      # more detailed view of the platform-specific image manifests or other
      # image-attached data like build attestations.
      #
      # Only available if the daemon provides a multi-platform image store and the
      # `manifests` option is set in the inspect request.
      #
      # WARNING: This is experimental and may change at any time without any backward
      # compatibility.
      sig { returns(T.nilable(T::Array[DockerEngineAPI::Image::Manifest])) }
      attr_accessor :manifests

      # Additional metadata of the image in the local cache. This information is local
      # to the daemon, and not part of the image itself.
      sig { returns(T.nilable(DockerEngineAPI::Image::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: DockerEngineAPI::Image::Metadata::OrHash).void }
      attr_writer :metadata

      # Operating System the image is built to run on.
      sig { returns(T.nilable(String)) }
      attr_reader :os

      sig { params(os: String).void }
      attr_writer :os

      # Operating System version the image is built to run on (especially for Windows).
      sig { returns(T.nilable(String)) }
      attr_accessor :os_version

      # List of content-addressable digests of locally available image manifests that
      # the image is referenced from. Multiple manifests can refer to the same image.
      #
      # These digests are usually only available if the image was either pulled from a
      # registry, or if the image was pushed to a registry, which is when the manifest
      # is generated and its digest calculated.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :repo_digests

      sig { params(repo_digests: T::Array[String]).void }
      attr_writer :repo_digests

      # List of image names/tags in the local image cache that reference this image.
      #
      # Multiple image tags can refer to the same image, and this list may be empty if
      # no tags reference the image, in which case the image is "untagged", in which
      # case it can still be referenced by its ID.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :repo_tags

      sig { params(repo_tags: T::Array[String]).void }
      attr_writer :repo_tags

      # Information about the image's RootFS, including the layer IDs.
      sig { returns(T.nilable(DockerEngineAPI::Image::RootFs)) }
      attr_reader :root_fs

      sig { params(root_fs: DockerEngineAPI::Image::RootFs::OrHash).void }
      attr_writer :root_fs

      # Total size of the image including all layers it is composed of.
      sig { returns(T.nilable(Integer)) }
      attr_reader :size

      sig { params(size: Integer).void }
      attr_writer :size

      # CPU architecture variant (presently ARM-only).
      sig { returns(T.nilable(String)) }
      attr_accessor :variant

      # Information about an image in the local image cache.
      sig do
        params(
          architecture: String,
          author: T.nilable(String),
          comment: T.nilable(String),
          config: DockerEngineAPI::Image::Config::OrHash,
          created: T.nilable(String),
          descriptor: DockerEngineAPI::Image::Descriptor::OrHash,
          graph_driver: DockerEngineAPI::Image::GraphDriver::OrHash,
          id: String,
          identity: DockerEngineAPI::Image::Identity::OrHash,
          manifests:
            T.nilable(T::Array[DockerEngineAPI::Image::Manifest::OrHash]),
          metadata: DockerEngineAPI::Image::Metadata::OrHash,
          os: String,
          os_version: T.nilable(String),
          repo_digests: T::Array[String],
          repo_tags: T::Array[String],
          root_fs: DockerEngineAPI::Image::RootFs::OrHash,
          size: Integer,
          variant: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Hardware CPU architecture that the image runs on.
        architecture: nil,
        # Name of the author that was specified when committing the image, or as specified
        # through MAINTAINER (deprecated) in the Dockerfile.
        author: nil,
        # Optional message that was set when committing or importing the image.
        comment: nil,
        # Configuration of the image. These fields are used as defaults when starting a
        # container from the image.
        config: nil,
        # Date and time at which the image was created, formatted in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        #
        # This information is only available if present in the image, and omitted
        # otherwise.
        created: nil,
        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        descriptor: nil,
        # Information about the storage driver used to store the container's and image's
        # filesystem.
        graph_driver: nil,
        # ID is the content-addressable ID of an image.
        #
        # This identifier is a content-addressable digest calculated from the image's
        # configuration (which includes the digests of layers used by the image).
        #
        # Note that this digest differs from the `RepoDigests` below, which holds digests
        # of image manifests that reference the image.
        id: nil,
        # Identity holds information about the identity and origin of the image. This is
        # trusted information verified by the daemon and cannot be modified by tagging an
        # image to a different name.
        identity: nil,
        # Manifests is a list of image manifests available in this image. It provides a
        # more detailed view of the platform-specific image manifests or other
        # image-attached data like build attestations.
        #
        # Only available if the daemon provides a multi-platform image store and the
        # `manifests` option is set in the inspect request.
        #
        # WARNING: This is experimental and may change at any time without any backward
        # compatibility.
        manifests: nil,
        # Additional metadata of the image in the local cache. This information is local
        # to the daemon, and not part of the image itself.
        metadata: nil,
        # Operating System the image is built to run on.
        os: nil,
        # Operating System version the image is built to run on (especially for Windows).
        os_version: nil,
        # List of content-addressable digests of locally available image manifests that
        # the image is referenced from. Multiple manifests can refer to the same image.
        #
        # These digests are usually only available if the image was either pulled from a
        # registry, or if the image was pushed to a registry, which is when the manifest
        # is generated and its digest calculated.
        repo_digests: nil,
        # List of image names/tags in the local image cache that reference this image.
        #
        # Multiple image tags can refer to the same image, and this list may be empty if
        # no tags reference the image, in which case the image is "untagged", in which
        # case it can still be referenced by its ID.
        repo_tags: nil,
        # Information about the image's RootFS, including the layer IDs.
        root_fs: nil,
        # Total size of the image including all layers it is composed of.
        size: nil,
        # CPU architecture variant (presently ARM-only).
        variant: nil
      )
      end

      sig do
        override.returns(
          {
            architecture: String,
            author: T.nilable(String),
            comment: T.nilable(String),
            config: DockerEngineAPI::Image::Config,
            created: T.nilable(String),
            descriptor: DockerEngineAPI::Image::Descriptor,
            graph_driver: DockerEngineAPI::Image::GraphDriver,
            id: String,
            identity: DockerEngineAPI::Image::Identity,
            manifests: T.nilable(T::Array[DockerEngineAPI::Image::Manifest]),
            metadata: DockerEngineAPI::Image::Metadata,
            os: String,
            os_version: T.nilable(String),
            repo_digests: T::Array[String],
            repo_tags: T::Array[String],
            root_fs: DockerEngineAPI::Image::RootFs,
            size: Integer,
            variant: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Config < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::Config,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Command is already escaped (Windows only)
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :args_escaped

        # Command to run specified as a string or an array of strings.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :cmd

        sig { params(cmd: T::Array[String]).void }
        attr_writer :cmd

        # The entry point for the container as a string or an array of strings.
        #
        # If the array consists of exactly one empty string (`[""]`) then the entry point
        # is reset to system default (i.e., the entry point used by docker when there is
        # no `ENTRYPOINT` instruction in the `Dockerfile`).
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :entrypoint

        sig { params(entrypoint: T::Array[String]).void }
        attr_writer :entrypoint

        # A list of environment variables to set inside the container in the form
        # `["VAR=value", ...]`. A variable without `=` is removed from the environment,
        # rather than to have an empty value.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :env

        sig { params(env: T::Array[String]).void }
        attr_writer :env

        # An object mapping ports to an empty object in the form:
        #
        # `{"<port>/<tcp|udp|sctp>": {}}`
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :exposed_ports

        # A test to perform to check that the container is healthy. Healthcheck commands
        # should be side-effect free.
        sig { returns(T.nilable(DockerEngineAPI::Image::Config::Healthcheck)) }
        attr_reader :healthcheck

        sig do
          params(
            healthcheck: DockerEngineAPI::Image::Config::Healthcheck::OrHash
          ).void
        end
        attr_writer :healthcheck

        # User-defined key/value metadata.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :labels

        sig { params(labels: T::Hash[Symbol, String]).void }
        attr_writer :labels

        # `ONBUILD` metadata that were defined in the image's `Dockerfile`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :on_build

        # Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :shell

        # Signal to stop a container as a string or unsigned integer.
        sig { returns(T.nilable(String)) }
        attr_accessor :stop_signal

        # The user that commands are run as inside the container.
        sig { returns(T.nilable(String)) }
        attr_reader :user

        sig { params(user: String).void }
        attr_writer :user

        # An object mapping mount point paths inside the container to empty objects.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :volumes

        sig { params(volumes: T::Hash[Symbol, T.anything]).void }
        attr_writer :volumes

        # The working directory for commands to run in.
        sig { returns(T.nilable(String)) }
        attr_reader :working_dir

        sig { params(working_dir: String).void }
        attr_writer :working_dir

        # Configuration of the image. These fields are used as defaults when starting a
        # container from the image.
        sig do
          params(
            args_escaped: T.nilable(T::Boolean),
            cmd: T::Array[String],
            entrypoint: T::Array[String],
            env: T::Array[String],
            exposed_ports: T.nilable(T::Hash[Symbol, T.anything]),
            healthcheck: DockerEngineAPI::Image::Config::Healthcheck::OrHash,
            labels: T::Hash[Symbol, String],
            on_build: T.nilable(T::Array[String]),
            shell: T.nilable(T::Array[String]),
            stop_signal: T.nilable(String),
            user: String,
            volumes: T::Hash[Symbol, T.anything],
            working_dir: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Command is already escaped (Windows only)
          args_escaped: nil,
          # Command to run specified as a string or an array of strings.
          cmd: nil,
          # The entry point for the container as a string or an array of strings.
          #
          # If the array consists of exactly one empty string (`[""]`) then the entry point
          # is reset to system default (i.e., the entry point used by docker when there is
          # no `ENTRYPOINT` instruction in the `Dockerfile`).
          entrypoint: nil,
          # A list of environment variables to set inside the container in the form
          # `["VAR=value", ...]`. A variable without `=` is removed from the environment,
          # rather than to have an empty value.
          env: nil,
          # An object mapping ports to an empty object in the form:
          #
          # `{"<port>/<tcp|udp|sctp>": {}}`
          exposed_ports: nil,
          # A test to perform to check that the container is healthy. Healthcheck commands
          # should be side-effect free.
          healthcheck: nil,
          # User-defined key/value metadata.
          labels: nil,
          # `ONBUILD` metadata that were defined in the image's `Dockerfile`.
          on_build: nil,
          # Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
          shell: nil,
          # Signal to stop a container as a string or unsigned integer.
          stop_signal: nil,
          # The user that commands are run as inside the container.
          user: nil,
          # An object mapping mount point paths inside the container to empty objects.
          volumes: nil,
          # The working directory for commands to run in.
          working_dir: nil
        )
        end

        sig do
          override.returns(
            {
              args_escaped: T.nilable(T::Boolean),
              cmd: T::Array[String],
              entrypoint: T::Array[String],
              env: T::Array[String],
              exposed_ports: T.nilable(T::Hash[Symbol, T.anything]),
              healthcheck: DockerEngineAPI::Image::Config::Healthcheck,
              labels: T::Hash[Symbol, String],
              on_build: T.nilable(T::Array[String]),
              shell: T.nilable(T::Array[String]),
              stop_signal: T.nilable(String),
              user: String,
              volumes: T::Hash[Symbol, T.anything],
              working_dir: String
            }
          )
        end
        def to_hash
        end

        class Healthcheck < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Config::Healthcheck,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # The time to wait between checks in nanoseconds. It should be 0 or at least
          # 1000000 (1 ms). 0 means inherit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :interval

          sig { params(interval: Integer).void }
          attr_writer :interval

          # The number of consecutive failures needed to consider a container as unhealthy.
          # 0 means inherit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :retries

          sig { params(retries: Integer).void }
          attr_writer :retries

          # The time to wait between checks in nanoseconds during the start period. It
          # should be 0 or at least 1000000 (1 ms). 0 means inherit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :start_interval

          sig { params(start_interval: Integer).void }
          attr_writer :start_interval

          # Start period for the container to initialize before starting health-retries
          # countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
          # inherit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :start_period

          sig { params(start_period: Integer).void }
          attr_writer :start_period

          # The test to perform. Possible values are:
          #
          # - `[]` inherit healthcheck from image or parent image
          # - `["NONE"]` disable healthcheck
          # - `["CMD", args...]` exec arguments directly
          # - `["CMD-SHELL", command]` run command with system's default shell
          #
          # A non-zero exit code indicates a failed healthcheck:
          #
          # - `0` healthy
          # - `1` unhealthy
          # - `2` reserved (treated as unhealthy)
          # - other values: error running probe
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :test_

          sig { params(test_: T::Array[String]).void }
          attr_writer :test_

          # The time to wait before considering the check to have hung. It should be 0 or at
          # least 1000000 (1 ms). 0 means inherit.
          #
          # If the health check command does not complete within this timeout, the check is
          # considered failed and the health check process is forcibly terminated without a
          # graceful shutdown.
          sig { returns(T.nilable(Integer)) }
          attr_reader :timeout

          sig { params(timeout: Integer).void }
          attr_writer :timeout

          # A test to perform to check that the container is healthy. Healthcheck commands
          # should be side-effect free.
          sig do
            params(
              interval: Integer,
              retries: Integer,
              start_interval: Integer,
              start_period: Integer,
              test_: T::Array[String],
              timeout: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The time to wait between checks in nanoseconds. It should be 0 or at least
            # 1000000 (1 ms). 0 means inherit.
            interval: nil,
            # The number of consecutive failures needed to consider a container as unhealthy.
            # 0 means inherit.
            retries: nil,
            # The time to wait between checks in nanoseconds during the start period. It
            # should be 0 or at least 1000000 (1 ms). 0 means inherit.
            start_interval: nil,
            # Start period for the container to initialize before starting health-retries
            # countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
            # inherit.
            start_period: nil,
            # The test to perform. Possible values are:
            #
            # - `[]` inherit healthcheck from image or parent image
            # - `["NONE"]` disable healthcheck
            # - `["CMD", args...]` exec arguments directly
            # - `["CMD-SHELL", command]` run command with system's default shell
            #
            # A non-zero exit code indicates a failed healthcheck:
            #
            # - `0` healthy
            # - `1` unhealthy
            # - `2` reserved (treated as unhealthy)
            # - other values: error running probe
            test_: nil,
            # The time to wait before considering the check to have hung. It should be 0 or at
            # least 1000000 (1 ms). 0 means inherit.
            #
            # If the health check command does not complete within this timeout, the check is
            # considered failed and the health check process is forcibly terminated without a
            # graceful shutdown.
            timeout: nil
          )
          end

          sig do
            override.returns(
              {
                interval: Integer,
                retries: Integer,
                start_interval: Integer,
                start_period: Integer,
                test_: T::Array[String],
                timeout: Integer
              }
            )
          end
          def to_hash
          end
        end
      end

      class Descriptor < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::Descriptor,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Arbitrary metadata relating to the targeted content.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :annotations

        # ArtifactType is the IANA media type of this artifact.
        sig { returns(T.nilable(String)) }
        attr_accessor :artifact_type

        # Data is an embedding of the targeted content. This is encoded as a base64 string
        # when marshalled to JSON (automatically, by encoding/json). If present, Data can
        # be used directly to avoid fetching the targeted content.
        sig { returns(T.nilable(String)) }
        attr_accessor :data

        # The digest of the targeted content.
        sig { returns(T.nilable(String)) }
        attr_reader :digest

        sig { params(digest: String).void }
        attr_writer :digest

        # The media type of the object this schema refers to.
        sig { returns(T.nilable(String)) }
        attr_reader :media_type

        sig { params(media_type: String).void }
        attr_writer :media_type

        # Describes the platform which the image in the manifest runs on, as defined in
        # the
        # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
        sig { returns(T.nilable(DockerEngineAPI::Image::Descriptor::Platform)) }
        attr_reader :platform

        sig do
          params(
            platform:
              T.nilable(DockerEngineAPI::Image::Descriptor::Platform::OrHash)
          ).void
        end
        attr_writer :platform

        # The size in bytes of the blob.
        sig { returns(T.nilable(Integer)) }
        attr_reader :size

        sig { params(size: Integer).void }
        attr_writer :size

        # List of URLs from which this object MAY be downloaded.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :urls

        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        sig do
          params(
            annotations: T.nilable(T::Hash[Symbol, String]),
            artifact_type: T.nilable(String),
            data: T.nilable(String),
            digest: String,
            media_type: String,
            platform:
              T.nilable(DockerEngineAPI::Image::Descriptor::Platform::OrHash),
            size: Integer,
            urls: T.nilable(T::Array[String])
          ).returns(T.attached_class)
        end
        def self.new(
          # Arbitrary metadata relating to the targeted content.
          annotations: nil,
          # ArtifactType is the IANA media type of this artifact.
          artifact_type: nil,
          # Data is an embedding of the targeted content. This is encoded as a base64 string
          # when marshalled to JSON (automatically, by encoding/json). If present, Data can
          # be used directly to avoid fetching the targeted content.
          data: nil,
          # The digest of the targeted content.
          digest: nil,
          # The media type of the object this schema refers to.
          media_type: nil,
          # Describes the platform which the image in the manifest runs on, as defined in
          # the
          # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          platform: nil,
          # The size in bytes of the blob.
          size: nil,
          # List of URLs from which this object MAY be downloaded.
          urls: nil
        )
        end

        sig do
          override.returns(
            {
              annotations: T.nilable(T::Hash[Symbol, String]),
              artifact_type: T.nilable(String),
              data: T.nilable(String),
              digest: String,
              media_type: String,
              platform: T.nilable(DockerEngineAPI::Image::Descriptor::Platform),
              size: Integer,
              urls: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end

        class Platform < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Descriptor::Platform,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # The CPU architecture, for example `amd64` or `ppc64`.
          sig { returns(T.nilable(String)) }
          attr_reader :architecture

          sig { params(architecture: String).void }
          attr_writer :architecture

          # The operating system, for example `linux` or `windows`.
          sig { returns(T.nilable(String)) }
          attr_reader :os

          sig { params(os: String).void }
          attr_writer :os

          # Optional field specifying an array of strings, each listing a required OS
          # feature (for example on Windows `win32k`).
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :os_features

          sig { params(os_features: T::Array[String]).void }
          attr_writer :os_features

          # Optional field specifying the operating system version, for example on Windows
          # `10.0.19041.1165`.
          sig { returns(T.nilable(String)) }
          attr_reader :os_version

          sig { params(os_version: String).void }
          attr_writer :os_version

          # Optional field specifying a variant of the CPU, for example `v7` to specify
          # ARMv7 when architecture is `arm`.
          sig { returns(T.nilable(String)) }
          attr_reader :variant

          sig { params(variant: String).void }
          attr_writer :variant

          # Describes the platform which the image in the manifest runs on, as defined in
          # the
          # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          sig do
            params(
              architecture: String,
              os: String,
              os_features: T::Array[String],
              os_version: String,
              variant: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The CPU architecture, for example `amd64` or `ppc64`.
            architecture: nil,
            # The operating system, for example `linux` or `windows`.
            os: nil,
            # Optional field specifying an array of strings, each listing a required OS
            # feature (for example on Windows `win32k`).
            os_features: nil,
            # Optional field specifying the operating system version, for example on Windows
            # `10.0.19041.1165`.
            os_version: nil,
            # Optional field specifying a variant of the CPU, for example `v7` to specify
            # ARMv7 when architecture is `arm`.
            variant: nil
          )
          end

          sig do
            override.returns(
              {
                architecture: String,
                os: String,
                os_features: T::Array[String],
                os_version: String,
                variant: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class GraphDriver < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::GraphDriver,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Low-level storage metadata, provided as key/value pairs.
        #
        # This information is driver-specific, and depends on the storage-driver in use,
        # and should be used for informational purposes only.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :data

        # Name of the storage driver.
        sig { returns(String) }
        attr_accessor :name

        # Information about the storage driver used to store the container's and image's
        # filesystem.
        sig do
          params(data: T::Hash[Symbol, String], name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Low-level storage metadata, provided as key/value pairs.
          #
          # This information is driver-specific, and depends on the storage-driver in use,
          # and should be used for informational purposes only.
          data:,
          # Name of the storage driver.
          name:
        )
        end

        sig do
          override.returns({ data: T::Hash[Symbol, String], name: String })
        end
        def to_hash
        end
      end

      class Identity < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::Identity,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Build contains build reference information if image was created via build.
        sig do
          returns(T.nilable(T::Array[DockerEngineAPI::Image::Identity::Build]))
        end
        attr_reader :build

        sig do
          params(
            build: T::Array[DockerEngineAPI::Image::Identity::Build::OrHash]
          ).void
        end
        attr_writer :build

        # Pull contains remote location information if image was created via pull. If
        # image was pulled via mirror, this contains the original repository location.
        # After successful push this images also contains the pushed repository location.
        sig do
          returns(T.nilable(T::Array[DockerEngineAPI::Image::Identity::Pull]))
        end
        attr_reader :pull

        sig do
          params(
            pull: T::Array[DockerEngineAPI::Image::Identity::Pull::OrHash]
          ).void
        end
        attr_writer :pull

        # Signature contains the properties of verified signatures for the image.
        sig do
          returns(
            T.nilable(T::Array[DockerEngineAPI::Image::Identity::Signature])
          )
        end
        attr_reader :signature

        sig do
          params(
            signature:
              T::Array[DockerEngineAPI::Image::Identity::Signature::OrHash]
          ).void
        end
        attr_writer :signature

        # Identity holds information about the identity and origin of the image. This is
        # trusted information verified by the daemon and cannot be modified by tagging an
        # image to a different name.
        sig do
          params(
            build: T::Array[DockerEngineAPI::Image::Identity::Build::OrHash],
            pull: T::Array[DockerEngineAPI::Image::Identity::Pull::OrHash],
            signature:
              T::Array[DockerEngineAPI::Image::Identity::Signature::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Build contains build reference information if image was created via build.
          build: nil,
          # Pull contains remote location information if image was created via pull. If
          # image was pulled via mirror, this contains the original repository location.
          # After successful push this images also contains the pushed repository location.
          pull: nil,
          # Signature contains the properties of verified signatures for the image.
          signature: nil
        )
        end

        sig do
          override.returns(
            {
              build: T::Array[DockerEngineAPI::Image::Identity::Build],
              pull: T::Array[DockerEngineAPI::Image::Identity::Pull],
              signature: T::Array[DockerEngineAPI::Image::Identity::Signature]
            }
          )
        end
        def to_hash
        end

        class Build < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Identity::Build,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # CreatedAt is the time when the build ran.
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Ref is the identifier for the build request. This reference can be used to look
          # up the build details in BuildKit history API.
          sig { returns(T.nilable(String)) }
          attr_reader :ref

          sig { params(ref: String).void }
          attr_writer :ref

          # BuildIdentity contains build reference information if image was created via
          # build.
          sig do
            params(created_at: Time, ref: String).returns(T.attached_class)
          end
          def self.new(
            # CreatedAt is the time when the build ran.
            created_at: nil,
            # Ref is the identifier for the build request. This reference can be used to look
            # up the build details in BuildKit history API.
            ref: nil
          )
          end

          sig { override.returns({ created_at: Time, ref: String }) }
          def to_hash
          end
        end

        class Pull < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Identity::Pull,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Repository is the remote repository location the image was pulled from.
          sig { returns(T.nilable(String)) }
          attr_reader :repository

          sig { params(repository: String).void }
          attr_writer :repository

          # PullIdentity contains remote location information if image was created via pull.
          # If image was pulled via mirror, this contains the original repository location.
          sig { params(repository: String).returns(T.attached_class) }
          def self.new(
            # Repository is the remote repository location the image was pulled from.
            repository: nil
          )
          end

          sig { override.returns({ repository: String }) }
          def to_hash
          end
        end

        class Signature < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Identity::Signature,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # DockerReference is the Docker image reference associated with the signature.
          # This is an optional field only present in older hashedrecord signatures.
          sig { returns(T.nilable(String)) }
          attr_reader :docker_reference

          sig { params(docker_reference: String).void }
          attr_writer :docker_reference

          # Error contains error information if signature verification failed. Other fields
          # will be empty in this case.
          sig { returns(T.nilable(String)) }
          attr_reader :error

          sig { params(error: String).void }
          attr_writer :error

          # KnownSignerIdentity is an identifier for a special signer identity that is known
          # to the implementation.
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::Image::Identity::Signature::KnownSigner::TaggedSymbol
              )
            )
          end
          attr_reader :known_signer

          sig do
            params(
              known_signer:
                DockerEngineAPI::Image::Identity::Signature::KnownSigner::OrSymbol
            ).void
          end
          attr_writer :known_signer

          # Name is a textual description summarizing the type of signature.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # SignatureType is the type of signature format.
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::Image::Identity::Signature::SignatureType::TaggedSymbol
              )
            )
          end
          attr_reader :signature_type

          sig do
            params(
              signature_type:
                DockerEngineAPI::Image::Identity::Signature::SignatureType::OrSymbol
            ).void
          end
          attr_writer :signature_type

          # SignerIdentity contains information about the signer certificate used to sign
          # the image.
          sig do
            returns(
              T.nilable(DockerEngineAPI::Image::Identity::Signature::Signer)
            )
          end
          attr_reader :signer

          sig do
            params(
              signer:
                DockerEngineAPI::Image::Identity::Signature::Signer::OrHash
            ).void
          end
          attr_writer :signer

          # Timestamps contains a list of verified signed timestamps for the signature.
          sig do
            returns(
              T.nilable(
                T::Array[DockerEngineAPI::Image::Identity::Signature::Timestamp]
              )
            )
          end
          attr_reader :timestamps

          sig do
            params(
              timestamps:
                T::Array[
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::OrHash
                ]
            ).void
          end
          attr_writer :timestamps

          # Warnings contains any warnings that occurred during signature verification. For
          # example, if there was no internet connectivity and cached trust roots were used.
          # Warning does not indicate a failed verification but may point to configuration
          # issues.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :warnings

          sig { params(warnings: T::Array[String]).void }
          attr_writer :warnings

          # SignatureIdentity contains the properties of verified signatures for the image.
          sig do
            params(
              docker_reference: String,
              error: String,
              known_signer:
                DockerEngineAPI::Image::Identity::Signature::KnownSigner::OrSymbol,
              name: String,
              signature_type:
                DockerEngineAPI::Image::Identity::Signature::SignatureType::OrSymbol,
              signer:
                DockerEngineAPI::Image::Identity::Signature::Signer::OrHash,
              timestamps:
                T::Array[
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::OrHash
                ],
              warnings: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # DockerReference is the Docker image reference associated with the signature.
            # This is an optional field only present in older hashedrecord signatures.
            docker_reference: nil,
            # Error contains error information if signature verification failed. Other fields
            # will be empty in this case.
            error: nil,
            # KnownSignerIdentity is an identifier for a special signer identity that is known
            # to the implementation.
            known_signer: nil,
            # Name is a textual description summarizing the type of signature.
            name: nil,
            # SignatureType is the type of signature format.
            signature_type: nil,
            # SignerIdentity contains information about the signer certificate used to sign
            # the image.
            signer: nil,
            # Timestamps contains a list of verified signed timestamps for the signature.
            timestamps: nil,
            # Warnings contains any warnings that occurred during signature verification. For
            # example, if there was no internet connectivity and cached trust roots were used.
            # Warning does not indicate a failed verification but may point to configuration
            # issues.
            warnings: nil
          )
          end

          sig do
            override.returns(
              {
                docker_reference: String,
                error: String,
                known_signer:
                  DockerEngineAPI::Image::Identity::Signature::KnownSigner::TaggedSymbol,
                name: String,
                signature_type:
                  DockerEngineAPI::Image::Identity::Signature::SignatureType::TaggedSymbol,
                signer: DockerEngineAPI::Image::Identity::Signature::Signer,
                timestamps:
                  T::Array[
                    DockerEngineAPI::Image::Identity::Signature::Timestamp
                  ],
                warnings: T::Array[String]
              }
            )
          end
          def to_hash
          end

          # KnownSignerIdentity is an identifier for a special signer identity that is known
          # to the implementation.
          module KnownSigner
            extend DockerEngineAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineAPI::Image::Identity::Signature::KnownSigner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DHI =
              T.let(
                :DHI,
                DockerEngineAPI::Image::Identity::Signature::KnownSigner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineAPI::Image::Identity::Signature::KnownSigner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # SignatureType is the type of signature format.
          module SignatureType
            extend DockerEngineAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineAPI::Image::Identity::Signature::SignatureType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BUNDLE_V0_3 =
              T.let(
                :"bundle-v0.3",
                DockerEngineAPI::Image::Identity::Signature::SignatureType::TaggedSymbol
              )
            SIMPLESIGNING_V1 =
              T.let(
                :"simplesigning-v1",
                DockerEngineAPI::Image::Identity::Signature::SignatureType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineAPI::Image::Identity::Signature::SignatureType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Signer < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Image::Identity::Signature::Signer,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Immutable reference to the specific version of the top-level/initiating build
            # instructions.
            sig { returns(T.nilable(String)) }
            attr_reader :build_config_digest

            sig { params(build_config_digest: String).void }
            attr_writer :build_config_digest

            # Build Config URL to the top-level/initiating build instructions.
            sig { returns(T.nilable(String)) }
            attr_reader :build_config_uri

            sig { params(build_config_uri: String).void }
            attr_writer :build_config_uri

            # Immutable reference to the specific version of the build instructions that is
            # responsible for signing.
            sig { returns(T.nilable(String)) }
            attr_reader :build_signer_digest

            sig { params(build_signer_digest: String).void }
            attr_writer :build_signer_digest

            # Reference to specific build instructions that are responsible for signing.
            sig { returns(T.nilable(String)) }
            attr_reader :build_signer_uri

            sig { params(build_signer_uri: String).void }
            attr_writer :build_signer_uri

            # Event or action that initiated the build.
            sig { returns(T.nilable(String)) }
            attr_reader :build_trigger

            sig { params(build_trigger: String).void }
            attr_writer :build_trigger

            # CertificateIssuer is the certificate issuer.
            sig { returns(T.nilable(String)) }
            attr_reader :certificate_issuer

            sig { params(certificate_issuer: String).void }
            attr_writer :certificate_issuer

            # The OIDC issuer. Should match `iss` claim of ID token or, in the case of a
            # federated login like Dex it should match the issuer URL of the upstream issuer.
            # The issuer is not set the extensions are invalid and will fail to render.
            sig { returns(T.nilable(String)) }
            attr_reader :issuer

            sig { params(issuer: String).void }
            attr_writer :issuer

            # Run Invocation URL to uniquely identify the build execution.
            sig { returns(T.nilable(String)) }
            attr_reader :run_invocation_uri

            sig { params(run_invocation_uri: String).void }
            attr_writer :run_invocation_uri

            # Specifies whether the build took place in platform-hosted cloud infrastructure
            # or customer/self-hosted infrastructure.
            sig { returns(T.nilable(String)) }
            attr_reader :runner_environment

            sig { params(runner_environment: String).void }
            attr_writer :runner_environment

            # Immutable reference to a specific version of the source code that the build was
            # based upon.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_digest

            sig { params(source_repository_digest: String).void }
            attr_writer :source_repository_digest

            # Immutable identifier for the source repository the workflow was based upon.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_identifier

            sig { params(source_repository_identifier: String).void }
            attr_writer :source_repository_identifier

            # Immutable identifier for the owner of the source repository that the workflow
            # was based upon.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_owner_identifier

            sig { params(source_repository_owner_identifier: String).void }
            attr_writer :source_repository_owner_identifier

            # Source repository owner URL of the owner of the source repository that the build
            # was based on.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_owner_uri

            sig { params(source_repository_owner_uri: String).void }
            attr_writer :source_repository_owner_uri

            # Source Repository Ref that the build run was based upon.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_ref

            sig { params(source_repository_ref: String).void }
            attr_writer :source_repository_ref

            # Source repository URL that the build was based on.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_uri

            sig { params(source_repository_uri: String).void }
            attr_writer :source_repository_uri

            # Source repository visibility at the time of signing the certificate.
            sig { returns(T.nilable(String)) }
            attr_reader :source_repository_visibility_at_signing

            sig { params(source_repository_visibility_at_signing: String).void }
            attr_writer :source_repository_visibility_at_signing

            # SubjectAlternativeName is the certificate subject alternative name.
            sig { returns(T.nilable(String)) }
            attr_reader :subject_alternative_name

            sig { params(subject_alternative_name: String).void }
            attr_writer :subject_alternative_name

            # SignerIdentity contains information about the signer certificate used to sign
            # the image.
            sig do
              params(
                build_config_digest: String,
                build_config_uri: String,
                build_signer_digest: String,
                build_signer_uri: String,
                build_trigger: String,
                certificate_issuer: String,
                issuer: String,
                run_invocation_uri: String,
                runner_environment: String,
                source_repository_digest: String,
                source_repository_identifier: String,
                source_repository_owner_identifier: String,
                source_repository_owner_uri: String,
                source_repository_ref: String,
                source_repository_uri: String,
                source_repository_visibility_at_signing: String,
                subject_alternative_name: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Immutable reference to the specific version of the top-level/initiating build
              # instructions.
              build_config_digest: nil,
              # Build Config URL to the top-level/initiating build instructions.
              build_config_uri: nil,
              # Immutable reference to the specific version of the build instructions that is
              # responsible for signing.
              build_signer_digest: nil,
              # Reference to specific build instructions that are responsible for signing.
              build_signer_uri: nil,
              # Event or action that initiated the build.
              build_trigger: nil,
              # CertificateIssuer is the certificate issuer.
              certificate_issuer: nil,
              # The OIDC issuer. Should match `iss` claim of ID token or, in the case of a
              # federated login like Dex it should match the issuer URL of the upstream issuer.
              # The issuer is not set the extensions are invalid and will fail to render.
              issuer: nil,
              # Run Invocation URL to uniquely identify the build execution.
              run_invocation_uri: nil,
              # Specifies whether the build took place in platform-hosted cloud infrastructure
              # or customer/self-hosted infrastructure.
              runner_environment: nil,
              # Immutable reference to a specific version of the source code that the build was
              # based upon.
              source_repository_digest: nil,
              # Immutable identifier for the source repository the workflow was based upon.
              source_repository_identifier: nil,
              # Immutable identifier for the owner of the source repository that the workflow
              # was based upon.
              source_repository_owner_identifier: nil,
              # Source repository owner URL of the owner of the source repository that the build
              # was based on.
              source_repository_owner_uri: nil,
              # Source Repository Ref that the build run was based upon.
              source_repository_ref: nil,
              # Source repository URL that the build was based on.
              source_repository_uri: nil,
              # Source repository visibility at the time of signing the certificate.
              source_repository_visibility_at_signing: nil,
              # SubjectAlternativeName is the certificate subject alternative name.
              subject_alternative_name: nil
            )
            end

            sig do
              override.returns(
                {
                  build_config_digest: String,
                  build_config_uri: String,
                  build_signer_digest: String,
                  build_signer_uri: String,
                  build_trigger: String,
                  certificate_issuer: String,
                  issuer: String,
                  run_invocation_uri: String,
                  runner_environment: String,
                  source_repository_digest: String,
                  source_repository_identifier: String,
                  source_repository_owner_identifier: String,
                  source_repository_owner_uri: String,
                  source_repository_ref: String,
                  source_repository_uri: String,
                  source_repository_visibility_at_signing: String,
                  subject_alternative_name: String
                }
              )
            end
            def to_hash
            end
          end

          class Timestamp < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Image::Identity::Signature::Timestamp,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Time)) }
            attr_reader :timestamp

            sig { params(timestamp: Time).void }
            attr_writer :timestamp

            # SignatureTimestampType is the type of timestamp used in the signature.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::TaggedSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig { returns(T.nilable(String)) }
            attr_reader :uri

            sig { params(uri: String).void }
            attr_writer :uri

            # SignatureTimestamp contains information about a verified signed timestamp for an
            # image signature.
            sig do
              params(
                timestamp: Time,
                type:
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::OrSymbol,
                uri: String
              ).returns(T.attached_class)
            end
            def self.new(
              timestamp: nil,
              # SignatureTimestampType is the type of timestamp used in the signature.
              type: nil,
              uri: nil
            )
            end

            sig do
              override.returns(
                {
                  timestamp: Time,
                  type:
                    DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::TaggedSymbol,
                  uri: String
                }
              )
            end
            def to_hash
            end

            # SignatureTimestampType is the type of timestamp used in the signature.
            module Type
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::Image::Identity::Signature::Timestamp::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TLOG =
                T.let(
                  :Tlog,
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::TaggedSymbol
                )
              TIMESTAMP_AUTHORITY =
                T.let(
                  :TimestampAuthority,
                  DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::Image::Identity::Signature::Timestamp::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end

      class Manifest < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::Manifest,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Indicates whether all the child content (image config, layers) is fully
        # available locally.
        sig { returns(T::Boolean) }
        attr_accessor :available

        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        sig { returns(DockerEngineAPI::Image::Manifest::Descriptor) }
        attr_reader :descriptor

        sig do
          params(
            descriptor: DockerEngineAPI::Image::Manifest::Descriptor::OrHash
          ).void
        end
        attr_writer :descriptor

        # ID is the content-addressable ID of an image and is the same as the digest of
        # the image manifest.
        sig { returns(String) }
        attr_accessor :id

        # The kind of the manifest.
        #
        # | kind        | description                                                                          |
        # | ----------- | ------------------------------------------------------------------------------------ |
        # | image       | Image manifest that can be used to start a container.                                |
        # | attestation | Attestation manifest produced by the Buildkit builder for a specific image manifest. |
        sig { returns(DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol) }
        attr_accessor :kind

        sig { returns(DockerEngineAPI::Image::Manifest::Size) }
        attr_reader :size

        sig do
          params(size: DockerEngineAPI::Image::Manifest::Size::OrHash).void
        end
        attr_writer :size

        # The image data for the attestation manifest. This field is only populated when
        # Kind is "attestation".
        sig do
          returns(T.nilable(DockerEngineAPI::Image::Manifest::AttestationData))
        end
        attr_reader :attestation_data

        sig do
          params(
            attestation_data:
              T.nilable(
                DockerEngineAPI::Image::Manifest::AttestationData::OrHash
              )
          ).void
        end
        attr_writer :attestation_data

        # The image data for the image manifest. This field is only populated when Kind is
        # "image".
        sig { returns(T.nilable(DockerEngineAPI::Image::Manifest::ImageData)) }
        attr_reader :image_data

        sig do
          params(
            image_data:
              T.nilable(DockerEngineAPI::Image::Manifest::ImageData::OrHash)
          ).void
        end
        attr_writer :image_data

        # ImageManifestSummary represents a summary of an image manifest.
        sig do
          params(
            available: T::Boolean,
            descriptor: DockerEngineAPI::Image::Manifest::Descriptor::OrHash,
            id: String,
            kind: DockerEngineAPI::Image::Manifest::Kind::OrSymbol,
            size: DockerEngineAPI::Image::Manifest::Size::OrHash,
            attestation_data:
              T.nilable(
                DockerEngineAPI::Image::Manifest::AttestationData::OrHash
              ),
            image_data:
              T.nilable(DockerEngineAPI::Image::Manifest::ImageData::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates whether all the child content (image config, layers) is fully
          # available locally.
          available:,
          # A descriptor struct containing digest, media type, and size, as defined in the
          # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
          descriptor:,
          # ID is the content-addressable ID of an image and is the same as the digest of
          # the image manifest.
          id:,
          # The kind of the manifest.
          #
          # | kind        | description                                                                          |
          # | ----------- | ------------------------------------------------------------------------------------ |
          # | image       | Image manifest that can be used to start a container.                                |
          # | attestation | Attestation manifest produced by the Buildkit builder for a specific image manifest. |
          kind:,
          size:,
          # The image data for the attestation manifest. This field is only populated when
          # Kind is "attestation".
          attestation_data: nil,
          # The image data for the image manifest. This field is only populated when Kind is
          # "image".
          image_data: nil
        )
        end

        sig do
          override.returns(
            {
              available: T::Boolean,
              descriptor: DockerEngineAPI::Image::Manifest::Descriptor,
              id: String,
              kind: DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol,
              size: DockerEngineAPI::Image::Manifest::Size,
              attestation_data:
                T.nilable(DockerEngineAPI::Image::Manifest::AttestationData),
              image_data: T.nilable(DockerEngineAPI::Image::Manifest::ImageData)
            }
          )
        end
        def to_hash
        end

        class Descriptor < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Manifest::Descriptor,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Arbitrary metadata relating to the targeted content.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_accessor :annotations

          # ArtifactType is the IANA media type of this artifact.
          sig { returns(T.nilable(String)) }
          attr_accessor :artifact_type

          # Data is an embedding of the targeted content. This is encoded as a base64 string
          # when marshalled to JSON (automatically, by encoding/json). If present, Data can
          # be used directly to avoid fetching the targeted content.
          sig { returns(T.nilable(String)) }
          attr_accessor :data

          # The digest of the targeted content.
          sig { returns(T.nilable(String)) }
          attr_reader :digest

          sig { params(digest: String).void }
          attr_writer :digest

          # The media type of the object this schema refers to.
          sig { returns(T.nilable(String)) }
          attr_reader :media_type

          sig { params(media_type: String).void }
          attr_writer :media_type

          # Describes the platform which the image in the manifest runs on, as defined in
          # the
          # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          sig do
            returns(
              T.nilable(DockerEngineAPI::Image::Manifest::Descriptor::Platform)
            )
          end
          attr_reader :platform

          sig do
            params(
              platform:
                T.nilable(
                  DockerEngineAPI::Image::Manifest::Descriptor::Platform::OrHash
                )
            ).void
          end
          attr_writer :platform

          # The size in bytes of the blob.
          sig { returns(T.nilable(Integer)) }
          attr_reader :size

          sig { params(size: Integer).void }
          attr_writer :size

          # List of URLs from which this object MAY be downloaded.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :urls

          # A descriptor struct containing digest, media type, and size, as defined in the
          # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
          sig do
            params(
              annotations: T.nilable(T::Hash[Symbol, String]),
              artifact_type: T.nilable(String),
              data: T.nilable(String),
              digest: String,
              media_type: String,
              platform:
                T.nilable(
                  DockerEngineAPI::Image::Manifest::Descriptor::Platform::OrHash
                ),
              size: Integer,
              urls: T.nilable(T::Array[String])
            ).returns(T.attached_class)
          end
          def self.new(
            # Arbitrary metadata relating to the targeted content.
            annotations: nil,
            # ArtifactType is the IANA media type of this artifact.
            artifact_type: nil,
            # Data is an embedding of the targeted content. This is encoded as a base64 string
            # when marshalled to JSON (automatically, by encoding/json). If present, Data can
            # be used directly to avoid fetching the targeted content.
            data: nil,
            # The digest of the targeted content.
            digest: nil,
            # The media type of the object this schema refers to.
            media_type: nil,
            # Describes the platform which the image in the manifest runs on, as defined in
            # the
            # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            platform: nil,
            # The size in bytes of the blob.
            size: nil,
            # List of URLs from which this object MAY be downloaded.
            urls: nil
          )
          end

          sig do
            override.returns(
              {
                annotations: T.nilable(T::Hash[Symbol, String]),
                artifact_type: T.nilable(String),
                data: T.nilable(String),
                digest: String,
                media_type: String,
                platform:
                  T.nilable(
                    DockerEngineAPI::Image::Manifest::Descriptor::Platform
                  ),
                size: Integer,
                urls: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end

          class Platform < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Image::Manifest::Descriptor::Platform,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # The CPU architecture, for example `amd64` or `ppc64`.
            sig { returns(T.nilable(String)) }
            attr_reader :architecture

            sig { params(architecture: String).void }
            attr_writer :architecture

            # The operating system, for example `linux` or `windows`.
            sig { returns(T.nilable(String)) }
            attr_reader :os

            sig { params(os: String).void }
            attr_writer :os

            # Optional field specifying an array of strings, each listing a required OS
            # feature (for example on Windows `win32k`).
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :os_features

            sig { params(os_features: T::Array[String]).void }
            attr_writer :os_features

            # Optional field specifying the operating system version, for example on Windows
            # `10.0.19041.1165`.
            sig { returns(T.nilable(String)) }
            attr_reader :os_version

            sig { params(os_version: String).void }
            attr_writer :os_version

            # Optional field specifying a variant of the CPU, for example `v7` to specify
            # ARMv7 when architecture is `arm`.
            sig { returns(T.nilable(String)) }
            attr_reader :variant

            sig { params(variant: String).void }
            attr_writer :variant

            # Describes the platform which the image in the manifest runs on, as defined in
            # the
            # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            sig do
              params(
                architecture: String,
                os: String,
                os_features: T::Array[String],
                os_version: String,
                variant: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The CPU architecture, for example `amd64` or `ppc64`.
              architecture: nil,
              # The operating system, for example `linux` or `windows`.
              os: nil,
              # Optional field specifying an array of strings, each listing a required OS
              # feature (for example on Windows `win32k`).
              os_features: nil,
              # Optional field specifying the operating system version, for example on Windows
              # `10.0.19041.1165`.
              os_version: nil,
              # Optional field specifying a variant of the CPU, for example `v7` to specify
              # ARMv7 when architecture is `arm`.
              variant: nil
            )
            end

            sig do
              override.returns(
                {
                  architecture: String,
                  os: String,
                  os_features: T::Array[String],
                  os_version: String,
                  variant: String
                }
              )
            end
            def to_hash
            end
          end
        end

        # The kind of the manifest.
        #
        # | kind        | description                                                                          |
        # | ----------- | ------------------------------------------------------------------------------------ |
        # | image       | Image manifest that can be used to start a container.                                |
        # | attestation | Attestation manifest produced by the Buildkit builder for a specific image manifest. |
        module Kind
          extend DockerEngineAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineAPI::Image::Manifest::Kind)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(:image, DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol)
          ATTESTATION =
            T.let(
              :attestation,
              DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol
            )
          UNKNOWN =
            T.let(
              :unknown,
              DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[DockerEngineAPI::Image::Manifest::Kind::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Size < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Manifest::Size,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Content is the size (in bytes) of all the locally present content in the content
          # store (e.g. image config, layers) referenced by this manifest and its children.
          # This only includes blobs in the content store.
          sig { returns(Integer) }
          attr_accessor :content

          # Total is the total size (in bytes) of all the locally present data (both
          # distributable and non-distributable) that's related to this manifest and its
          # children. This equal to the sum of [Content] size AND all the sizes in the
          # [Size] struct present in the Kind-specific data struct. For example, for an
          # image kind (Kind == "image") this would include the size of the image content
          # and unpacked image snapshots ([Size.Content] + [ImageData.Size.Unpacked]).
          sig { returns(Integer) }
          attr_accessor :total

          sig do
            params(content: Integer, total: Integer).returns(T.attached_class)
          end
          def self.new(
            # Content is the size (in bytes) of all the locally present content in the content
            # store (e.g. image config, layers) referenced by this manifest and its children.
            # This only includes blobs in the content store.
            content:,
            # Total is the total size (in bytes) of all the locally present data (both
            # distributable and non-distributable) that's related to this manifest and its
            # children. This equal to the sum of [Content] size AND all the sizes in the
            # [Size] struct present in the Kind-specific data struct. For example, for an
            # image kind (Kind == "image") this would include the size of the image content
            # and unpacked image snapshots ([Size.Content] + [ImageData.Size.Unpacked]).
            total:
          )
          end

          sig { override.returns({ content: Integer, total: Integer }) }
          def to_hash
          end
        end

        class AttestationData < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Manifest::AttestationData,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # The digest of the image manifest that this attestation is for.
          sig { returns(String) }
          attr_accessor :for_

          # The image data for the attestation manifest. This field is only populated when
          # Kind is "attestation".
          sig { params(for_: String).returns(T.attached_class) }
          def self.new(
            # The digest of the image manifest that this attestation is for.
            for_:
          )
          end

          sig { override.returns({ for_: String }) }
          def to_hash
          end
        end

        class ImageData < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Image::Manifest::ImageData,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # The IDs of the containers that are using this image.
          sig { returns(T::Array[String]) }
          attr_accessor :containers

          # Describes the platform which the image in the manifest runs on, as defined in
          # the
          # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          sig do
            returns(
              T.nilable(DockerEngineAPI::Image::Manifest::ImageData::Platform)
            )
          end
          attr_reader :platform

          sig do
            params(
              platform:
                T.nilable(
                  DockerEngineAPI::Image::Manifest::ImageData::Platform::OrHash
                )
            ).void
          end
          attr_writer :platform

          sig { returns(DockerEngineAPI::Image::Manifest::ImageData::Size) }
          attr_reader :size

          sig do
            params(
              size: DockerEngineAPI::Image::Manifest::ImageData::Size::OrHash
            ).void
          end
          attr_writer :size

          # The image data for the image manifest. This field is only populated when Kind is
          # "image".
          sig do
            params(
              containers: T::Array[String],
              platform:
                T.nilable(
                  DockerEngineAPI::Image::Manifest::ImageData::Platform::OrHash
                ),
              size: DockerEngineAPI::Image::Manifest::ImageData::Size::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The IDs of the containers that are using this image.
            containers:,
            # Describes the platform which the image in the manifest runs on, as defined in
            # the
            # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            platform:,
            size:
          )
          end

          sig do
            override.returns(
              {
                containers: T::Array[String],
                platform:
                  T.nilable(
                    DockerEngineAPI::Image::Manifest::ImageData::Platform
                  ),
                size: DockerEngineAPI::Image::Manifest::ImageData::Size
              }
            )
          end
          def to_hash
          end

          class Platform < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Image::Manifest::ImageData::Platform,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # The CPU architecture, for example `amd64` or `ppc64`.
            sig { returns(T.nilable(String)) }
            attr_reader :architecture

            sig { params(architecture: String).void }
            attr_writer :architecture

            # The operating system, for example `linux` or `windows`.
            sig { returns(T.nilable(String)) }
            attr_reader :os

            sig { params(os: String).void }
            attr_writer :os

            # Optional field specifying an array of strings, each listing a required OS
            # feature (for example on Windows `win32k`).
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :os_features

            sig { params(os_features: T::Array[String]).void }
            attr_writer :os_features

            # Optional field specifying the operating system version, for example on Windows
            # `10.0.19041.1165`.
            sig { returns(T.nilable(String)) }
            attr_reader :os_version

            sig { params(os_version: String).void }
            attr_writer :os_version

            # Optional field specifying a variant of the CPU, for example `v7` to specify
            # ARMv7 when architecture is `arm`.
            sig { returns(T.nilable(String)) }
            attr_reader :variant

            sig { params(variant: String).void }
            attr_writer :variant

            # Describes the platform which the image in the manifest runs on, as defined in
            # the
            # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            sig do
              params(
                architecture: String,
                os: String,
                os_features: T::Array[String],
                os_version: String,
                variant: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The CPU architecture, for example `amd64` or `ppc64`.
              architecture: nil,
              # The operating system, for example `linux` or `windows`.
              os: nil,
              # Optional field specifying an array of strings, each listing a required OS
              # feature (for example on Windows `win32k`).
              os_features: nil,
              # Optional field specifying the operating system version, for example on Windows
              # `10.0.19041.1165`.
              os_version: nil,
              # Optional field specifying a variant of the CPU, for example `v7` to specify
              # ARMv7 when architecture is `arm`.
              variant: nil
            )
            end

            sig do
              override.returns(
                {
                  architecture: String,
                  os: String,
                  os_features: T::Array[String],
                  os_version: String,
                  variant: String
                }
              )
            end
            def to_hash
            end
          end

          class Size < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Image::Manifest::ImageData::Size,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Unpacked is the size (in bytes) of the locally unpacked (uncompressed) image
            # content that's directly usable by the containers running this image. It's
            # independent of the distributable content - e.g. the image might still have an
            # unpacked data that's still used by some container even when the
            # distributable/compressed content is already gone.
            sig { returns(Integer) }
            attr_accessor :unpacked

            sig { params(unpacked: Integer).returns(T.attached_class) }
            def self.new(
              # Unpacked is the size (in bytes) of the locally unpacked (uncompressed) image
              # content that's directly usable by the containers running this image. It's
              # independent of the distributable content - e.g. the image might still have an
              # unpacked data that's still used by some container even when the
              # distributable/compressed content is already gone.
              unpacked:
            )
            end

            sig { override.returns({ unpacked: Integer }) }
            def to_hash
            end
          end
        end
      end

      class Metadata < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::Metadata,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Date and time at which the image was last tagged in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        #
        # This information is only available if the image was tagged locally, and omitted
        # otherwise.
        sig { returns(T.nilable(String)) }
        attr_accessor :last_tag_time

        # Additional metadata of the image in the local cache. This information is local
        # to the daemon, and not part of the image itself.
        sig do
          params(last_tag_time: T.nilable(String)).returns(T.attached_class)
        end
        def self.new(
          # Date and time at which the image was last tagged in
          # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
          #
          # This information is only available if the image was tagged locally, and omitted
          # otherwise.
          last_tag_time: nil
        )
        end

        sig { override.returns({ last_tag_time: T.nilable(String) }) }
        def to_hash
        end
      end

      class RootFs < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Image::RootFs,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :type

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :layers

        sig { params(layers: T::Array[String]).void }
        attr_writer :layers

        # Information about the image's RootFS, including the layer IDs.
        sig do
          params(type: String, layers: T::Array[String]).returns(
            T.attached_class
          )
        end
        def self.new(type:, layers: nil)
        end

        sig { override.returns({ type: String, layers: T::Array[String] }) }
        def to_hash
        end
      end
    end
  end
end
