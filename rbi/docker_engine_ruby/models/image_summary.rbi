# typed: strong

module DockerEngineRuby
  module Models
    class ImageSummary < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageSummary,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Number of containers using this image. Includes both stopped and running
      # containers.
      #
      # `-1` indicates that the value has not been set / calculated.
      sig { returns(Integer) }
      attr_accessor :containers

      # Date and time at which the image was created as a Unix timestamp (number of
      # seconds since EPOCH).
      sig { returns(Integer) }
      attr_accessor :created

      # ID is the content-addressable ID of an image.
      #
      # This identifier is a content-addressable digest calculated from the image's
      # configuration (which includes the digests of layers used by the image).
      #
      # Note that this digest differs from the `RepoDigests` below, which holds digests
      # of image manifests that reference the image.
      sig { returns(String) }
      attr_accessor :id

      # User-defined key/value metadata.
      sig { returns(T::Hash[Symbol, String]) }
      attr_accessor :labels

      # ID of the parent image.
      #
      # Depending on how the image was created, this field may be empty and is only set
      # for images that were built/created locally. This field is empty if the image was
      # pulled from an image registry.
      sig { returns(String) }
      attr_accessor :parent_id

      # List of content-addressable digests of locally available image manifests that
      # the image is referenced from. Multiple manifests can refer to the same image.
      #
      # These digests are usually only available if the image was either pulled from a
      # registry, or if the image was pushed to a registry, which is when the manifest
      # is generated and its digest calculated.
      sig { returns(T::Array[String]) }
      attr_accessor :repo_digests

      # List of image names/tags in the local image cache that reference this image.
      #
      # Multiple image tags can refer to the same image, and this list may be empty if
      # no tags reference the image, in which case the image is "untagged", in which
      # case it can still be referenced by its ID.
      sig { returns(T::Array[String]) }
      attr_accessor :repo_tags

      # Total size of image layers that are shared between this image and other images.
      #
      # This size is not calculated by default. `-1` indicates that the value has not
      # been set / calculated.
      sig { returns(Integer) }
      attr_accessor :shared_size

      # Total size of the image including all layers it is composed of.
      sig { returns(Integer) }
      attr_accessor :size

      # A descriptor struct containing digest, media type, and size, as defined in the
      # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      sig { returns(T.nilable(DockerEngineRuby::ImageSummary::Descriptor)) }
      attr_reader :descriptor

      sig do
        params(
          descriptor:
            T.nilable(DockerEngineRuby::ImageSummary::Descriptor::OrHash)
        ).void
      end
      attr_writer :descriptor

      # Manifests is a list of manifests available in this image. It provides a more
      # detailed view of the platform-specific image manifests or other image-attached
      # data like build attestations.
      #
      # WARNING: This is experimental and may change at any time without any backward
      # compatibility.
      sig do
        returns(T.nilable(T::Array[DockerEngineRuby::ImageSummary::Manifest]))
      end
      attr_reader :manifests

      sig do
        params(
          manifests: T::Array[DockerEngineRuby::ImageSummary::Manifest::OrHash]
        ).void
      end
      attr_writer :manifests

      sig do
        params(
          containers: Integer,
          created: Integer,
          id: String,
          labels: T::Hash[Symbol, String],
          parent_id: String,
          repo_digests: T::Array[String],
          repo_tags: T::Array[String],
          shared_size: Integer,
          size: Integer,
          descriptor:
            T.nilable(DockerEngineRuby::ImageSummary::Descriptor::OrHash),
          manifests: T::Array[DockerEngineRuby::ImageSummary::Manifest::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of containers using this image. Includes both stopped and running
        # containers.
        #
        # `-1` indicates that the value has not been set / calculated.
        containers:,
        # Date and time at which the image was created as a Unix timestamp (number of
        # seconds since EPOCH).
        created:,
        # ID is the content-addressable ID of an image.
        #
        # This identifier is a content-addressable digest calculated from the image's
        # configuration (which includes the digests of layers used by the image).
        #
        # Note that this digest differs from the `RepoDigests` below, which holds digests
        # of image manifests that reference the image.
        id:,
        # User-defined key/value metadata.
        labels:,
        # ID of the parent image.
        #
        # Depending on how the image was created, this field may be empty and is only set
        # for images that were built/created locally. This field is empty if the image was
        # pulled from an image registry.
        parent_id:,
        # List of content-addressable digests of locally available image manifests that
        # the image is referenced from. Multiple manifests can refer to the same image.
        #
        # These digests are usually only available if the image was either pulled from a
        # registry, or if the image was pushed to a registry, which is when the manifest
        # is generated and its digest calculated.
        repo_digests:,
        # List of image names/tags in the local image cache that reference this image.
        #
        # Multiple image tags can refer to the same image, and this list may be empty if
        # no tags reference the image, in which case the image is "untagged", in which
        # case it can still be referenced by its ID.
        repo_tags:,
        # Total size of image layers that are shared between this image and other images.
        #
        # This size is not calculated by default. `-1` indicates that the value has not
        # been set / calculated.
        shared_size:,
        # Total size of the image including all layers it is composed of.
        size:,
        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        descriptor: nil,
        # Manifests is a list of manifests available in this image. It provides a more
        # detailed view of the platform-specific image manifests or other image-attached
        # data like build attestations.
        #
        # WARNING: This is experimental and may change at any time without any backward
        # compatibility.
        manifests: nil
      )
      end

      sig do
        override.returns(
          {
            containers: Integer,
            created: Integer,
            id: String,
            labels: T::Hash[Symbol, String],
            parent_id: String,
            repo_digests: T::Array[String],
            repo_tags: T::Array[String],
            shared_size: Integer,
            size: Integer,
            descriptor: T.nilable(DockerEngineRuby::ImageSummary::Descriptor),
            manifests: T::Array[DockerEngineRuby::ImageSummary::Manifest]
          }
        )
      end
      def to_hash
      end

      class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ImageSummary::Descriptor,
              DockerEngineRuby::Internal::AnyHash
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
            T.nilable(DockerEngineRuby::ImageSummary::Descriptor::Platform)
          )
        end
        attr_reader :platform

        sig do
          params(
            platform:
              DockerEngineRuby::ImageSummary::Descriptor::Platform::OrHash
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
              DockerEngineRuby::ImageSummary::Descriptor::Platform::OrHash,
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
              platform: DockerEngineRuby::ImageSummary::Descriptor::Platform,
              size: Integer,
              urls: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end

        class Platform < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ImageSummary::Descriptor::Platform,
                DockerEngineRuby::Internal::AnyHash
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

      class Manifest < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ImageSummary::Manifest,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Indicates whether all the child content (image config, layers) is fully
        # available locally.
        sig { returns(T::Boolean) }
        attr_accessor :available

        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        sig { returns(DockerEngineRuby::ImageSummary::Manifest::Descriptor) }
        attr_reader :descriptor

        sig do
          params(
            descriptor:
              DockerEngineRuby::ImageSummary::Manifest::Descriptor::OrHash
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
        sig do
          returns(DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol)
        end
        attr_accessor :kind

        sig { returns(DockerEngineRuby::ImageSummary::Manifest::Size) }
        attr_reader :size

        sig do
          params(
            size: DockerEngineRuby::ImageSummary::Manifest::Size::OrHash
          ).void
        end
        attr_writer :size

        # The image data for the attestation manifest. This field is only populated when
        # Kind is "attestation".
        sig do
          returns(
            T.nilable(DockerEngineRuby::ImageSummary::Manifest::AttestationData)
          )
        end
        attr_reader :attestation_data

        sig do
          params(
            attestation_data:
              T.nilable(
                DockerEngineRuby::ImageSummary::Manifest::AttestationData::OrHash
              )
          ).void
        end
        attr_writer :attestation_data

        # The image data for the image manifest. This field is only populated when Kind is
        # "image".
        sig do
          returns(
            T.nilable(DockerEngineRuby::ImageSummary::Manifest::ImageData)
          )
        end
        attr_reader :image_data

        sig do
          params(
            image_data:
              T.nilable(
                DockerEngineRuby::ImageSummary::Manifest::ImageData::OrHash
              )
          ).void
        end
        attr_writer :image_data

        # ImageManifestSummary represents a summary of an image manifest.
        sig do
          params(
            available: T::Boolean,
            descriptor:
              DockerEngineRuby::ImageSummary::Manifest::Descriptor::OrHash,
            id: String,
            kind: DockerEngineRuby::ImageSummary::Manifest::Kind::OrSymbol,
            size: DockerEngineRuby::ImageSummary::Manifest::Size::OrHash,
            attestation_data:
              T.nilable(
                DockerEngineRuby::ImageSummary::Manifest::AttestationData::OrHash
              ),
            image_data:
              T.nilable(
                DockerEngineRuby::ImageSummary::Manifest::ImageData::OrHash
              )
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
              descriptor: DockerEngineRuby::ImageSummary::Manifest::Descriptor,
              id: String,
              kind:
                DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol,
              size: DockerEngineRuby::ImageSummary::Manifest::Size,
              attestation_data:
                T.nilable(
                  DockerEngineRuby::ImageSummary::Manifest::AttestationData
                ),
              image_data:
                T.nilable(DockerEngineRuby::ImageSummary::Manifest::ImageData)
            }
          )
        end
        def to_hash
        end

        class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ImageSummary::Manifest::Descriptor,
                DockerEngineRuby::Internal::AnyHash
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
              T.nilable(
                DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform
              )
            )
          end
          attr_reader :platform

          sig do
            params(
              platform:
                DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform::OrHash
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
                DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform::OrHash,
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
                  DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform,
                size: Integer,
                urls: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end

          class Platform < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::ImageSummary::Manifest::Descriptor::Platform,
                  DockerEngineRuby::Internal::AnyHash
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
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::ImageSummary::Manifest::Kind)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(
              :image,
              DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol
            )
          ATTESTATION =
            T.let(
              :attestation,
              DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol
            )
          UNKNOWN =
            T.let(
              :unknown,
              DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::ImageSummary::Manifest::Kind::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Size < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ImageSummary::Manifest::Size,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :content

          sig { returns(Integer) }
          attr_accessor :total

          sig do
            params(content: Integer, total: Integer).returns(T.attached_class)
          end
          def self.new(content:, total:)
          end

          sig { override.returns({ content: Integer, total: Integer }) }
          def to_hash
          end
        end

        class AttestationData < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ImageSummary::Manifest::AttestationData,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :for_

          # The image data for the attestation manifest. This field is only populated when
          # Kind is "attestation".
          sig { params(for_: String).returns(T.attached_class) }
          def self.new(for_:)
          end

          sig { override.returns({ for_: String }) }
          def to_hash
          end
        end

        class ImageData < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ImageSummary::Manifest::ImageData,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :containers

          # Describes the platform which the image in the manifest runs on, as defined in
          # the
          # [OCI Image Index Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-index.md).
          sig do
            returns(
              DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform
            )
          end
          attr_reader :platform

          sig do
            params(
              platform:
                DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform::OrHash
            ).void
          end
          attr_writer :platform

          sig do
            returns(DockerEngineRuby::ImageSummary::Manifest::ImageData::Size)
          end
          attr_reader :size

          sig do
            params(
              size:
                DockerEngineRuby::ImageSummary::Manifest::ImageData::Size::OrHash
            ).void
          end
          attr_writer :size

          # The image data for the image manifest. This field is only populated when Kind is
          # "image".
          sig do
            params(
              containers: T::Array[String],
              platform:
                DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform::OrHash,
              size:
                DockerEngineRuby::ImageSummary::Manifest::ImageData::Size::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
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
                  DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform,
                size: DockerEngineRuby::ImageSummary::Manifest::ImageData::Size
              }
            )
          end
          def to_hash
          end

          class Platform < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::ImageSummary::Manifest::ImageData::Platform,
                  DockerEngineRuby::Internal::AnyHash
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

          class Size < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::ImageSummary::Manifest::ImageData::Size,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(Integer) }
            attr_accessor :unpacked

            sig { params(unpacked: Integer).returns(T.attached_class) }
            def self.new(unpacked:)
            end

            sig { override.returns({ unpacked: Integer }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
