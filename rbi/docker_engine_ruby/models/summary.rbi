# typed: strong

module DockerEngineRuby
  module Models
    class Summary < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Summary, DockerEngineRuby::Internal::AnyHash)
        end

      # Command to run when starting the container
      sig { returns(T.nilable(String)) }
      attr_reader :command

      sig { params(command: String).void }
      attr_writer :command

      # Date and time at which the container was created as a Unix timestamp (number of
      # seconds since EPOCH).
      sig { returns(T.nilable(Integer)) }
      attr_reader :created

      sig { params(created: Integer).void }
      attr_writer :created

      # Summary of health status
      #
      # Added in v1.52, before that version all container summary not include Health.
      # After this attribute introduced, it includes containers with no health checks
      # configured, or containers that are not running with none
      sig { returns(T.nilable(DockerEngineRuby::Summary::Health)) }
      attr_reader :health

      sig { params(health: DockerEngineRuby::Summary::Health::OrHash).void }
      attr_writer :health

      # Summary of host-specific runtime information of the container. This is a reduced
      # set of information in the container's "HostConfig" as available in the container
      # "inspect" response.
      sig { returns(T.nilable(DockerEngineRuby::Summary::HostConfig)) }
      attr_reader :host_config

      sig do
        params(host_config: DockerEngineRuby::Summary::HostConfig::OrHash).void
      end
      attr_writer :host_config

      # The ID of this container as a 128-bit (64-character) hexadecimal string (32
      # bytes).
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The name or ID of the image used to create the container.
      #
      # This field shows the image reference as was specified when creating the
      # container, which can be in its canonical form (e.g.,
      # `docker.io/library/ubuntu:latest` or
      # `docker.io/library/ubuntu@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`),
      # short form (e.g., `ubuntu:latest`)), or the ID(-prefix) of the image (e.g.,
      # `72297848456d`).
      #
      # The content of this field can be updated at runtime if the image used to create
      # the container is untagged, in which case the field is updated to contain the the
      # image ID (digest) it was resolved to in its canonical, non-truncated form (e.g.,
      # `sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`).
      sig { returns(T.nilable(String)) }
      attr_reader :image

      sig { params(image: String).void }
      attr_writer :image

      # The ID (digest) of the image that this container was created from.
      sig { returns(T.nilable(String)) }
      attr_reader :image_id

      sig { params(image_id: String).void }
      attr_writer :image_id

      # A descriptor struct containing digest, media type, and size, as defined in the
      # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      sig do
        returns(T.nilable(DockerEngineRuby::Summary::ImageManifestDescriptor))
      end
      attr_reader :image_manifest_descriptor

      sig do
        params(
          image_manifest_descriptor:
            DockerEngineRuby::Summary::ImageManifestDescriptor::OrHash
        ).void
      end
      attr_writer :image_manifest_descriptor

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # List of mounts used by the container.
      sig { returns(T.nilable(T::Array[DockerEngineRuby::Summary::Mount])) }
      attr_reader :mounts

      sig do
        params(mounts: T::Array[DockerEngineRuby::Summary::Mount::OrHash]).void
      end
      attr_writer :mounts

      # The names associated with this container. Most containers have a single name,
      # but when using legacy "links", the container can have multiple names.
      #
      # For historic reasons, names are prefixed with a forward-slash (`/`).
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :names

      sig { params(names: T::Array[String]).void }
      attr_writer :names

      # Summary of the container's network settings
      sig { returns(T.nilable(DockerEngineRuby::Summary::NetworkSettings)) }
      attr_reader :network_settings

      sig do
        params(
          network_settings: DockerEngineRuby::Summary::NetworkSettings::OrHash
        ).void
      end
      attr_writer :network_settings

      # Port-mappings for the container.
      sig { returns(T.nilable(T::Array[DockerEngineRuby::Summary::Port])) }
      attr_reader :ports

      sig do
        params(ports: T::Array[DockerEngineRuby::Summary::Port::OrHash]).void
      end
      attr_writer :ports

      # The total size of all files in the read-only layers from the image that the
      # container uses. These layers can be shared between containers.
      #
      # This field is omitted by default, and only set when size is requested in the API
      # request.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :size_root_fs

      # The size of files that have been created or changed by this container.
      #
      # This field is omitted by default, and only set when size is requested in the API
      # request.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :size_rw

      # The state of this container.
      sig { returns(T.nilable(DockerEngineRuby::Summary::State::TaggedSymbol)) }
      attr_reader :state

      sig { params(state: DockerEngineRuby::Summary::State::OrSymbol).void }
      attr_writer :state

      # Additional human-readable status of this container (e.g. `Exit 0`)
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      sig do
        params(
          command: String,
          created: Integer,
          health: DockerEngineRuby::Summary::Health::OrHash,
          host_config: DockerEngineRuby::Summary::HostConfig::OrHash,
          id: String,
          image: String,
          image_id: String,
          image_manifest_descriptor:
            DockerEngineRuby::Summary::ImageManifestDescriptor::OrHash,
          labels: T::Hash[Symbol, String],
          mounts: T::Array[DockerEngineRuby::Summary::Mount::OrHash],
          names: T::Array[String],
          network_settings: DockerEngineRuby::Summary::NetworkSettings::OrHash,
          ports: T::Array[DockerEngineRuby::Summary::Port::OrHash],
          size_root_fs: T.nilable(Integer),
          size_rw: T.nilable(Integer),
          state: DockerEngineRuby::Summary::State::OrSymbol,
          status: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Command to run when starting the container
        command: nil,
        # Date and time at which the container was created as a Unix timestamp (number of
        # seconds since EPOCH).
        created: nil,
        # Summary of health status
        #
        # Added in v1.52, before that version all container summary not include Health.
        # After this attribute introduced, it includes containers with no health checks
        # configured, or containers that are not running with none
        health: nil,
        # Summary of host-specific runtime information of the container. This is a reduced
        # set of information in the container's "HostConfig" as available in the container
        # "inspect" response.
        host_config: nil,
        # The ID of this container as a 128-bit (64-character) hexadecimal string (32
        # bytes).
        id: nil,
        # The name or ID of the image used to create the container.
        #
        # This field shows the image reference as was specified when creating the
        # container, which can be in its canonical form (e.g.,
        # `docker.io/library/ubuntu:latest` or
        # `docker.io/library/ubuntu@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`),
        # short form (e.g., `ubuntu:latest`)), or the ID(-prefix) of the image (e.g.,
        # `72297848456d`).
        #
        # The content of this field can be updated at runtime if the image used to create
        # the container is untagged, in which case the field is updated to contain the the
        # image ID (digest) it was resolved to in its canonical, non-truncated form (e.g.,
        # `sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`).
        image: nil,
        # The ID (digest) of the image that this container was created from.
        image_id: nil,
        # A descriptor struct containing digest, media type, and size, as defined in the
        # [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
        image_manifest_descriptor: nil,
        # User-defined key/value metadata.
        labels: nil,
        # List of mounts used by the container.
        mounts: nil,
        # The names associated with this container. Most containers have a single name,
        # but when using legacy "links", the container can have multiple names.
        #
        # For historic reasons, names are prefixed with a forward-slash (`/`).
        names: nil,
        # Summary of the container's network settings
        network_settings: nil,
        # Port-mappings for the container.
        ports: nil,
        # The total size of all files in the read-only layers from the image that the
        # container uses. These layers can be shared between containers.
        #
        # This field is omitted by default, and only set when size is requested in the API
        # request.
        size_root_fs: nil,
        # The size of files that have been created or changed by this container.
        #
        # This field is omitted by default, and only set when size is requested in the API
        # request.
        size_rw: nil,
        # The state of this container.
        state: nil,
        # Additional human-readable status of this container (e.g. `Exit 0`)
        status: nil
      )
      end

      sig do
        override.returns(
          {
            command: String,
            created: Integer,
            health: DockerEngineRuby::Summary::Health,
            host_config: DockerEngineRuby::Summary::HostConfig,
            id: String,
            image: String,
            image_id: String,
            image_manifest_descriptor:
              DockerEngineRuby::Summary::ImageManifestDescriptor,
            labels: T::Hash[Symbol, String],
            mounts: T::Array[DockerEngineRuby::Summary::Mount],
            names: T::Array[String],
            network_settings: DockerEngineRuby::Summary::NetworkSettings,
            ports: T::Array[DockerEngineRuby::Summary::Port],
            size_root_fs: T.nilable(Integer),
            size_rw: T.nilable(Integer),
            state: DockerEngineRuby::Summary::State::TaggedSymbol,
            status: String
          }
        )
      end
      def to_hash
      end

      class Health < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::Health,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # FailingStreak is the number of consecutive failures
        sig { returns(T.nilable(Integer)) }
        attr_reader :failing_streak

        sig { params(failing_streak: Integer).void }
        attr_writer :failing_streak

        # the health status of the container
        sig do
          returns(
            T.nilable(DockerEngineRuby::Summary::Health::Status::TaggedSymbol)
          )
        end
        attr_reader :status

        sig do
          params(
            status: DockerEngineRuby::Summary::Health::Status::OrSymbol
          ).void
        end
        attr_writer :status

        # Summary of health status
        #
        # Added in v1.52, before that version all container summary not include Health.
        # After this attribute introduced, it includes containers with no health checks
        # configured, or containers that are not running with none
        sig do
          params(
            failing_streak: Integer,
            status: DockerEngineRuby::Summary::Health::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # FailingStreak is the number of consecutive failures
          failing_streak: nil,
          # the health status of the container
          status: nil
        )
        end

        sig do
          override.returns(
            {
              failing_streak: Integer,
              status: DockerEngineRuby::Summary::Health::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # the health status of the container
        module Status
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::Summary::Health::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NONE =
            T.let(
              :none,
              DockerEngineRuby::Summary::Health::Status::TaggedSymbol
            )
          STARTING =
            T.let(
              :starting,
              DockerEngineRuby::Summary::Health::Status::TaggedSymbol
            )
          HEALTHY =
            T.let(
              :healthy,
              DockerEngineRuby::Summary::Health::Status::TaggedSymbol
            )
          UNHEALTHY =
            T.let(
              :unhealthy,
              DockerEngineRuby::Summary::Health::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[DockerEngineRuby::Summary::Health::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class HostConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::HostConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Arbitrary key-value metadata attached to the container.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :annotations

        # Networking mode (`host`, `none`, `container:<id>`) or name of the primary
        # network the container is using.
        #
        # This field is primarily for backward compatibility. The container can be
        # connected to multiple networks for which information can be found in the
        # `NetworkSettings.Networks` field, which enumerates settings per network.
        sig { returns(T.nilable(String)) }
        attr_reader :network_mode

        sig { params(network_mode: String).void }
        attr_writer :network_mode

        # Summary of host-specific runtime information of the container. This is a reduced
        # set of information in the container's "HostConfig" as available in the container
        # "inspect" response.
        sig do
          params(
            annotations: T.nilable(T::Hash[Symbol, String]),
            network_mode: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Arbitrary key-value metadata attached to the container.
          annotations: nil,
          # Networking mode (`host`, `none`, `container:<id>`) or name of the primary
          # network the container is using.
          #
          # This field is primarily for backward compatibility. The container can be
          # connected to multiple networks for which information can be found in the
          # `NetworkSettings.Networks` field, which enumerates settings per network.
          network_mode: nil
        )
        end

        sig do
          override.returns(
            {
              annotations: T.nilable(T::Hash[Symbol, String]),
              network_mode: String
            }
          )
        end
        def to_hash
        end
      end

      class ImageManifestDescriptor < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::ImageManifestDescriptor,
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
              DockerEngineRuby::Summary::ImageManifestDescriptor::Platform
            )
          )
        end
        attr_reader :platform

        sig do
          params(
            platform:
              T.nilable(
                DockerEngineRuby::Summary::ImageManifestDescriptor::Platform::OrHash
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
                DockerEngineRuby::Summary::ImageManifestDescriptor::Platform::OrHash
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
                  DockerEngineRuby::Summary::ImageManifestDescriptor::Platform
                ),
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
                DockerEngineRuby::Summary::ImageManifestDescriptor::Platform,
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

      class Mount < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::Mount,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Destination is the path relative to the container root (`/`) where the `Source`
        # is mounted inside the container.
        sig { returns(T.nilable(String)) }
        attr_reader :destination

        sig { params(destination: String).void }
        attr_writer :destination

        # Driver is the volume driver used to create the volume (if it is a volume).
        sig { returns(T.nilable(String)) }
        attr_reader :driver

        sig { params(driver: String).void }
        attr_writer :driver

        # Mode is a comma separated list of options supplied by the user when creating the
        # bind/volume mount.
        #
        # The default is platform-specific (`"z"` on Linux, empty on Windows).
        sig { returns(T.nilable(String)) }
        attr_reader :mode

        sig { params(mode: String).void }
        attr_writer :mode

        # Name is the name reference to the underlying data defined by `Source` e.g., the
        # volume name.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Propagation describes how mounts are propagated from the host into the mount
        # point, and vice-versa. Refer to the
        # [Linux kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt)
        # for details. This field is not used on Windows.
        sig { returns(T.nilable(String)) }
        attr_reader :propagation

        sig { params(propagation: String).void }
        attr_writer :propagation

        # Whether the mount is mounted writable (read-write).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :rw

        sig { params(rw: T::Boolean).void }
        attr_writer :rw

        # Source location of the mount.
        #
        # For volumes, this contains the storage location of the volume (within
        # `/var/lib/docker/volumes/`). For bind-mounts, and `npipe`, this contains the
        # source (host) part of the bind-mount. For `tmpfs` mount points, this field is
        # empty.
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # The mount type. Available types:
        #
        # - `bind` a mount of a file or directory from the host into the container.
        # - `cluster` a Swarm cluster volume.
        # - `image` an OCI image.
        # - `npipe` a named pipe from the host into the container.
        # - `tmpfs` a `tmpfs`.
        # - `volume` a docker volume with the given `Name`.
        sig do
          returns(
            T.nilable(DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)
          )
        end
        attr_reader :type

        sig do
          params(type: DockerEngineRuby::Summary::Mount::Type::OrSymbol).void
        end
        attr_writer :type

        # MountPoint represents a mount point configuration inside the container. This is
        # used for reporting the mountpoints in use by a container.
        sig do
          params(
            destination: String,
            driver: String,
            mode: String,
            name: String,
            propagation: String,
            rw: T::Boolean,
            source: String,
            type: DockerEngineRuby::Summary::Mount::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Destination is the path relative to the container root (`/`) where the `Source`
          # is mounted inside the container.
          destination: nil,
          # Driver is the volume driver used to create the volume (if it is a volume).
          driver: nil,
          # Mode is a comma separated list of options supplied by the user when creating the
          # bind/volume mount.
          #
          # The default is platform-specific (`"z"` on Linux, empty on Windows).
          mode: nil,
          # Name is the name reference to the underlying data defined by `Source` e.g., the
          # volume name.
          name: nil,
          # Propagation describes how mounts are propagated from the host into the mount
          # point, and vice-versa. Refer to the
          # [Linux kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt)
          # for details. This field is not used on Windows.
          propagation: nil,
          # Whether the mount is mounted writable (read-write).
          rw: nil,
          # Source location of the mount.
          #
          # For volumes, this contains the storage location of the volume (within
          # `/var/lib/docker/volumes/`). For bind-mounts, and `npipe`, this contains the
          # source (host) part of the bind-mount. For `tmpfs` mount points, this field is
          # empty.
          source: nil,
          # The mount type. Available types:
          #
          # - `bind` a mount of a file or directory from the host into the container.
          # - `cluster` a Swarm cluster volume.
          # - `image` an OCI image.
          # - `npipe` a named pipe from the host into the container.
          # - `tmpfs` a `tmpfs`.
          # - `volume` a docker volume with the given `Name`.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              destination: String,
              driver: String,
              mode: String,
              name: String,
              propagation: String,
              rw: T::Boolean,
              source: String,
              type: DockerEngineRuby::Summary::Mount::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The mount type. Available types:
        #
        # - `bind` a mount of a file or directory from the host into the container.
        # - `cluster` a Swarm cluster volume.
        # - `image` an OCI image.
        # - `npipe` a named pipe from the host into the container.
        # - `tmpfs` a `tmpfs`.
        # - `volume` a docker volume with the given `Name`.
        module Type
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::Summary::Mount::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BIND =
            T.let(:bind, DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)
          CLUSTER =
            T.let(
              :cluster,
              DockerEngineRuby::Summary::Mount::Type::TaggedSymbol
            )
          IMAGE =
            T.let(:image, DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)
          NPIPE =
            T.let(:npipe, DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)
          TMPFS =
            T.let(:tmpfs, DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)
          VOLUME =
            T.let(:volume, DockerEngineRuby::Summary::Mount::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[DockerEngineRuby::Summary::Mount::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class NetworkSettings < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::NetworkSettings,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Summary of network-settings for each network the container is attached to.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                DockerEngineRuby::Summary::NetworkSettings::Network
              ]
            )
          )
        end
        attr_reader :networks

        sig do
          params(
            networks:
              T::Hash[
                Symbol,
                DockerEngineRuby::Summary::NetworkSettings::Network::OrHash
              ]
          ).void
        end
        attr_writer :networks

        # Summary of the container's network settings
        sig do
          params(
            networks:
              T::Hash[
                Symbol,
                DockerEngineRuby::Summary::NetworkSettings::Network::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Summary of network-settings for each network the container is attached to.
          networks: nil
        )
        end

        sig do
          override.returns(
            {
              networks:
                T::Hash[
                  Symbol,
                  DockerEngineRuby::Summary::NetworkSettings::Network
                ]
            }
          )
        end
        def to_hash
        end

        class Network < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Summary::NetworkSettings::Network,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :aliases

          sig { params(aliases: T::Array[String]).void }
          attr_writer :aliases

          # List of all DNS names an endpoint has on a specific network. This list is based
          # on the container name, network aliases, container short ID, and hostname.
          #
          # These DNS names are non-fully qualified but can contain several dots. You can
          # get fully qualified DNS names by appending `.<network-name>`. For instance, if
          # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
          # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :dns_names

          sig { params(dns_names: T::Array[String]).void }
          attr_writer :dns_names

          # DriverOpts is a mapping of driver options and values. These options are passed
          # directly to the driver and are driver specific.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_accessor :driver_opts

          # Unique ID for the service endpoint in a Sandbox.
          sig { returns(T.nilable(String)) }
          attr_reader :endpoint_id

          sig { params(endpoint_id: String).void }
          attr_writer :endpoint_id

          # Gateway address for this network.
          sig { returns(T.nilable(String)) }
          attr_reader :gateway

          sig { params(gateway: String).void }
          attr_writer :gateway

          # Global IPv6 address.
          sig { returns(T.nilable(String)) }
          attr_reader :global_i_pv6_address

          sig { params(global_i_pv6_address: String).void }
          attr_writer :global_i_pv6_address

          # Mask length of the global IPv6 address.
          sig { returns(T.nilable(Integer)) }
          attr_reader :global_i_pv6_prefix_len

          sig { params(global_i_pv6_prefix_len: Integer).void }
          attr_writer :global_i_pv6_prefix_len

          # This property determines which endpoint will provide the default gateway for a
          # container. The endpoint with the highest priority will be used. If multiple
          # endpoints have the same priority, endpoints are lexicographically sorted based
          # on their network name, and the one that sorts first is picked.
          sig { returns(T.nilable(Integer)) }
          attr_reader :gw_priority

          sig { params(gw_priority: Integer).void }
          attr_writer :gw_priority

          # IPv4 address.
          sig { returns(T.nilable(String)) }
          attr_reader :ip_address

          sig { params(ip_address: String).void }
          attr_writer :ip_address

          # EndpointIPAMConfig represents an endpoint's IPAM configuration.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::Summary::NetworkSettings::Network::IpamConfig
              )
            )
          end
          attr_reader :ipam_config

          sig do
            params(
              ipam_config:
                T.nilable(
                  DockerEngineRuby::Summary::NetworkSettings::Network::IpamConfig::OrHash
                )
            ).void
          end
          attr_writer :ipam_config

          # Mask length of the IPv4 address.
          sig { returns(T.nilable(Integer)) }
          attr_reader :ip_prefix_len

          sig { params(ip_prefix_len: Integer).void }
          attr_writer :ip_prefix_len

          # IPv6 gateway address.
          sig { returns(T.nilable(String)) }
          attr_reader :i_pv6_gateway

          sig { params(i_pv6_gateway: String).void }
          attr_writer :i_pv6_gateway

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :links

          sig { params(links: T::Array[String]).void }
          attr_writer :links

          # MAC address for the endpoint on this network. The network driver might ignore
          # this parameter.
          sig { returns(T.nilable(String)) }
          attr_reader :mac_address

          sig { params(mac_address: String).void }
          attr_writer :mac_address

          # Unique ID of the network.
          sig { returns(T.nilable(String)) }
          attr_reader :network_id

          sig { params(network_id: String).void }
          attr_writer :network_id

          # Configuration for a network endpoint.
          sig do
            params(
              aliases: T::Array[String],
              dns_names: T::Array[String],
              driver_opts: T.nilable(T::Hash[Symbol, String]),
              endpoint_id: String,
              gateway: String,
              global_i_pv6_address: String,
              global_i_pv6_prefix_len: Integer,
              gw_priority: Integer,
              ip_address: String,
              ipam_config:
                T.nilable(
                  DockerEngineRuby::Summary::NetworkSettings::Network::IpamConfig::OrHash
                ),
              ip_prefix_len: Integer,
              i_pv6_gateway: String,
              links: T::Array[String],
              mac_address: String,
              network_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            aliases: nil,
            # List of all DNS names an endpoint has on a specific network. This list is based
            # on the container name, network aliases, container short ID, and hostname.
            #
            # These DNS names are non-fully qualified but can contain several dots. You can
            # get fully qualified DNS names by appending `.<network-name>`. For instance, if
            # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
            # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
            dns_names: nil,
            # DriverOpts is a mapping of driver options and values. These options are passed
            # directly to the driver and are driver specific.
            driver_opts: nil,
            # Unique ID for the service endpoint in a Sandbox.
            endpoint_id: nil,
            # Gateway address for this network.
            gateway: nil,
            # Global IPv6 address.
            global_i_pv6_address: nil,
            # Mask length of the global IPv6 address.
            global_i_pv6_prefix_len: nil,
            # This property determines which endpoint will provide the default gateway for a
            # container. The endpoint with the highest priority will be used. If multiple
            # endpoints have the same priority, endpoints are lexicographically sorted based
            # on their network name, and the one that sorts first is picked.
            gw_priority: nil,
            # IPv4 address.
            ip_address: nil,
            # EndpointIPAMConfig represents an endpoint's IPAM configuration.
            ipam_config: nil,
            # Mask length of the IPv4 address.
            ip_prefix_len: nil,
            # IPv6 gateway address.
            i_pv6_gateway: nil,
            links: nil,
            # MAC address for the endpoint on this network. The network driver might ignore
            # this parameter.
            mac_address: nil,
            # Unique ID of the network.
            network_id: nil
          )
          end

          sig do
            override.returns(
              {
                aliases: T::Array[String],
                dns_names: T::Array[String],
                driver_opts: T.nilable(T::Hash[Symbol, String]),
                endpoint_id: String,
                gateway: String,
                global_i_pv6_address: String,
                global_i_pv6_prefix_len: Integer,
                gw_priority: Integer,
                ip_address: String,
                ipam_config:
                  T.nilable(
                    DockerEngineRuby::Summary::NetworkSettings::Network::IpamConfig
                  ),
                ip_prefix_len: Integer,
                i_pv6_gateway: String,
                links: T::Array[String],
                mac_address: String,
                network_id: String
              }
            )
          end
          def to_hash
          end

          class IpamConfig < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::Summary::NetworkSettings::Network::IpamConfig,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :i_pv4_address

            sig { params(i_pv4_address: String).void }
            attr_writer :i_pv4_address

            sig { returns(T.nilable(String)) }
            attr_reader :i_pv6_address

            sig { params(i_pv6_address: String).void }
            attr_writer :i_pv6_address

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :link_local_ips

            sig { params(link_local_ips: T::Array[String]).void }
            attr_writer :link_local_ips

            # EndpointIPAMConfig represents an endpoint's IPAM configuration.
            sig do
              params(
                i_pv4_address: String,
                i_pv6_address: String,
                link_local_ips: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              i_pv4_address: nil,
              i_pv6_address: nil,
              link_local_ips: nil
            )
            end

            sig do
              override.returns(
                {
                  i_pv4_address: String,
                  i_pv6_address: String,
                  link_local_ips: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class Port < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Summary::Port,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Port on the container
        sig { returns(Integer) }
        attr_accessor :private_port

        sig { returns(DockerEngineRuby::Summary::Port::Type::TaggedSymbol) }
        attr_accessor :type

        # Host IP address that the container's port is mapped to
        sig { returns(T.nilable(String)) }
        attr_reader :ip

        sig { params(ip: String).void }
        attr_writer :ip

        # Port exposed on the host
        sig { returns(T.nilable(Integer)) }
        attr_reader :public_port

        sig { params(public_port: Integer).void }
        attr_writer :public_port

        # Describes a port-mapping between the container and the host.
        sig do
          params(
            private_port: Integer,
            type: DockerEngineRuby::Summary::Port::Type::OrSymbol,
            ip: String,
            public_port: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Port on the container
          private_port:,
          type:,
          # Host IP address that the container's port is mapped to
          ip: nil,
          # Port exposed on the host
          public_port: nil
        )
        end

        sig do
          override.returns(
            {
              private_port: Integer,
              type: DockerEngineRuby::Summary::Port::Type::TaggedSymbol,
              ip: String,
              public_port: Integer
            }
          )
        end
        def to_hash
        end

        module Type
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DockerEngineRuby::Summary::Port::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TCP = T.let(:tcp, DockerEngineRuby::Summary::Port::Type::TaggedSymbol)
          UDP = T.let(:udp, DockerEngineRuby::Summary::Port::Type::TaggedSymbol)
          SCTP =
            T.let(:sctp, DockerEngineRuby::Summary::Port::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[DockerEngineRuby::Summary::Port::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The state of this container.
      module State
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DockerEngineRuby::Summary::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED =
          T.let(:created, DockerEngineRuby::Summary::State::TaggedSymbol)
        RUNNING =
          T.let(:running, DockerEngineRuby::Summary::State::TaggedSymbol)
        PAUSED = T.let(:paused, DockerEngineRuby::Summary::State::TaggedSymbol)
        RESTARTING =
          T.let(:restarting, DockerEngineRuby::Summary::State::TaggedSymbol)
        EXITED = T.let(:exited, DockerEngineRuby::Summary::State::TaggedSymbol)
        REMOVING =
          T.let(:removing, DockerEngineRuby::Summary::State::TaggedSymbol)
        DEAD = T.let(:dead, DockerEngineRuby::Summary::State::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::Summary::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
