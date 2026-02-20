# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Distribution#inspect_
    class Inspect < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute descriptor
      #   A descriptor struct containing digest, media type, and size, as defined in the
      #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      #
      #   @return [DockerEngineRuby::Models::Inspect::Descriptor]
      required :descriptor, -> { DockerEngineRuby::Inspect::Descriptor }, api_name: :Descriptor

      # @!attribute platforms
      #   An array containing all platforms supported by the image.
      #
      #   @return [Array<DockerEngineRuby::Models::Inspect::Platform>]
      required :platforms,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Inspect::Platform] },
               api_name: :Platforms

      # @!method initialize(descriptor:, platforms:)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Inspect} for more details.
      #
      #   Describes the result obtained from contacting the registry to retrieve image
      #   metadata.
      #
      #   @param descriptor [DockerEngineRuby::Models::Inspect::Descriptor] A descriptor struct containing digest, media type, and size, as defined in
      #
      #   @param platforms [Array<DockerEngineRuby::Models::Inspect::Platform>] An array containing all platforms supported by the image.

      # @see DockerEngineRuby::Models::Inspect#descriptor
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
        #   @return [DockerEngineRuby::Models::Inspect::Descriptor::Platform, nil]
        optional :platform, -> { DockerEngineRuby::Inspect::Descriptor::Platform }

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
        #   {DockerEngineRuby::Models::Inspect::Descriptor} for more details.
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
        #   @param platform [DockerEngineRuby::Models::Inspect::Descriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
        #
        #   @param size [Integer] The size in bytes of the blob.
        #
        #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

        # @see DockerEngineRuby::Models::Inspect::Descriptor#platform
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
          #   {DockerEngineRuby::Models::Inspect::Descriptor::Platform} for more details.
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
        #   {DockerEngineRuby::Models::Inspect::Platform} for more details.
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
  end
end
