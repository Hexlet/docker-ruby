# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class ImageSummary < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute containers
      #   Number of containers using this image. Includes both stopped and running
      #   containers.
      #
      #   `-1` indicates that the value has not been set / calculated.
      #
      #   @return [Integer]
      required :containers, Integer, api_name: :Containers

      # @!attribute created
      #   Date and time at which the image was created as a Unix timestamp (number of
      #   seconds since EPOCH).
      #
      #   @return [Integer]
      required :created, Integer, api_name: :Created

      # @!attribute id
      #   ID is the content-addressable ID of an image.
      #
      #   This identifier is a content-addressable digest calculated from the image's
      #   configuration (which includes the digests of layers used by the image).
      #
      #   Note that this digest differs from the `RepoDigests` below, which holds digests
      #   of image manifests that reference the image.
      #
      #   @return [String]
      required :id, String, api_name: :Id

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Object]
      required :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

      # @!attribute parent_id
      #   ID of the parent image.
      #
      #   Depending on how the image was created, this field may be empty and is only set
      #   for images that were built/created locally. This field is empty if the image was
      #   pulled from an image registry.
      #
      #   @return [String]
      required :parent_id, String, api_name: :ParentId

      # @!attribute repo_digests
      #   List of content-addressable digests of locally available image manifests that
      #   the image is referenced from. Multiple manifests can refer to the same image.
      #
      #   These digests are usually only available if the image was either pulled from a
      #   registry, or if the image was pushed to a registry, which is when the manifest
      #   is generated and its digest calculated.
      #
      #   @return [Array<String>]
      required :repo_digests, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RepoDigests

      # @!attribute repo_tags
      #   List of image names/tags in the local image cache that reference this image.
      #
      #   Multiple image tags can refer to the same image, and this list may be empty if
      #   no tags reference the image, in which case the image is "untagged", in which
      #   case it can still be referenced by its ID.
      #
      #   @return [Array<String>]
      required :repo_tags, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RepoTags

      # @!attribute shared_size
      #   Total size of image layers that are shared between this image and other images.
      #
      #   This size is not calculated by default. `-1` indicates that the value has not
      #   been set / calculated.
      #
      #   @return [Integer]
      required :shared_size, Integer, api_name: :SharedSize

      # @!attribute size
      #   Total size of the image including all layers it is composed of.
      #
      #   @return [Integer]
      required :size, Integer, api_name: :Size

      # @!attribute descriptor
      #   A descriptor struct containing digest, media type, and size, as defined in the
      #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      #
      #   @return [DockerEngineRuby::Models::ImageSummary::Descriptor, nil]
      optional :descriptor,
               -> {
                 DockerEngineRuby::ImageSummary::Descriptor
               },
               api_name: :Descriptor,
               nil?: true

      # @!attribute manifests
      #   Manifests is a list of manifests available in this image. It provides a more
      #   detailed view of the platform-specific image manifests or other image-attached
      #   data like build attestations.
      #
      #   WARNING: This is experimental and may change at any time without any backward
      #   compatibility.
      #
      #   @return [Array<DockerEngineRuby::Models::ImageSummary::Manifest>, nil]
      optional :manifests,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ImageSummary::Manifest] },
               api_name: :Manifests

      # @!method initialize(containers:, created:, id:, labels:, parent_id:, repo_digests:, repo_tags:, shared_size:, size:, descriptor: nil, manifests: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImageSummary} for more details.
      #
      #   @param containers [Integer] Number of containers using this image. Includes both stopped and running
      #
      #   @param created [Integer] Date and time at which the image was created as a Unix timestamp
      #
      #   @param id [String] ID is the content-addressable ID of an image.
      #
      #   @param labels [Object] User-defined key/value metadata.
      #
      #   @param parent_id [String] ID of the parent image.
      #
      #   @param repo_digests [Array<String>] List of content-addressable digests of locally available image manifests
      #
      #   @param repo_tags [Array<String>] List of image names/tags in the local image cache that reference this
      #
      #   @param shared_size [Integer] Total size of image layers that are shared between this image and other
      #
      #   @param size [Integer] Total size of the image including all layers it is composed of.
      #
      #   @param descriptor [DockerEngineRuby::Models::ImageSummary::Descriptor, nil] A descriptor struct containing digest, media type, and size, as defined in
      #
      #   @param manifests [Array<DockerEngineRuby::Models::ImageSummary::Manifest>] Manifests is a list of manifests available in this image.

      # @see DockerEngineRuby::Models::ImageSummary#descriptor
      class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute annotations
        #   Arbitrary metadata relating to the targeted content.
        #
        #   @return [Object, nil]
        optional :annotations, DockerEngineRuby::Internal::Type::Unknown, nil?: true

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
        #   @return [DockerEngineRuby::Models::ImageSummary::Descriptor::Platform, nil]
        optional :platform, -> { DockerEngineRuby::ImageSummary::Descriptor::Platform }

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
        #   {DockerEngineRuby::Models::ImageSummary::Descriptor} for more details.
        #
        #   A descriptor struct containing digest, media type, and size, as defined in the
        #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        #
        #   @param annotations [Object, nil] Arbitrary metadata relating to the targeted content.
        #
        #   @param artifact_type [String, nil] ArtifactType is the IANA media type of this artifact.
        #
        #   @param data [String, nil] Data is an embedding of the targeted content. This is encoded as a base64
        #
        #   @param digest [String] The digest of the targeted content.
        #
        #   @param media_type [String] The media type of the object this schema refers to.
        #
        #   @param platform [DockerEngineRuby::Models::ImageSummary::Descriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
        #
        #   @param size [Integer] The size in bytes of the blob.
        #
        #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

        # @see DockerEngineRuby::Models::ImageSummary::Descriptor#platform
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
          #   {DockerEngineRuby::Models::ImageSummary::Descriptor::Platform} for more details.
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
        #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor]
        required :descriptor,
                 -> {
                   DockerEngineRuby::ImageSummary::Manifest::Descriptor
                 },
                 api_name: :Descriptor

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
        #   @return [Symbol, DockerEngineRuby::Models::ImageSummary::Manifest::Kind]
        required :kind, enum: -> { DockerEngineRuby::ImageSummary::Manifest::Kind }, api_name: :Kind

        # @!attribute size
        #
        #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::Size]
        required :size, -> { DockerEngineRuby::ImageSummary::Manifest::Size }, api_name: :Size

        # @!attribute attestation_data
        #   The image data for the attestation manifest. This field is only populated when
        #   Kind is "attestation".
        #
        #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::AttestationData, nil]
        optional :attestation_data,
                 -> { DockerEngineRuby::ImageSummary::Manifest::AttestationData },
                 api_name: :AttestationData,
                 nil?: true

        # @!attribute image_data
        #   The image data for the image manifest. This field is only populated when Kind is
        #   "image".
        #
        #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData, nil]
        optional :image_data,
                 -> { DockerEngineRuby::ImageSummary::Manifest::ImageData },
                 api_name: :ImageData,
                 nil?: true

        # @!method initialize(available:, descriptor:, id:, kind:, size:, attestation_data: nil, image_data: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::ImageSummary::Manifest} for more details.
        #
        #   ImageManifestSummary represents a summary of an image manifest.
        #
        #   @param available [Boolean] Indicates whether all the child content (image config, layers) is fully availabl
        #
        #   @param descriptor [DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor] A descriptor struct containing digest, media type, and size, as defined in
        #
        #   @param id [String] ID is the content-addressable ID of an image and is the same as the
        #
        #   @param kind [Symbol, DockerEngineRuby::Models::ImageSummary::Manifest::Kind] The kind of the manifest.
        #
        #   @param size [DockerEngineRuby::Models::ImageSummary::Manifest::Size]
        #
        #   @param attestation_data [DockerEngineRuby::Models::ImageSummary::Manifest::AttestationData, nil] The image data for the attestation manifest.
        #
        #   @param image_data [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData, nil] The image data for the image manifest.

        # @see DockerEngineRuby::Models::ImageSummary::Manifest#descriptor
        class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute annotations
          #   Arbitrary metadata relating to the targeted content.
          #
          #   @return [Object, nil]
          optional :annotations, DockerEngineRuby::Internal::Type::Unknown, nil?: true

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
          #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor::Platform, nil]
          optional :platform, -> { DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform }

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
          #   {DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor} for more details.
          #
          #   A descriptor struct containing digest, media type, and size, as defined in the
          #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
          #
          #   @param annotations [Object, nil] Arbitrary metadata relating to the targeted content.
          #
          #   @param artifact_type [String, nil] ArtifactType is the IANA media type of this artifact.
          #
          #   @param data [String, nil] Data is an embedding of the targeted content. This is encoded as a base64
          #
          #   @param digest [String] The digest of the targeted content.
          #
          #   @param media_type [String] The media type of the object this schema refers to.
          #
          #   @param platform [DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
          #
          #   @param size [Integer] The size in bytes of the blob.
          #
          #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

          # @see DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor#platform
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
            #   {DockerEngineRuby::Models::ImageSummary::Manifest::Descriptor::Platform} for
            #   more details.
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
        # @see DockerEngineRuby::Models::ImageSummary::Manifest#kind
        module Kind
          extend DockerEngineRuby::Internal::Type::Enum

          IMAGE = :image
          ATTESTATION = :attestation
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see DockerEngineRuby::Models::ImageSummary::Manifest#size
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

        # @see DockerEngineRuby::Models::ImageSummary::Manifest#attestation_data
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

        # @see DockerEngineRuby::Models::ImageSummary::Manifest#image_data
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
          #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData::Platform]
          required :platform,
                   -> { DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform },
                   api_name: :Platform

          # @!attribute size
          #
          #   @return [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData::Size]
          required :size, -> { DockerEngineRuby::ImageSummary::Manifest::ImageData::Size }, api_name: :Size

          # @!method initialize(containers:, platform:, size:)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::ImageSummary::Manifest::ImageData} for more details.
          #
          #   The image data for the image manifest. This field is only populated when Kind is
          #   "image".
          #
          #   @param containers [Array<String>]
          #
          #   @param platform [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData::Platform] Describes the platform which the image in the manifest runs on, as defined
          #
          #   @param size [DockerEngineRuby::Models::ImageSummary::Manifest::ImageData::Size]

          # @see DockerEngineRuby::Models::ImageSummary::Manifest::ImageData#platform
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
            #   {DockerEngineRuby::Models::ImageSummary::Manifest::ImageData::Platform} for more
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

          # @see DockerEngineRuby::Models::ImageSummary::Manifest::ImageData#size
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
    end
  end
end
