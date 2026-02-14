# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#inspect_
    class Image < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute architecture
      #   Hardware CPU architecture that the image runs on.
      #
      #   @return [String, nil]
      optional :architecture, String, api_name: :Architecture

      # @!attribute author
      #   Name of the author that was specified when committing the image, or as specified
      #   through MAINTAINER (deprecated) in the Dockerfile.
      #
      #   @return [String, nil]
      optional :author, String, api_name: :Author, nil?: true

      # @!attribute comment
      #   Optional message that was set when committing or importing the image.
      #
      #   @return [String, nil]
      optional :comment, String, api_name: :Comment, nil?: true

      # @!attribute config
      #   Configuration of the image. These fields are used as defaults when starting a
      #   container from the image.
      #
      #   @return [DockerEngineRuby::Models::Image::Config, nil]
      optional :config, -> { DockerEngineRuby::Image::Config }, api_name: :Config

      # @!attribute created
      #   Date and time at which the image was created, formatted in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   This information is only available if present in the image, and omitted
      #   otherwise.
      #
      #   @return [Time, nil]
      optional :created, Time, api_name: :Created, nil?: true

      # @!attribute descriptor
      #   A descriptor struct containing digest, media type, and size, as defined in the
      #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      #
      #   @return [DockerEngineRuby::Models::Image::Descriptor, nil]
      optional :descriptor, -> { DockerEngineRuby::Image::Descriptor }, api_name: :Descriptor, nil?: true

      # @!attribute graph_driver
      #   Information about the storage driver used to store the container's and image's
      #   filesystem.
      #
      #   @return [DockerEngineRuby::Models::Image::GraphDriver, nil]
      optional :graph_driver, -> { DockerEngineRuby::Image::GraphDriver }, api_name: :GraphDriver, nil?: true

      # @!attribute id
      #   ID is the content-addressable ID of an image.
      #
      #   This identifier is a content-addressable digest calculated from the image's
      #   configuration (which includes the digests of layers used by the image).
      #
      #   Note that this digest differs from the `RepoDigests` below, which holds digests
      #   of image manifests that reference the image.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :Id

      # @!attribute identity
      #   Identity holds information about the identity and origin of the image. This is
      #   trusted information verified by the daemon and cannot be modified by tagging an
      #   image to a different name.
      #
      #   @return [DockerEngineRuby::Models::Image::Identity, nil]
      optional :identity, -> { DockerEngineRuby::Image::Identity }, api_name: :Identity, nil?: true

      # @!attribute manifests
      #   Manifests is a list of image manifests available in this image. It provides a
      #   more detailed view of the platform-specific image manifests or other
      #   image-attached data like build attestations.
      #
      #   Only available if the daemon provides a multi-platform image store and the
      #   `manifests` option is set in the inspect request.
      #
      #   WARNING: This is experimental and may change at any time without any backward
      #   compatibility.
      #
      #   @return [Array<DockerEngineRuby::Models::Image::Manifest>, nil]
      optional :manifests,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Manifest] },
               api_name: :Manifests,
               nil?: true

      # @!attribute metadata
      #   Additional metadata of the image in the local cache. This information is local
      #   to the daemon, and not part of the image itself.
      #
      #   @return [DockerEngineRuby::Models::Image::Metadata, nil]
      optional :metadata, -> { DockerEngineRuby::Image::Metadata }, api_name: :Metadata

      # @!attribute os
      #   Operating System the image is built to run on.
      #
      #   @return [String, nil]
      optional :os, String, api_name: :Os

      # @!attribute os_version
      #   Operating System version the image is built to run on (especially for Windows).
      #
      #   @return [String, nil]
      optional :os_version, String, api_name: :OsVersion, nil?: true

      # @!attribute repo_digests
      #   List of content-addressable digests of locally available image manifests that
      #   the image is referenced from. Multiple manifests can refer to the same image.
      #
      #   These digests are usually only available if the image was either pulled from a
      #   registry, or if the image was pushed to a registry, which is when the manifest
      #   is generated and its digest calculated.
      #
      #   @return [Array<String>, nil]
      optional :repo_digests, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RepoDigests

      # @!attribute repo_tags
      #   List of image names/tags in the local image cache that reference this image.
      #
      #   Multiple image tags can refer to the same image, and this list may be empty if
      #   no tags reference the image, in which case the image is "untagged", in which
      #   case it can still be referenced by its ID.
      #
      #   @return [Array<String>, nil]
      optional :repo_tags, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RepoTags

      # @!attribute root_fs
      #   Information about the image's RootFS, including the layer IDs.
      #
      #   @return [DockerEngineRuby::Models::Image::RootFs, nil]
      optional :root_fs, -> { DockerEngineRuby::Image::RootFs }, api_name: :RootFS

      # @!attribute size
      #   Total size of the image including all layers it is composed of.
      #
      #   @return [Integer, nil]
      optional :size, Integer, api_name: :Size

      # @!attribute variant
      #   CPU architecture variant (presently ARM-only).
      #
      #   @return [String, nil]
      optional :variant, String, api_name: :Variant, nil?: true

      # @!method initialize(architecture: nil, author: nil, comment: nil, config: nil, created: nil, descriptor: nil, graph_driver: nil, id: nil, identity: nil, manifests: nil, metadata: nil, os: nil, os_version: nil, repo_digests: nil, repo_tags: nil, root_fs: nil, size: nil, variant: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Image} for more details.
      #
      #   Information about an image in the local image cache.
      #
      #   @param architecture [String] Hardware CPU architecture that the image runs on.
      #
      #   @param author [String, nil] Name of the author that was specified when committing the image, or as
      #
      #   @param comment [String, nil] Optional message that was set when committing or importing the image.
      #
      #   @param config [DockerEngineRuby::Models::Image::Config] Configuration of the image. These fields are used as defaults
      #
      #   @param created [Time, nil] Date and time at which the image was created, formatted in
      #
      #   @param descriptor [DockerEngineRuby::Models::Image::Descriptor, nil] A descriptor struct containing digest, media type, and size, as defined in
      #
      #   @param graph_driver [DockerEngineRuby::Models::Image::GraphDriver, nil] Information about the storage driver used to store the container's and
      #
      #   @param id [String] ID is the content-addressable ID of an image.
      #
      #   @param identity [DockerEngineRuby::Models::Image::Identity, nil] Identity holds information about the identity and origin of the image.
      #
      #   @param manifests [Array<DockerEngineRuby::Models::Image::Manifest>, nil] Manifests is a list of image manifests available in this image. It
      #
      #   @param metadata [DockerEngineRuby::Models::Image::Metadata] Additional metadata of the image in the local cache. This information
      #
      #   @param os [String] Operating System the image is built to run on.
      #
      #   @param os_version [String, nil] Operating System version the image is built to run on (especially
      #
      #   @param repo_digests [Array<String>] List of content-addressable digests of locally available image manifests
      #
      #   @param repo_tags [Array<String>] List of image names/tags in the local image cache that reference this
      #
      #   @param root_fs [DockerEngineRuby::Models::Image::RootFs] Information about the image's RootFS, including the layer IDs.
      #
      #   @param size [Integer] Total size of the image including all layers it is composed of.
      #
      #   @param variant [String, nil] CPU architecture variant (presently ARM-only).

      # @see DockerEngineRuby::Models::Image#config
      class Config < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute args_escaped
        #   Command is already escaped (Windows only)
        #
        #   @return [Boolean, nil]
        optional :args_escaped, DockerEngineRuby::Internal::Type::Boolean, api_name: :ArgsEscaped, nil?: true

        # @!attribute cmd
        #   Command to run specified as a string or an array of strings.
        #
        #   @return [Array<String>, nil]
        optional :cmd, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Cmd

        # @!attribute entrypoint
        #   The entry point for the container as a string or an array of strings.
        #
        #   If the array consists of exactly one empty string (`[""]`) then the entry point
        #   is reset to system default (i.e., the entry point used by docker when there is
        #   no `ENTRYPOINT` instruction in the `Dockerfile`).
        #
        #   @return [Array<String>, nil]
        optional :entrypoint, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Entrypoint

        # @!attribute env
        #   A list of environment variables to set inside the container in the form
        #   `["VAR=value", ...]`. A variable without `=` is removed from the environment,
        #   rather than to have an empty value.
        #
        #   @return [Array<String>, nil]
        optional :env, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Env

        # @!attribute exposed_ports
        #   An object mapping ports to an empty object in the form:
        #
        #   `{"<port>/<tcp|udp|sctp>": {}}`
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :exposed_ports,
                 DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown]],
                 api_name: :ExposedPorts,
                 nil?: true

        # @!attribute healthcheck
        #   A test to perform to check that the container is healthy. Healthcheck commands
        #   should be side-effect free.
        #
        #   @return [DockerEngineRuby::Models::Image::Config::Healthcheck, nil]
        optional :healthcheck, -> { DockerEngineRuby::Image::Config::Healthcheck }, api_name: :Healthcheck

        # @!attribute labels
        #   User-defined key/value metadata.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

        # @!attribute on_build
        #   `ONBUILD` metadata that were defined in the image's `Dockerfile`.
        #
        #   @return [Array<String>, nil]
        optional :on_build, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :OnBuild, nil?: true

        # @!attribute shell
        #   Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
        #
        #   @return [Array<String>, nil]
        optional :shell, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Shell, nil?: true

        # @!attribute stop_signal
        #   Signal to stop a container as a string or unsigned integer.
        #
        #   @return [String, nil]
        optional :stop_signal, String, api_name: :StopSignal, nil?: true

        # @!attribute user
        #   The user that commands are run as inside the container.
        #
        #   @return [String, nil]
        optional :user, String, api_name: :User

        # @!attribute volumes
        #   An object mapping mount point paths inside the container to empty objects.
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :volumes,
                 DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown]],
                 api_name: :Volumes

        # @!attribute working_dir
        #   The working directory for commands to run in.
        #
        #   @return [String, nil]
        optional :working_dir, String, api_name: :WorkingDir

        # @!method initialize(args_escaped: nil, cmd: nil, entrypoint: nil, env: nil, exposed_ports: nil, healthcheck: nil, labels: nil, on_build: nil, shell: nil, stop_signal: nil, user: nil, volumes: nil, working_dir: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Image::Config} for more details.
        #
        #   Configuration of the image. These fields are used as defaults when starting a
        #   container from the image.
        #
        #   @param args_escaped [Boolean, nil] Command is already escaped (Windows only)
        #
        #   @param cmd [Array<String>] Command to run specified as a string or an array of strings.
        #
        #   @param entrypoint [Array<String>] The entry point for the container as a string or an array of strings.
        #
        #   @param env [Array<String>] A list of environment variables to set inside the container in the
        #
        #   @param exposed_ports [Hash{Symbol=>Hash{Symbol=>Object}}, nil] An object mapping ports to an empty object in the form:
        #
        #   @param healthcheck [DockerEngineRuby::Models::Image::Config::Healthcheck] A test to perform to check that the container is healthy.
        #
        #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
        #
        #   @param on_build [Array<String>, nil] `ONBUILD` metadata that were defined in the image's `Dockerfile`.
        #
        #   @param shell [Array<String>, nil] Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
        #
        #   @param stop_signal [String, nil] Signal to stop a container as a string or unsigned integer.
        #
        #   @param user [String] The user that commands are run as inside the container.
        #
        #   @param volumes [Hash{Symbol=>Hash{Symbol=>Object}}] An object mapping mount point paths inside the container to empty
        #
        #   @param working_dir [String] The working directory for commands to run in.

        # @see DockerEngineRuby::Models::Image::Config#healthcheck
        class Healthcheck < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute interval
          #   The time to wait between checks in nanoseconds. It should be 0 or at least
          #   1000000 (1 ms). 0 means inherit.
          #
          #   @return [Integer, nil]
          optional :interval, Integer, api_name: :Interval

          # @!attribute retries
          #   The number of consecutive failures needed to consider a container as unhealthy.
          #   0 means inherit.
          #
          #   @return [Integer, nil]
          optional :retries, Integer, api_name: :Retries

          # @!attribute start_interval
          #   The time to wait between checks in nanoseconds during the start period. It
          #   should be 0 or at least 1000000 (1 ms). 0 means inherit.
          #
          #   @return [Integer, nil]
          optional :start_interval, Integer, api_name: :StartInterval

          # @!attribute start_period
          #   Start period for the container to initialize before starting health-retries
          #   countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
          #   inherit.
          #
          #   @return [Integer, nil]
          optional :start_period, Integer, api_name: :StartPeriod

          # @!attribute test_
          #   The test to perform. Possible values are:
          #
          #   - `[]` inherit healthcheck from image or parent image
          #   - `["NONE"]` disable healthcheck
          #   - `["CMD", args...]` exec arguments directly
          #   - `["CMD-SHELL", command]` run command with system's default shell
          #
          #   A non-zero exit code indicates a failed healthcheck:
          #
          #   - `0` healthy
          #   - `1` unhealthy
          #   - `2` reserved (treated as unhealthy)
          #   - other values: error running probe
          #
          #   @return [Array<String>, nil]
          optional :test_, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Test

          # @!attribute timeout
          #   The time to wait before considering the check to have hung. It should be 0 or at
          #   least 1000000 (1 ms). 0 means inherit.
          #
          #   If the health check command does not complete within this timeout, the check is
          #   considered failed and the health check process is forcibly terminated without a
          #   graceful shutdown.
          #
          #   @return [Integer, nil]
          optional :timeout, Integer, api_name: :Timeout

          # @!method initialize(interval: nil, retries: nil, start_interval: nil, start_period: nil, test_: nil, timeout: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Config::Healthcheck} for more details.
          #
          #   A test to perform to check that the container is healthy. Healthcheck commands
          #   should be side-effect free.
          #
          #   @param interval [Integer] The time to wait between checks in nanoseconds. It should be 0 or at
          #
          #   @param retries [Integer] The number of consecutive failures needed to consider a container as
          #
          #   @param start_interval [Integer] The time to wait between checks in nanoseconds during the start period.
          #
          #   @param start_period [Integer] Start period for the container to initialize before starting
          #
          #   @param test_ [Array<String>] The test to perform. Possible values are:
          #
          #   @param timeout [Integer] The time to wait before considering the check to have hung. It should
        end
      end

      # @see DockerEngineRuby::Models::Image#descriptor
      class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute annotations
        #   Arbitrary metadata relating to the targeted content.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :annotations, DockerEngineRuby::Internal::Type::HashOf[String], nil?: true

        # @!attribute artifact_type
        #   ArtifactType is the IANA media type of this artifact.
        #
        #   @return [String, nil]
        optional :artifact_type, String, api_name: :artifactType, nil?: true

        # @!attribute data
        #   Data is an embedding of the targeted content. This is encoded as a base64 string
        #   when marshalled to JSON (automatically, by encoding/json). If present, Data can
        #   be used directly to avoid fetching the targeted content.
        #
        #   @return [String, nil]
        optional :data, String, nil?: true

        # @!attribute digest
        #   The digest of the targeted content.
        #
        #   @return [String, nil]
        optional :digest, String

        # @!attribute media_type
        #   The media type of the object this schema refers to.
        #
        #   @return [String, nil]
        optional :media_type, String, api_name: :mediaType

        # @!attribute platform
        #   Describes the platform which the image in the manifest runs on, as defined in
        #   the
        #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
        #
        #   @return [DockerEngineRuby::Models::Image::Descriptor::Platform, nil]
        optional :platform, -> { DockerEngineRuby::Image::Descriptor::Platform }

        # @!attribute size
        #   The size in bytes of the blob.
        #
        #   @return [Integer, nil]
        optional :size, Integer

        # @!attribute urls
        #   List of URLs from which this object MAY be downloaded.
        #
        #   @return [Array<String>, nil]
        optional :urls, DockerEngineRuby::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(annotations: nil, artifact_type: nil, data: nil, digest: nil, media_type: nil, platform: nil, size: nil, urls: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Image::Descriptor} for more details.
        #
        #   A descriptor struct containing digest, media type, and size, as defined in the
        #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        #
        #   @param annotations [Hash{Symbol=>String}, nil] Arbitrary metadata relating to the targeted content.
        #
        #   @param artifact_type [String, nil] ArtifactType is the IANA media type of this artifact.
        #
        #   @param data [String, nil] Data is an embedding of the targeted content. This is encoded as a base64
        #
        #   @param digest [String] The digest of the targeted content.
        #
        #   @param media_type [String] The media type of the object this schema refers to.
        #
        #   @param platform [DockerEngineRuby::Models::Image::Descriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
        #
        #   @param size [Integer] The size in bytes of the blob.
        #
        #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

        # @see DockerEngineRuby::Models::Image::Descriptor#platform
        class Platform < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute architecture
          #   The CPU architecture, for example `amd64` or `ppc64`.
          #
          #   @return [String, nil]
          optional :architecture, String

          # @!attribute os
          #   The operating system, for example `linux` or `windows`.
          #
          #   @return [String, nil]
          optional :os, String

          # @!attribute os_features
          #   Optional field specifying an array of strings, each listing a required OS
          #   feature (for example on Windows `win32k`).
          #
          #   @return [Array<String>, nil]
          optional :os_features, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :"os.features"

          # @!attribute os_version
          #   Optional field specifying the operating system version, for example on Windows
          #   `10.0.19041.1165`.
          #
          #   @return [String, nil]
          optional :os_version, String, api_name: :"os.version"

          # @!attribute variant
          #   Optional field specifying a variant of the CPU, for example `v7` to specify
          #   ARMv7 when architecture is `arm`.
          #
          #   @return [String, nil]
          optional :variant, String

          # @!method initialize(architecture: nil, os: nil, os_features: nil, os_version: nil, variant: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Descriptor::Platform} for more details.
          #
          #   Describes the platform which the image in the manifest runs on, as defined in
          #   the
          #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          #
          #   @param architecture [String] The CPU architecture, for example `amd64` or `ppc64`.
          #
          #   @param os [String] The operating system, for example `linux` or `windows`.
          #
          #   @param os_features [Array<String>] Optional field specifying an array of strings, each listing a required
          #
          #   @param os_version [String] Optional field specifying the operating system version, for example on
          #
          #   @param variant [String] Optional field specifying a variant of the CPU, for example `v7` to
        end
      end

      # @see DockerEngineRuby::Models::Image#graph_driver
      class GraphDriver < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute data
        #   Low-level storage metadata, provided as key/value pairs.
        #
        #   This information is driver-specific, and depends on the storage-driver in use,
        #   and should be used for informational purposes only.
        #
        #   @return [Hash{Symbol=>String}]
        required :data, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Data

        # @!attribute name
        #   Name of the storage driver.
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!method initialize(data:, name:)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Image::GraphDriver} for more details.
        #
        #   Information about the storage driver used to store the container's and image's
        #   filesystem.
        #
        #   @param data [Hash{Symbol=>String}] Low-level storage metadata, provided as key/value pairs.
        #
        #   @param name [String] Name of the storage driver.
      end

      # @see DockerEngineRuby::Models::Image#identity
      class Identity < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute build
        #   Build contains build reference information if image was created via build.
        #
        #   @return [Array<DockerEngineRuby::Models::Image::Identity::Build>, nil]
        optional :build,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Identity::Build] },
                 api_name: :Build

        # @!attribute pull
        #   Pull contains remote location information if image was created via pull. If
        #   image was pulled via mirror, this contains the original repository location.
        #   After successful push this images also contains the pushed repository location.
        #
        #   @return [Array<DockerEngineRuby::Models::Image::Identity::Pull>, nil]
        optional :pull,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Identity::Pull] },
                 api_name: :Pull

        # @!attribute signature
        #   Signature contains the properties of verified signatures for the image.
        #
        #   @return [Array<DockerEngineRuby::Models::Image::Identity::Signature>, nil]
        optional :signature,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Identity::Signature]
                 },
                 api_name: :Signature

        # @!method initialize(build: nil, pull: nil, signature: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Image::Identity} for more details.
        #
        #   Identity holds information about the identity and origin of the image. This is
        #   trusted information verified by the daemon and cannot be modified by tagging an
        #   image to a different name.
        #
        #   @param build [Array<DockerEngineRuby::Models::Image::Identity::Build>] Build contains build reference information if image was created via build.
        #
        #   @param pull [Array<DockerEngineRuby::Models::Image::Identity::Pull>] Pull contains remote location information if image was created via pull.
        #
        #   @param signature [Array<DockerEngineRuby::Models::Image::Identity::Signature>] Signature contains the properties of verified signatures for the image.

        class Build < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute created_at
          #   CreatedAt is the time when the build ran.
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :CreatedAt

          # @!attribute ref
          #   Ref is the identifier for the build request. This reference can be used to look
          #   up the build details in BuildKit history API.
          #
          #   @return [String, nil]
          optional :ref, String, api_name: :Ref

          # @!method initialize(created_at: nil, ref: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Identity::Build} for more details.
          #
          #   BuildIdentity contains build reference information if image was created via
          #   build.
          #
          #   @param created_at [Time] CreatedAt is the time when the build ran.
          #
          #   @param ref [String] Ref is the identifier for the build request. This reference can be used to
        end

        class Pull < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute repository
          #   Repository is the remote repository location the image was pulled from.
          #
          #   @return [String, nil]
          optional :repository, String, api_name: :Repository

          # @!method initialize(repository: nil)
          #   PullIdentity contains remote location information if image was created via pull.
          #   If image was pulled via mirror, this contains the original repository location.
          #
          #   @param repository [String] Repository is the remote repository location the image was pulled from.
        end

        class Signature < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute docker_reference
          #   DockerReference is the Docker image reference associated with the signature.
          #   This is an optional field only present in older hashedrecord signatures.
          #
          #   @return [String, nil]
          optional :docker_reference, String, api_name: :DockerReference

          # @!attribute error
          #   Error contains error information if signature verification failed. Other fields
          #   will be empty in this case.
          #
          #   @return [String, nil]
          optional :error, String, api_name: :Error

          # @!attribute known_signer
          #   KnownSignerIdentity is an identifier for a special signer identity that is known
          #   to the implementation.
          #
          #   @return [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::KnownSigner, nil]
          optional :known_signer,
                   enum: -> { DockerEngineRuby::Image::Identity::Signature::KnownSigner },
                   api_name: :KnownSigner

          # @!attribute name
          #   Name is a textual description summarizing the type of signature.
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute signature_type
          #   SignatureType is the type of signature format.
          #
          #   @return [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::SignatureType, nil]
          optional :signature_type,
                   enum: -> { DockerEngineRuby::Image::Identity::Signature::SignatureType },
                   api_name: :SignatureType

          # @!attribute signer
          #   SignerIdentity contains information about the signer certificate used to sign
          #   the image.
          #
          #   @return [DockerEngineRuby::Models::Image::Identity::Signature::Signer, nil]
          optional :signer, -> { DockerEngineRuby::Image::Identity::Signature::Signer }, api_name: :Signer

          # @!attribute timestamps
          #   Timestamps contains a list of verified signed timestamps for the signature.
          #
          #   @return [Array<DockerEngineRuby::Models::Image::Identity::Signature::Timestamp>, nil]
          optional :timestamps,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Identity::Signature::Timestamp]
                   },
                   api_name: :Timestamps

          # @!attribute warnings
          #   Warnings contains any warnings that occurred during signature verification. For
          #   example, if there was no internet connectivity and cached trust roots were used.
          #   Warning does not indicate a failed verification but may point to configuration
          #   issues.
          #
          #   @return [Array<String>, nil]
          optional :warnings, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Warnings

          # @!method initialize(docker_reference: nil, error: nil, known_signer: nil, name: nil, signature_type: nil, signer: nil, timestamps: nil, warnings: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Identity::Signature} for more details.
          #
          #   SignatureIdentity contains the properties of verified signatures for the image.
          #
          #   @param docker_reference [String] DockerReference is the Docker image reference associated with the signature.
          #
          #   @param error [String] Error contains error information if signature verification failed.
          #
          #   @param known_signer [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::KnownSigner] KnownSignerIdentity is an identifier for a special signer identity that is known
          #
          #   @param name [String] Name is a textual description summarizing the type of signature.
          #
          #   @param signature_type [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::SignatureType] SignatureType is the type of signature format.
          #
          #   @param signer [DockerEngineRuby::Models::Image::Identity::Signature::Signer] SignerIdentity contains information about the signer certificate used to sign th
          #
          #   @param timestamps [Array<DockerEngineRuby::Models::Image::Identity::Signature::Timestamp>] Timestamps contains a list of verified signed timestamps for the signature.
          #
          #   @param warnings [Array<String>] Warnings contains any warnings that occurred during signature verification.

          # KnownSignerIdentity is an identifier for a special signer identity that is known
          # to the implementation.
          #
          # @see DockerEngineRuby::Models::Image::Identity::Signature#known_signer
          module KnownSigner
            extend DockerEngineRuby::Internal::Type::Enum

            DHI = :DHI

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # SignatureType is the type of signature format.
          #
          # @see DockerEngineRuby::Models::Image::Identity::Signature#signature_type
          module SignatureType
            extend DockerEngineRuby::Internal::Type::Enum

            BUNDLE_V0_3 = :"bundle-v0.3"
            SIMPLESIGNING_V1 = :"simplesigning-v1"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see DockerEngineRuby::Models::Image::Identity::Signature#signer
          class Signer < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute build_config_digest
            #   Immutable reference to the specific version of the top-level/initiating build
            #   instructions.
            #
            #   @return [String, nil]
            optional :build_config_digest, String, api_name: :BuildConfigDigest

            # @!attribute build_config_uri
            #   Build Config URL to the top-level/initiating build instructions.
            #
            #   @return [String, nil]
            optional :build_config_uri, String, api_name: :BuildConfigURI

            # @!attribute build_signer_digest
            #   Immutable reference to the specific version of the build instructions that is
            #   responsible for signing.
            #
            #   @return [String, nil]
            optional :build_signer_digest, String, api_name: :BuildSignerDigest

            # @!attribute build_signer_uri
            #   Reference to specific build instructions that are responsible for signing.
            #
            #   @return [String, nil]
            optional :build_signer_uri, String, api_name: :BuildSignerURI

            # @!attribute build_trigger
            #   Event or action that initiated the build.
            #
            #   @return [String, nil]
            optional :build_trigger, String, api_name: :BuildTrigger

            # @!attribute certificate_issuer
            #   CertificateIssuer is the certificate issuer.
            #
            #   @return [String, nil]
            optional :certificate_issuer, String, api_name: :CertificateIssuer

            # @!attribute issuer
            #   The OIDC issuer. Should match `iss` claim of ID token or, in the case of a
            #   federated login like Dex it should match the issuer URL of the upstream issuer.
            #   The issuer is not set the extensions are invalid and will fail to render.
            #
            #   @return [String, nil]
            optional :issuer, String, api_name: :Issuer

            # @!attribute run_invocation_uri
            #   Run Invocation URL to uniquely identify the build execution.
            #
            #   @return [String, nil]
            optional :run_invocation_uri, String, api_name: :RunInvocationURI

            # @!attribute runner_environment
            #   Specifies whether the build took place in platform-hosted cloud infrastructure
            #   or customer/self-hosted infrastructure.
            #
            #   @return [String, nil]
            optional :runner_environment, String, api_name: :RunnerEnvironment

            # @!attribute source_repository_digest
            #   Immutable reference to a specific version of the source code that the build was
            #   based upon.
            #
            #   @return [String, nil]
            optional :source_repository_digest, String, api_name: :SourceRepositoryDigest

            # @!attribute source_repository_identifier
            #   Immutable identifier for the source repository the workflow was based upon.
            #
            #   @return [String, nil]
            optional :source_repository_identifier, String, api_name: :SourceRepositoryIdentifier

            # @!attribute source_repository_owner_identifier
            #   Immutable identifier for the owner of the source repository that the workflow
            #   was based upon.
            #
            #   @return [String, nil]
            optional :source_repository_owner_identifier, String, api_name: :SourceRepositoryOwnerIdentifier

            # @!attribute source_repository_owner_uri
            #   Source repository owner URL of the owner of the source repository that the build
            #   was based on.
            #
            #   @return [String, nil]
            optional :source_repository_owner_uri, String, api_name: :SourceRepositoryOwnerURI

            # @!attribute source_repository_ref
            #   Source Repository Ref that the build run was based upon.
            #
            #   @return [String, nil]
            optional :source_repository_ref, String, api_name: :SourceRepositoryRef

            # @!attribute source_repository_uri
            #   Source repository URL that the build was based on.
            #
            #   @return [String, nil]
            optional :source_repository_uri, String, api_name: :SourceRepositoryURI

            # @!attribute source_repository_visibility_at_signing
            #   Source repository visibility at the time of signing the certificate.
            #
            #   @return [String, nil]
            optional :source_repository_visibility_at_signing,
                     String,
                     api_name: :SourceRepositoryVisibilityAtSigning

            # @!attribute subject_alternative_name
            #   SubjectAlternativeName is the certificate subject alternative name.
            #
            #   @return [String, nil]
            optional :subject_alternative_name, String, api_name: :SubjectAlternativeName

            # @!method initialize(build_config_digest: nil, build_config_uri: nil, build_signer_digest: nil, build_signer_uri: nil, build_trigger: nil, certificate_issuer: nil, issuer: nil, run_invocation_uri: nil, runner_environment: nil, source_repository_digest: nil, source_repository_identifier: nil, source_repository_owner_identifier: nil, source_repository_owner_uri: nil, source_repository_ref: nil, source_repository_uri: nil, source_repository_visibility_at_signing: nil, subject_alternative_name: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineRuby::Models::Image::Identity::Signature::Signer} for more details.
            #
            #   SignerIdentity contains information about the signer certificate used to sign
            #   the image.
            #
            #   @param build_config_digest [String] Immutable reference to the specific version of the top-level/initiating build in
            #
            #   @param build_config_uri [String] Build Config URL to the top-level/initiating build instructions.
            #
            #   @param build_signer_digest [String] Immutable reference to the specific version of the build instructions that is re
            #
            #   @param build_signer_uri [String] Reference to specific build instructions that are responsible for signing.
            #
            #   @param build_trigger [String] Event or action that initiated the build.
            #
            #   @param certificate_issuer [String] CertificateIssuer is the certificate issuer.
            #
            #   @param issuer [String] The OIDC issuer. Should match `iss` claim of ID token or, in the case of
            #
            #   @param run_invocation_uri [String] Run Invocation URL to uniquely identify the build execution.
            #
            #   @param runner_environment [String] Specifies whether the build took place in platform-hosted cloud infrastructure o
            #
            #   @param source_repository_digest [String] Immutable reference to a specific version of the source code that the build was
            #
            #   @param source_repository_identifier [String] Immutable identifier for the source repository the workflow was based upon.
            #
            #   @param source_repository_owner_identifier [String] Immutable identifier for the owner of the source repository that the workflow wa
            #
            #   @param source_repository_owner_uri [String] Source repository owner URL of the owner of the source repository that the build
            #
            #   @param source_repository_ref [String] Source Repository Ref that the build run was based upon.
            #
            #   @param source_repository_uri [String] Source repository URL that the build was based on.
            #
            #   @param source_repository_visibility_at_signing [String] Source repository visibility at the time of signing the certificate.
            #
            #   @param subject_alternative_name [String] SubjectAlternativeName is the certificate subject alternative name.
          end

          class Timestamp < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute timestamp
            #
            #   @return [Time, nil]
            optional :timestamp, Time, api_name: :Timestamp

            # @!attribute type
            #   SignatureTimestampType is the type of timestamp used in the signature.
            #
            #   @return [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::Timestamp::Type, nil]
            optional :type,
                     enum: -> { DockerEngineRuby::Image::Identity::Signature::Timestamp::Type },
                     api_name: :Type

            # @!attribute uri
            #
            #   @return [String, nil]
            optional :uri, String, api_name: :URI

            # @!method initialize(timestamp: nil, type: nil, uri: nil)
            #   SignatureTimestamp contains information about a verified signed timestamp for an
            #   image signature.
            #
            #   @param timestamp [Time]
            #
            #   @param type [Symbol, DockerEngineRuby::Models::Image::Identity::Signature::Timestamp::Type] SignatureTimestampType is the type of timestamp used in the signature.
            #
            #   @param uri [String]

            # SignatureTimestampType is the type of timestamp used in the signature.
            #
            # @see DockerEngineRuby::Models::Image::Identity::Signature::Timestamp#type
            module Type
              extend DockerEngineRuby::Internal::Type::Enum

              TLOG = :Tlog
              TIMESTAMP_AUTHORITY = :TimestampAuthority

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      class Manifest < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute available
        #   Indicates whether all the child content (image config, layers) is fully
        #   available locally.
        #
        #   @return [Boolean]
        required :available, DockerEngineRuby::Internal::Type::Boolean, api_name: :Available

        # @!attribute descriptor
        #   A descriptor struct containing digest, media type, and size, as defined in the
        #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        #
        #   @return [DockerEngineRuby::Models::Image::Manifest::Descriptor]
        required :descriptor, -> { DockerEngineRuby::Image::Manifest::Descriptor }, api_name: :Descriptor

        # @!attribute id
        #   ID is the content-addressable ID of an image and is the same as the digest of
        #   the image manifest.
        #
        #   @return [String]
        required :id, String, api_name: :ID

        # @!attribute kind
        #   The kind of the manifest.
        #
        #   | kind        | description                                                                          |
        #   | ----------- | ------------------------------------------------------------------------------------ |
        #   | image       | Image manifest that can be used to start a container.                                |
        #   | attestation | Attestation manifest produced by the Buildkit builder for a specific image manifest. |
        #
        #   @return [Symbol, DockerEngineRuby::Models::Image::Manifest::Kind]
        required :kind, enum: -> { DockerEngineRuby::Image::Manifest::Kind }, api_name: :Kind

        # @!attribute size
        #
        #   @return [DockerEngineRuby::Models::Image::Manifest::Size]
        required :size, -> { DockerEngineRuby::Image::Manifest::Size }, api_name: :Size

        # @!attribute attestation_data
        #   The image data for the attestation manifest. This field is only populated when
        #   Kind is "attestation".
        #
        #   @return [DockerEngineRuby::Models::Image::Manifest::AttestationData, nil]
        optional :attestation_data,
                 -> { DockerEngineRuby::Image::Manifest::AttestationData },
                 api_name: :AttestationData,
                 nil?: true

        # @!attribute image_data
        #   The image data for the image manifest. This field is only populated when Kind is
        #   "image".
        #
        #   @return [DockerEngineRuby::Models::Image::Manifest::ImageData, nil]
        optional :image_data,
                 -> { DockerEngineRuby::Image::Manifest::ImageData },
                 api_name: :ImageData,
                 nil?: true

        # @!method initialize(available:, descriptor:, id:, kind:, size:, attestation_data: nil, image_data: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Image::Manifest} for more details.
        #
        #   ImageManifestSummary represents a summary of an image manifest.
        #
        #   @param available [Boolean] Indicates whether all the child content (image config, layers) is fully availabl
        #
        #   @param descriptor [DockerEngineRuby::Models::Image::Manifest::Descriptor] A descriptor struct containing digest, media type, and size, as defined in
        #
        #   @param id [String] ID is the content-addressable ID of an image and is the same as the
        #
        #   @param kind [Symbol, DockerEngineRuby::Models::Image::Manifest::Kind] The kind of the manifest.
        #
        #   @param size [DockerEngineRuby::Models::Image::Manifest::Size]
        #
        #   @param attestation_data [DockerEngineRuby::Models::Image::Manifest::AttestationData, nil] The image data for the attestation manifest.
        #
        #   @param image_data [DockerEngineRuby::Models::Image::Manifest::ImageData, nil] The image data for the image manifest.

        # @see DockerEngineRuby::Models::Image::Manifest#descriptor
        class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute annotations
          #   Arbitrary metadata relating to the targeted content.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :annotations, DockerEngineRuby::Internal::Type::HashOf[String], nil?: true

          # @!attribute artifact_type
          #   ArtifactType is the IANA media type of this artifact.
          #
          #   @return [String, nil]
          optional :artifact_type, String, api_name: :artifactType, nil?: true

          # @!attribute data
          #   Data is an embedding of the targeted content. This is encoded as a base64 string
          #   when marshalled to JSON (automatically, by encoding/json). If present, Data can
          #   be used directly to avoid fetching the targeted content.
          #
          #   @return [String, nil]
          optional :data, String, nil?: true

          # @!attribute digest
          #   The digest of the targeted content.
          #
          #   @return [String, nil]
          optional :digest, String

          # @!attribute media_type
          #   The media type of the object this schema refers to.
          #
          #   @return [String, nil]
          optional :media_type, String, api_name: :mediaType

          # @!attribute platform
          #   Describes the platform which the image in the manifest runs on, as defined in
          #   the
          #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          #
          #   @return [DockerEngineRuby::Models::Image::Manifest::Descriptor::Platform, nil]
          optional :platform, -> { DockerEngineRuby::Image::Manifest::Descriptor::Platform }

          # @!attribute size
          #   The size in bytes of the blob.
          #
          #   @return [Integer, nil]
          optional :size, Integer

          # @!attribute urls
          #   List of URLs from which this object MAY be downloaded.
          #
          #   @return [Array<String>, nil]
          optional :urls, DockerEngineRuby::Internal::Type::ArrayOf[String], nil?: true

          # @!method initialize(annotations: nil, artifact_type: nil, data: nil, digest: nil, media_type: nil, platform: nil, size: nil, urls: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Manifest::Descriptor} for more details.
          #
          #   A descriptor struct containing digest, media type, and size, as defined in the
          #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
          #
          #   @param annotations [Hash{Symbol=>String}, nil] Arbitrary metadata relating to the targeted content.
          #
          #   @param artifact_type [String, nil] ArtifactType is the IANA media type of this artifact.
          #
          #   @param data [String, nil] Data is an embedding of the targeted content. This is encoded as a base64
          #
          #   @param digest [String] The digest of the targeted content.
          #
          #   @param media_type [String] The media type of the object this schema refers to.
          #
          #   @param platform [DockerEngineRuby::Models::Image::Manifest::Descriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
          #
          #   @param size [Integer] The size in bytes of the blob.
          #
          #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

          # @see DockerEngineRuby::Models::Image::Manifest::Descriptor#platform
          class Platform < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute architecture
            #   The CPU architecture, for example `amd64` or `ppc64`.
            #
            #   @return [String, nil]
            optional :architecture, String

            # @!attribute os
            #   The operating system, for example `linux` or `windows`.
            #
            #   @return [String, nil]
            optional :os, String

            # @!attribute os_features
            #   Optional field specifying an array of strings, each listing a required OS
            #   feature (for example on Windows `win32k`).
            #
            #   @return [Array<String>, nil]
            optional :os_features, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :"os.features"

            # @!attribute os_version
            #   Optional field specifying the operating system version, for example on Windows
            #   `10.0.19041.1165`.
            #
            #   @return [String, nil]
            optional :os_version, String, api_name: :"os.version"

            # @!attribute variant
            #   Optional field specifying a variant of the CPU, for example `v7` to specify
            #   ARMv7 when architecture is `arm`.
            #
            #   @return [String, nil]
            optional :variant, String

            # @!method initialize(architecture: nil, os: nil, os_features: nil, os_version: nil, variant: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineRuby::Models::Image::Manifest::Descriptor::Platform} for more
            #   details.
            #
            #   Describes the platform which the image in the manifest runs on, as defined in
            #   the
            #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            #
            #   @param architecture [String] The CPU architecture, for example `amd64` or `ppc64`.
            #
            #   @param os [String] The operating system, for example `linux` or `windows`.
            #
            #   @param os_features [Array<String>] Optional field specifying an array of strings, each listing a required
            #
            #   @param os_version [String] Optional field specifying the operating system version, for example on
            #
            #   @param variant [String] Optional field specifying a variant of the CPU, for example `v7` to
          end
        end

        # The kind of the manifest.
        #
        # | kind        | description                                                                          |
        # | ----------- | ------------------------------------------------------------------------------------ |
        # | image       | Image manifest that can be used to start a container.                                |
        # | attestation | Attestation manifest produced by the Buildkit builder for a specific image manifest. |
        #
        # @see DockerEngineRuby::Models::Image::Manifest#kind
        module Kind
          extend DockerEngineRuby::Internal::Type::Enum

          IMAGE = :image
          ATTESTATION = :attestation
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see DockerEngineRuby::Models::Image::Manifest#size
        class Size < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute content
          #
          #   @return [Integer]
          required :content, Integer, api_name: :Content

          # @!attribute total
          #
          #   @return [Integer]
          required :total, Integer, api_name: :Total

          # @!method initialize(content:, total:)
          #   @param content [Integer]
          #   @param total [Integer]
        end

        # @see DockerEngineRuby::Models::Image::Manifest#attestation_data
        class AttestationData < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute for_
          #
          #   @return [String]
          required :for_, String, api_name: :For

          # @!method initialize(for_:)
          #   The image data for the attestation manifest. This field is only populated when
          #   Kind is "attestation".
          #
          #   @param for_ [String]
        end

        # @see DockerEngineRuby::Models::Image::Manifest#image_data
        class ImageData < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute containers
          #
          #   @return [Array<String>]
          required :containers, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Containers

          # @!attribute platform
          #   Describes the platform which the image in the manifest runs on, as defined in
          #   the
          #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          #
          #   @return [DockerEngineRuby::Models::Image::Manifest::ImageData::Platform]
          required :platform,
                   -> {
                     DockerEngineRuby::Image::Manifest::ImageData::Platform
                   },
                   api_name: :Platform

          # @!attribute size
          #
          #   @return [DockerEngineRuby::Models::Image::Manifest::ImageData::Size]
          required :size, -> { DockerEngineRuby::Image::Manifest::ImageData::Size }, api_name: :Size

          # @!method initialize(containers:, platform:, size:)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::Image::Manifest::ImageData} for more details.
          #
          #   The image data for the image manifest. This field is only populated when Kind is
          #   "image".
          #
          #   @param containers [Array<String>]
          #
          #   @param platform [DockerEngineRuby::Models::Image::Manifest::ImageData::Platform] Describes the platform which the image in the manifest runs on, as defined
          #
          #   @param size [DockerEngineRuby::Models::Image::Manifest::ImageData::Size]

          # @see DockerEngineRuby::Models::Image::Manifest::ImageData#platform
          class Platform < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute architecture
            #   The CPU architecture, for example `amd64` or `ppc64`.
            #
            #   @return [String, nil]
            optional :architecture, String

            # @!attribute os
            #   The operating system, for example `linux` or `windows`.
            #
            #   @return [String, nil]
            optional :os, String

            # @!attribute os_features
            #   Optional field specifying an array of strings, each listing a required OS
            #   feature (for example on Windows `win32k`).
            #
            #   @return [Array<String>, nil]
            optional :os_features, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :"os.features"

            # @!attribute os_version
            #   Optional field specifying the operating system version, for example on Windows
            #   `10.0.19041.1165`.
            #
            #   @return [String, nil]
            optional :os_version, String, api_name: :"os.version"

            # @!attribute variant
            #   Optional field specifying a variant of the CPU, for example `v7` to specify
            #   ARMv7 when architecture is `arm`.
            #
            #   @return [String, nil]
            optional :variant, String

            # @!method initialize(architecture: nil, os: nil, os_features: nil, os_version: nil, variant: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineRuby::Models::Image::Manifest::ImageData::Platform} for more
            #   details.
            #
            #   Describes the platform which the image in the manifest runs on, as defined in
            #   the
            #   [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
            #
            #   @param architecture [String] The CPU architecture, for example `amd64` or `ppc64`.
            #
            #   @param os [String] The operating system, for example `linux` or `windows`.
            #
            #   @param os_features [Array<String>] Optional field specifying an array of strings, each listing a required
            #
            #   @param os_version [String] Optional field specifying the operating system version, for example on
            #
            #   @param variant [String] Optional field specifying a variant of the CPU, for example `v7` to
          end

          # @see DockerEngineRuby::Models::Image::Manifest::ImageData#size
          class Size < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute unpacked
            #
            #   @return [Integer]
            required :unpacked, Integer, api_name: :Unpacked

            # @!method initialize(unpacked:)
            #   @param unpacked [Integer]
          end
        end
      end

      # @see DockerEngineRuby::Models::Image#metadata
      class Metadata < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute last_tag_time
        #
        #   @return [Time, nil]
        optional :last_tag_time, Time, api_name: :LastTagTime, nil?: true

        # @!method initialize(last_tag_time: nil)
        #   Additional metadata of the image in the local cache. This information is local
        #   to the daemon, and not part of the image itself.
        #
        #   @param last_tag_time [Time, nil]
      end

      # @see DockerEngineRuby::Models::Image#root_fs
      class RootFs < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [String]
        required :type, String, api_name: :Type

        # @!attribute layers
        #
        #   @return [Array<String>, nil]
        optional :layers, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Layers

        # @!method initialize(type:, layers: nil)
        #   Information about the image's RootFS, including the layer IDs.
        #
        #   @param type [String]
        #   @param layers [Array<String>]
      end
    end
  end
end
