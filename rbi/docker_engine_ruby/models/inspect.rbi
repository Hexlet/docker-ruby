# typed: strong

module DockerEngineRuby
  module Models
    class Inspect < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Inspect, DockerEngineRuby::Internal::AnyHash)
        end

      # A descriptor struct containing digest, media type, and size, as defined in the
      # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      sig { returns(DockerEngineRuby::Inspect::Descriptor) }
      attr_reader :descriptor

      sig do
        params(descriptor: DockerEngineRuby::Inspect::Descriptor::OrHash).void
      end
      attr_writer :descriptor

      # An array containing all platforms supported by the image.
      sig { returns(T::Array[DockerEngineRuby::Inspect::Platform]) }
      attr_accessor :platforms

      # Describes the result obtained from contacting the registry to retrieve image
      # metadata.
      sig do
        params(
          descriptor: DockerEngineRuby::Inspect::Descriptor::OrHash,
          platforms: T::Array[DockerEngineRuby::Inspect::Platform::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        descriptor:,
        # An array containing all platforms supported by the image.
        platforms:
      )
      end

      sig do
        override.returns(
          {
            descriptor: DockerEngineRuby::Inspect::Descriptor,
            platforms: T::Array[DockerEngineRuby::Inspect::Platform]
          }
        )
      end
      def to_hash
      end

      class Descriptor < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Inspect::Descriptor,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Arbitrary metadata relating to the targeted content.
        sig { returns(T.nilable(T.anything)) }
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
          returns(T.nilable(DockerEngineRuby::Inspect::Descriptor::Platform))
        end
        attr_reader :platform

        sig do
          params(
            platform: DockerEngineRuby::Inspect::Descriptor::Platform::OrHash
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
            annotations: T.nilable(T.anything),
            artifact_type: T.nilable(String),
            data: T.nilable(String),
            digest: String,
            media_type: String,
            platform: DockerEngineRuby::Inspect::Descriptor::Platform::OrHash,
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
              annotations: T.nilable(T.anything),
              artifact_type: T.nilable(String),
              data: T.nilable(String),
              digest: String,
              media_type: String,
              platform: DockerEngineRuby::Inspect::Descriptor::Platform,
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
                DockerEngineRuby::Inspect::Descriptor::Platform,
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

      class Platform < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Inspect::Platform,
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
  end
end
