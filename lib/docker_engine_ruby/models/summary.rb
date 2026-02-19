# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class Summary < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute command
      #   Command to run when starting the container
      #
      #   @return [String, nil]
      optional :command, String, api_name: :Command

      # @!attribute created
      #   Date and time at which the container was created as a Unix timestamp (number of
      #   seconds since EPOCH).
      #
      #   @return [Integer, nil]
      optional :created, Integer, api_name: :Created

      # @!attribute health
      #   Summary of health status
      #
      #   Added in v1.52, before that version all container summary not include Health.
      #   After this attribute introduced, it includes containers with no health checks
      #   configured, or containers that are not running with none
      #
      #   @return [DockerEngineRuby::Models::Summary::Health, nil]
      optional :health, -> { DockerEngineRuby::Summary::Health }, api_name: :Health

      # @!attribute host_config
      #   Summary of host-specific runtime information of the container. This is a reduced
      #   set of information in the container's "HostConfig" as available in the container
      #   "inspect" response.
      #
      #   @return [DockerEngineRuby::Models::Summary::HostConfig, nil]
      optional :host_config, -> { DockerEngineRuby::Summary::HostConfig }, api_name: :HostConfig

      # @!attribute id
      #   The ID of this container as a 128-bit (64-character) hexadecimal string (32
      #   bytes).
      #
      #   @return [String, nil]
      optional :id, String, api_name: :Id

      # @!attribute image
      #   The name or ID of the image used to create the container.
      #
      #   This field shows the image reference as was specified when creating the
      #   container, which can be in its canonical form (e.g.,
      #   `docker.io/library/ubuntu:latest` or
      #   `docker.io/library/ubuntu@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`),
      #   short form (e.g., `ubuntu:latest`)), or the ID(-prefix) of the image (e.g.,
      #   `72297848456d`).
      #
      #   The content of this field can be updated at runtime if the image used to create
      #   the container is untagged, in which case the field is updated to contain the the
      #   image ID (digest) it was resolved to in its canonical, non-truncated form (e.g.,
      #   `sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782`).
      #
      #   @return [String, nil]
      optional :image, String, api_name: :Image

      # @!attribute image_id
      #   The ID (digest) of the image that this container was created from.
      #
      #   @return [String, nil]
      optional :image_id, String, api_name: :ImageID

      # @!attribute image_manifest_descriptor
      #   A descriptor struct containing digest, media type, and size, as defined in the
      #   [OCI Content Descriptors Specification](https://github.com/opencontainers/image-spec/blob/v1.0.1/descriptor.md).
      #
      #   @return [DockerEngineRuby::Models::Summary::ImageManifestDescriptor, nil]
      optional :image_manifest_descriptor,
               -> { DockerEngineRuby::Summary::ImageManifestDescriptor },
               api_name: :ImageManifestDescriptor,
               nil?: true

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Object, nil]
      optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

      # @!attribute mounts
      #   List of mounts used by the container.
      #
      #   @return [Array<DockerEngineRuby::Models::Summary::Mount>, nil]
      optional :mounts,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary::Mount] },
               api_name: :Mounts

      # @!attribute names
      #   The names associated with this container. Most containers have a single name,
      #   but when using legacy "links", the container can have multiple names.
      #
      #   For historic reasons, names are prefixed with a forward-slash (`/`).
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Names

      # @!attribute network_settings
      #   Summary of the container's network settings
      #
      #   @return [DockerEngineRuby::Models::Summary::NetworkSettings, nil]
      optional :network_settings,
               -> {
                 DockerEngineRuby::Summary::NetworkSettings
               },
               api_name: :NetworkSettings

      # @!attribute ports
      #   Port-mappings for the container.
      #
      #   @return [Array<DockerEngineRuby::Models::Summary::Port>, nil]
      optional :ports,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary::Port] },
               api_name: :Ports

      # @!attribute size_root_fs
      #   The total size of all files in the read-only layers from the image that the
      #   container uses. These layers can be shared between containers.
      #
      #   This field is omitted by default, and only set when size is requested in the API
      #   request.
      #
      #   @return [Integer, nil]
      optional :size_root_fs, Integer, api_name: :SizeRootFs, nil?: true

      # @!attribute size_rw
      #   The size of files that have been created or changed by this container.
      #
      #   This field is omitted by default, and only set when size is requested in the API
      #   request.
      #
      #   @return [Integer, nil]
      optional :size_rw, Integer, api_name: :SizeRw, nil?: true

      # @!attribute state
      #   The state of this container.
      #
      #   @return [Symbol, DockerEngineRuby::Models::Summary::State, nil]
      optional :state, enum: -> { DockerEngineRuby::Summary::State }, api_name: :State

      # @!attribute status
      #   Additional human-readable status of this container (e.g. `Exit 0`)
      #
      #   @return [String, nil]
      optional :status, String, api_name: :Status

      # @!method initialize(command: nil, created: nil, health: nil, host_config: nil, id: nil, image: nil, image_id: nil, image_manifest_descriptor: nil, labels: nil, mounts: nil, names: nil, network_settings: nil, ports: nil, size_root_fs: nil, size_rw: nil, state: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Summary} for more details.
      #
      #   @param command [String] Command to run when starting the container
      #
      #   @param created [Integer] Date and time at which the container was created as a Unix timestamp
      #
      #   @param health [DockerEngineRuby::Models::Summary::Health] Summary of health status
      #
      #   @param host_config [DockerEngineRuby::Models::Summary::HostConfig] Summary of host-specific runtime information of the container. This
      #
      #   @param id [String] The ID of this container as a 128-bit (64-character) hexadecimal string (32 byte
      #
      #   @param image [String] The name or ID of the image used to create the container.
      #
      #   @param image_id [String] The ID (digest) of the image that this container was created from.
      #
      #   @param image_manifest_descriptor [DockerEngineRuby::Models::Summary::ImageManifestDescriptor, nil] A descriptor struct containing digest, media type, and size, as defined in
      #
      #   @param labels [Object] User-defined key/value metadata.
      #
      #   @param mounts [Array<DockerEngineRuby::Models::Summary::Mount>] List of mounts used by the container.
      #
      #   @param names [Array<String>] The names associated with this container. Most containers have a single
      #
      #   @param network_settings [DockerEngineRuby::Models::Summary::NetworkSettings] Summary of the container's network settings
      #
      #   @param ports [Array<DockerEngineRuby::Models::Summary::Port>] Port-mappings for the container.
      #
      #   @param size_root_fs [Integer, nil] The total size of all files in the read-only layers from the image
      #
      #   @param size_rw [Integer, nil] The size of files that have been created or changed by this container.
      #
      #   @param state [Symbol, DockerEngineRuby::Models::Summary::State] The state of this container.
      #
      #   @param status [String] Additional human-readable status of this container (e.g. `Exit 0`)

      # @see DockerEngineRuby::Models::Summary#health
      class Health < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute failing_streak
        #
        #   @return [Integer, nil]
        optional :failing_streak, Integer, api_name: :FailingStreak

        # @!attribute status
        #
        #   @return [Symbol, DockerEngineRuby::Models::Summary::Health::Status, nil]
        optional :status, enum: -> { DockerEngineRuby::Summary::Health::Status }, api_name: :Status

        # @!method initialize(failing_streak: nil, status: nil)
        #   Summary of health status
        #
        #   Added in v1.52, before that version all container summary not include Health.
        #   After this attribute introduced, it includes containers with no health checks
        #   configured, or containers that are not running with none
        #
        #   @param failing_streak [Integer]
        #   @param status [Symbol, DockerEngineRuby::Models::Summary::Health::Status]

        # @see DockerEngineRuby::Models::Summary::Health#status
        module Status
          extend DockerEngineRuby::Internal::Type::Enum

          NONE = :none
          STARTING = :starting
          HEALTHY = :healthy
          UNHEALTHY = :unhealthy

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineRuby::Models::Summary#host_config
      class HostConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute annotations
        #
        #   @return [Object, nil]
        optional :annotations, DockerEngineRuby::Internal::Type::Unknown, api_name: :Annotations, nil?: true

        # @!attribute network_mode
        #
        #   @return [String, nil]
        optional :network_mode, String, api_name: :NetworkMode

        # @!method initialize(annotations: nil, network_mode: nil)
        #   Summary of host-specific runtime information of the container. This is a reduced
        #   set of information in the container's "HostConfig" as available in the container
        #   "inspect" response.
        #
        #   @param annotations [Object, nil]
        #   @param network_mode [String]
      end

      # @see DockerEngineRuby::Models::Summary#image_manifest_descriptor
      class ImageManifestDescriptor < DockerEngineRuby::Internal::Type::BaseModel
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
        #   @return [DockerEngineRuby::Models::Summary::ImageManifestDescriptor::Platform, nil]
        optional :platform, -> { DockerEngineRuby::Summary::ImageManifestDescriptor::Platform }

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
        #   {DockerEngineRuby::Models::Summary::ImageManifestDescriptor} for more details.
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
        #   @param platform [DockerEngineRuby::Models::Summary::ImageManifestDescriptor::Platform] Describes the platform which the image in the manifest runs on, as defined
        #
        #   @param size [Integer] The size in bytes of the blob.
        #
        #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

        # @see DockerEngineRuby::Models::Summary::ImageManifestDescriptor#platform
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
          #   {DockerEngineRuby::Models::Summary::ImageManifestDescriptor::Platform} for more
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

      class Mount < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute destination
        #   Destination is the path relative to the container root (`/`) where the `Source`
        #   is mounted inside the container.
        #
        #   @return [String, nil]
        optional :destination, String, api_name: :Destination

        # @!attribute driver
        #   Driver is the volume driver used to create the volume (if it is a volume).
        #
        #   @return [String, nil]
        optional :driver, String, api_name: :Driver

        # @!attribute mode
        #   Mode is a comma separated list of options supplied by the user when creating the
        #   bind/volume mount.
        #
        #   The default is platform-specific (`"z"` on Linux, empty on Windows).
        #
        #   @return [String, nil]
        optional :mode, String, api_name: :Mode

        # @!attribute name
        #   Name is the name reference to the underlying data defined by `Source` e.g., the
        #   volume name.
        #
        #   @return [String, nil]
        optional :name, String, api_name: :Name

        # @!attribute propagation
        #   Propagation describes how mounts are propagated from the host into the mount
        #   point, and vice-versa. Refer to the
        #   [Linux kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt)
        #   for details. This field is not used on Windows.
        #
        #   @return [String, nil]
        optional :propagation, String, api_name: :Propagation

        # @!attribute rw
        #   Whether the mount is mounted writable (read-write).
        #
        #   @return [Boolean, nil]
        optional :rw, DockerEngineRuby::Internal::Type::Boolean, api_name: :RW

        # @!attribute source
        #   Source location of the mount.
        #
        #   For volumes, this contains the storage location of the volume (within
        #   `/var/lib/docker/volumes/`). For bind-mounts, and `npipe`, this contains the
        #   source (host) part of the bind-mount. For `tmpfs` mount points, this field is
        #   empty.
        #
        #   @return [String, nil]
        optional :source, String, api_name: :Source

        # @!attribute type
        #   The mount type. Available types:
        #
        #   - `bind` a mount of a file or directory from the host into the container.
        #   - `cluster` a Swarm cluster volume.
        #   - `image` an OCI image.
        #   - `npipe` a named pipe from the host into the container.
        #   - `tmpfs` a `tmpfs`.
        #   - `volume` a docker volume with the given `Name`.
        #
        #   @return [Symbol, DockerEngineRuby::Models::Summary::Mount::Type, nil]
        optional :type, enum: -> { DockerEngineRuby::Summary::Mount::Type }, api_name: :Type

        # @!method initialize(destination: nil, driver: nil, mode: nil, name: nil, propagation: nil, rw: nil, source: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Summary::Mount} for more details.
        #
        #   MountPoint represents a mount point configuration inside the container. This is
        #   used for reporting the mountpoints in use by a container.
        #
        #   @param destination [String] Destination is the path relative to the container root (`/`) where
        #
        #   @param driver [String] Driver is the volume driver used to create the volume (if it is a volume).
        #
        #   @param mode [String] Mode is a comma separated list of options supplied by the user when
        #
        #   @param name [String] Name is the name reference to the underlying data defined by `Source`
        #
        #   @param propagation [String] Propagation describes how mounts are propagated from the host into the
        #
        #   @param rw [Boolean] Whether the mount is mounted writable (read-write).
        #
        #   @param source [String] Source location of the mount.
        #
        #   @param type [Symbol, DockerEngineRuby::Models::Summary::Mount::Type] The mount type. Available types:

        # The mount type. Available types:
        #
        # - `bind` a mount of a file or directory from the host into the container.
        # - `cluster` a Swarm cluster volume.
        # - `image` an OCI image.
        # - `npipe` a named pipe from the host into the container.
        # - `tmpfs` a `tmpfs`.
        # - `volume` a docker volume with the given `Name`.
        #
        # @see DockerEngineRuby::Models::Summary::Mount#type
        module Type
          extend DockerEngineRuby::Internal::Type::Enum

          BIND = :bind
          CLUSTER = :cluster
          IMAGE = :image
          NPIPE = :npipe
          TMPFS = :tmpfs
          VOLUME = :volume

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineRuby::Models::Summary#network_settings
      class NetworkSettings < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute networks
        #
        #   @return [Object, nil]
        optional :networks, DockerEngineRuby::Internal::Type::Unknown, api_name: :Networks

        # @!method initialize(networks: nil)
        #   Summary of the container's network settings
        #
        #   @param networks [Object]
      end

      class Port < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute private_port
        #   Port on the container
        #
        #   @return [Integer]
        required :private_port, Integer, api_name: :PrivatePort

        # @!attribute type
        #
        #   @return [Symbol, DockerEngineRuby::Models::Summary::Port::Type]
        required :type, enum: -> { DockerEngineRuby::Summary::Port::Type }, api_name: :Type

        # @!attribute ip
        #   Host IP address that the container's port is mapped to
        #
        #   @return [String, nil]
        optional :ip, String, api_name: :IP

        # @!attribute public_port
        #   Port exposed on the host
        #
        #   @return [Integer, nil]
        optional :public_port, Integer, api_name: :PublicPort

        # @!method initialize(private_port:, type:, ip: nil, public_port: nil)
        #   Describes a port-mapping between the container and the host.
        #
        #   @param private_port [Integer] Port on the container
        #
        #   @param type [Symbol, DockerEngineRuby::Models::Summary::Port::Type]
        #
        #   @param ip [String] Host IP address that the container's port is mapped to
        #
        #   @param public_port [Integer] Port exposed on the host

        # @see DockerEngineRuby::Models::Summary::Port#type
        module Type
          extend DockerEngineRuby::Internal::Type::Enum

          TCP = :tcp
          UDP = :udp
          SCTP = :sctp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The state of this container.
      #
      # @see DockerEngineRuby::Models::Summary#state
      module State
        extend DockerEngineRuby::Internal::Type::Enum

        CREATED = :created
        RUNNING = :running
        PAUSED = :paused
        RESTARTING = :restarting
        EXITED = :exited
        REMOVING = :removing
        DEAD = :dead

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
