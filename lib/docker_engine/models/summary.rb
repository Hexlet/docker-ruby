# frozen_string_literal: true

module DockerEngine
  module Models
    class Summary < DockerEngine::Internal::Type::BaseModel
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
      #   @return [DockerEngine::Models::Summary::Health, nil]
      optional :health, -> { DockerEngine::Summary::Health }, api_name: :Health

      # @!attribute host_config
      #   Summary of host-specific runtime information of the container. This is a reduced
      #   set of information in the container's "HostConfig" as available in the container
      #   "inspect" response.
      #
      #   @return [DockerEngine::Models::Summary::HostConfig, nil]
      optional :host_config, -> { DockerEngine::Summary::HostConfig }, api_name: :HostConfig

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
      #   @return [DockerEngine::Models::Summary::ImageManifestDescriptor, nil]
      optional :image_manifest_descriptor,
               -> { DockerEngine::Summary::ImageManifestDescriptor },
               api_name: :ImageManifestDescriptor

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngine::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute mounts
      #   List of mounts used by the container.
      #
      #   @return [Array<DockerEngine::Models::Summary::Mount>, nil]
      optional :mounts,
               -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary::Mount] },
               api_name: :Mounts

      # @!attribute names
      #   The names associated with this container. Most containers have a single name,
      #   but when using legacy "links", the container can have multiple names.
      #
      #   For historic reasons, names are prefixed with a forward-slash (`/`).
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Names

      # @!attribute network_settings
      #   Summary of the container's network settings
      #
      #   @return [DockerEngine::Models::Summary::NetworkSettings, nil]
      optional :network_settings, -> { DockerEngine::Summary::NetworkSettings }, api_name: :NetworkSettings

      # @!attribute ports
      #   Port-mappings for the container.
      #
      #   @return [Array<DockerEngine::Models::Summary::Port>, nil]
      optional :ports,
               -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary::Port] },
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
      #   @return [Symbol, DockerEngine::Models::Summary::State, nil]
      optional :state, enum: -> { DockerEngine::Summary::State }, api_name: :State

      # @!attribute status
      #   Additional human-readable status of this container (e.g. `Exit 0`)
      #
      #   @return [String, nil]
      optional :status, String, api_name: :Status

      # @!method initialize(command: nil, created: nil, health: nil, host_config: nil, id: nil, image: nil, image_id: nil, image_manifest_descriptor: nil, labels: nil, mounts: nil, names: nil, network_settings: nil, ports: nil, size_root_fs: nil, size_rw: nil, state: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::Summary} for more details.
      #
      #   @param command [String] Command to run when starting the container
      #
      #   @param created [Integer] Date and time at which the container was created as a Unix timestamp
      #
      #   @param health [DockerEngine::Models::Summary::Health] Summary of health status
      #
      #   @param host_config [DockerEngine::Models::Summary::HostConfig] Summary of host-specific runtime information of the container. This
      #
      #   @param id [String] The ID of this container as a 128-bit (64-character) hexadecimal string (32 byte
      #
      #   @param image [String] The name or ID of the image used to create the container.
      #
      #   @param image_id [String] The ID (digest) of the image that this container was created from.
      #
      #   @param image_manifest_descriptor [DockerEngine::Models::Summary::ImageManifestDescriptor] A descriptor struct containing digest, media type, and size, as defined in
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param mounts [Array<DockerEngine::Models::Summary::Mount>] List of mounts used by the container.
      #
      #   @param names [Array<String>] The names associated with this container. Most containers have a single
      #
      #   @param network_settings [DockerEngine::Models::Summary::NetworkSettings] Summary of the container's network settings
      #
      #   @param ports [Array<DockerEngine::Models::Summary::Port>] Port-mappings for the container.
      #
      #   @param size_root_fs [Integer, nil] The total size of all files in the read-only layers from the image
      #
      #   @param size_rw [Integer, nil] The size of files that have been created or changed by this container.
      #
      #   @param state [Symbol, DockerEngine::Models::Summary::State] The state of this container.
      #
      #   @param status [String] Additional human-readable status of this container (e.g. `Exit 0`)

      # @see DockerEngine::Models::Summary#health
      class Health < DockerEngine::Internal::Type::BaseModel
        # @!attribute failing_streak
        #   FailingStreak is the number of consecutive failures
        #
        #   @return [Integer, nil]
        optional :failing_streak, Integer, api_name: :FailingStreak

        # @!attribute status
        #   the health status of the container
        #
        #   @return [Symbol, DockerEngine::Models::Summary::Health::Status, nil]
        optional :status, enum: -> { DockerEngine::Summary::Health::Status }, api_name: :Status

        # @!method initialize(failing_streak: nil, status: nil)
        #   Summary of health status
        #
        #   Added in v1.52, before that version all container summary not include Health.
        #   After this attribute introduced, it includes containers with no health checks
        #   configured, or containers that are not running with none
        #
        #   @param failing_streak [Integer] FailingStreak is the number of consecutive failures
        #
        #   @param status [Symbol, DockerEngine::Models::Summary::Health::Status] the health status of the container

        # the health status of the container
        #
        # @see DockerEngine::Models::Summary::Health#status
        module Status
          extend DockerEngine::Internal::Type::Enum

          NONE = :none
          STARTING = :starting
          HEALTHY = :healthy
          UNHEALTHY = :unhealthy

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngine::Models::Summary#host_config
      class HostConfig < DockerEngine::Internal::Type::BaseModel
        # @!attribute annotations
        #   Arbitrary key-value metadata attached to the container.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :annotations,
                 DockerEngine::Internal::Type::HashOf[String],
                 api_name: :Annotations,
                 nil?: true

        # @!attribute network_mode
        #   Networking mode (`host`, `none`, `container:<id>`) or name of the primary
        #   network the container is using.
        #
        #   This field is primarily for backward compatibility. The container can be
        #   connected to multiple networks for which information can be found in the
        #   `NetworkSettings.Networks` field, which enumerates settings per network.
        #
        #   @return [String, nil]
        optional :network_mode, String, api_name: :NetworkMode

        # @!method initialize(annotations: nil, network_mode: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Summary::HostConfig} for more details.
        #
        #   Summary of host-specific runtime information of the container. This is a reduced
        #   set of information in the container's "HostConfig" as available in the container
        #   "inspect" response.
        #
        #   @param annotations [Hash{Symbol=>String}, nil] Arbitrary key-value metadata attached to the container.
        #
        #   @param network_mode [String] Networking mode (`host`, `none`, `container:<id>`) or name of the
      end

      # @see DockerEngine::Models::Summary#image_manifest_descriptor
      class ImageManifestDescriptor < DockerEngine::Internal::Type::BaseModel
        # @!attribute annotations
        #   Arbitrary metadata relating to the targeted content.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :annotations, DockerEngine::Internal::Type::HashOf[String], nil?: true

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
        #   @return [DockerEngine::Models::Summary::ImageManifestDescriptor::Platform, nil]
        optional :platform, -> { DockerEngine::Summary::ImageManifestDescriptor::Platform }, nil?: true

        # @!attribute size
        #   The size in bytes of the blob.
        #
        #   @return [Integer, nil]
        optional :size, Integer

        # @!attribute urls
        #   List of URLs from which this object MAY be downloaded.
        #
        #   @return [Array<String>, nil]
        optional :urls, DockerEngine::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(annotations: nil, artifact_type: nil, data: nil, digest: nil, media_type: nil, platform: nil, size: nil, urls: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Summary::ImageManifestDescriptor} for more details.
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
        #   @param platform [DockerEngine::Models::Summary::ImageManifestDescriptor::Platform, nil] Describes the platform which the image in the manifest runs on, as defined
        #
        #   @param size [Integer] The size in bytes of the blob.
        #
        #   @param urls [Array<String>, nil] List of URLs from which this object MAY be downloaded.

        # @see DockerEngine::Models::Summary::ImageManifestDescriptor#platform
        class Platform < DockerEngine::Internal::Type::BaseModel
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
          optional :os_features, DockerEngine::Internal::Type::ArrayOf[String], api_name: :"os.features"

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
          #   {DockerEngine::Models::Summary::ImageManifestDescriptor::Platform} for more
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

      class Mount < DockerEngine::Internal::Type::BaseModel
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
        optional :rw, DockerEngine::Internal::Type::Boolean, api_name: :RW

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
        #   @return [Symbol, DockerEngine::Models::Summary::Mount::Type, nil]
        optional :type, enum: -> { DockerEngine::Summary::Mount::Type }, api_name: :Type

        # @!method initialize(destination: nil, driver: nil, mode: nil, name: nil, propagation: nil, rw: nil, source: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Summary::Mount} for more details.
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
        #   @param type [Symbol, DockerEngine::Models::Summary::Mount::Type] The mount type. Available types:

        # The mount type. Available types:
        #
        # - `bind` a mount of a file or directory from the host into the container.
        # - `cluster` a Swarm cluster volume.
        # - `image` an OCI image.
        # - `npipe` a named pipe from the host into the container.
        # - `tmpfs` a `tmpfs`.
        # - `volume` a docker volume with the given `Name`.
        #
        # @see DockerEngine::Models::Summary::Mount#type
        module Type
          extend DockerEngine::Internal::Type::Enum

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

      # @see DockerEngine::Models::Summary#network_settings
      class NetworkSettings < DockerEngine::Internal::Type::BaseModel
        # @!attribute networks
        #   Summary of network-settings for each network the container is attached to.
        #
        #   @return [Hash{Symbol=>DockerEngine::Models::Summary::NetworkSettings::Network}, nil]
        optional :networks,
                 -> { DockerEngine::Internal::Type::HashOf[DockerEngine::Summary::NetworkSettings::Network] },
                 api_name: :Networks

        # @!method initialize(networks: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Summary::NetworkSettings} for more details.
        #
        #   Summary of the container's network settings
        #
        #   @param networks [Hash{Symbol=>DockerEngine::Models::Summary::NetworkSettings::Network}] Summary of network-settings for each network the container is

        class Network < DockerEngine::Internal::Type::BaseModel
          # @!attribute aliases
          #
          #   @return [Array<String>, nil]
          optional :aliases, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Aliases

          # @!attribute dns_names
          #   List of all DNS names an endpoint has on a specific network. This list is based
          #   on the container name, network aliases, container short ID, and hostname.
          #
          #   These DNS names are non-fully qualified but can contain several dots. You can
          #   get fully qualified DNS names by appending `.<network-name>`. For instance, if
          #   container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
          #   contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
          #
          #   @return [Array<String>, nil]
          optional :dns_names, DockerEngine::Internal::Type::ArrayOf[String], api_name: :DNSNames

          # @!attribute driver_opts
          #   DriverOpts is a mapping of driver options and values. These options are passed
          #   directly to the driver and are driver specific.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :driver_opts,
                   DockerEngine::Internal::Type::HashOf[String],
                   api_name: :DriverOpts,
                   nil?: true

          # @!attribute endpoint_id
          #   Unique ID for the service endpoint in a Sandbox.
          #
          #   @return [String, nil]
          optional :endpoint_id, String, api_name: :EndpointID

          # @!attribute gateway
          #   Gateway address for this network.
          #
          #   @return [String, nil]
          optional :gateway, String, api_name: :Gateway

          # @!attribute global_i_pv6_address
          #   Global IPv6 address.
          #
          #   @return [String, nil]
          optional :global_i_pv6_address, String, api_name: :GlobalIPv6Address

          # @!attribute global_i_pv6_prefix_len
          #   Mask length of the global IPv6 address.
          #
          #   @return [Integer, nil]
          optional :global_i_pv6_prefix_len, Integer, api_name: :GlobalIPv6PrefixLen

          # @!attribute gw_priority
          #   This property determines which endpoint will provide the default gateway for a
          #   container. The endpoint with the highest priority will be used. If multiple
          #   endpoints have the same priority, endpoints are lexicographically sorted based
          #   on their network name, and the one that sorts first is picked.
          #
          #   @return [Integer, nil]
          optional :gw_priority, Integer, api_name: :GwPriority

          # @!attribute ip_address
          #   IPv4 address.
          #
          #   @return [String, nil]
          optional :ip_address, String, api_name: :IPAddress

          # @!attribute ipam_config
          #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
          #
          #   @return [DockerEngine::Models::Summary::NetworkSettings::Network::IpamConfig, nil]
          optional :ipam_config,
                   -> { DockerEngine::Summary::NetworkSettings::Network::IpamConfig },
                   api_name: :IPAMConfig,
                   nil?: true

          # @!attribute ip_prefix_len
          #   Mask length of the IPv4 address.
          #
          #   @return [Integer, nil]
          optional :ip_prefix_len, Integer, api_name: :IPPrefixLen

          # @!attribute i_pv6_gateway
          #   IPv6 gateway address.
          #
          #   @return [String, nil]
          optional :i_pv6_gateway, String, api_name: :IPv6Gateway

          # @!attribute links
          #
          #   @return [Array<String>, nil]
          optional :links, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Links

          # @!attribute mac_address
          #   MAC address for the endpoint on this network. The network driver might ignore
          #   this parameter.
          #
          #   @return [String, nil]
          optional :mac_address, String, api_name: :MacAddress

          # @!attribute network_id
          #   Unique ID of the network.
          #
          #   @return [String, nil]
          optional :network_id, String, api_name: :NetworkID

          # @!method initialize(aliases: nil, dns_names: nil, driver_opts: nil, endpoint_id: nil, gateway: nil, global_i_pv6_address: nil, global_i_pv6_prefix_len: nil, gw_priority: nil, ip_address: nil, ipam_config: nil, ip_prefix_len: nil, i_pv6_gateway: nil, links: nil, mac_address: nil, network_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngine::Models::Summary::NetworkSettings::Network} for more details.
          #
          #   Configuration for a network endpoint.
          #
          #   @param aliases [Array<String>]
          #
          #   @param dns_names [Array<String>] List of all DNS names an endpoint has on a specific network. This
          #
          #   @param driver_opts [Hash{Symbol=>String}, nil] DriverOpts is a mapping of driver options and values. These options
          #
          #   @param endpoint_id [String] Unique ID for the service endpoint in a Sandbox.
          #
          #   @param gateway [String] Gateway address for this network.
          #
          #   @param global_i_pv6_address [String] Global IPv6 address.
          #
          #   @param global_i_pv6_prefix_len [Integer] Mask length of the global IPv6 address.
          #
          #   @param gw_priority [Integer] This property determines which endpoint will provide the default
          #
          #   @param ip_address [String] IPv4 address.
          #
          #   @param ipam_config [DockerEngine::Models::Summary::NetworkSettings::Network::IpamConfig, nil] EndpointIPAMConfig represents an endpoint's IPAM configuration.
          #
          #   @param ip_prefix_len [Integer] Mask length of the IPv4 address.
          #
          #   @param i_pv6_gateway [String] IPv6 gateway address.
          #
          #   @param links [Array<String>]
          #
          #   @param mac_address [String] MAC address for the endpoint on this network. The network driver might ignore th
          #
          #   @param network_id [String] Unique ID of the network.

          # @see DockerEngine::Models::Summary::NetworkSettings::Network#ipam_config
          class IpamConfig < DockerEngine::Internal::Type::BaseModel
            # @!attribute i_pv4_address
            #
            #   @return [String, nil]
            optional :i_pv4_address, String, api_name: :IPv4Address

            # @!attribute i_pv6_address
            #
            #   @return [String, nil]
            optional :i_pv6_address, String, api_name: :IPv6Address

            # @!attribute link_local_ips
            #
            #   @return [Array<String>, nil]
            optional :link_local_ips, DockerEngine::Internal::Type::ArrayOf[String], api_name: :LinkLocalIPs

            # @!method initialize(i_pv4_address: nil, i_pv6_address: nil, link_local_ips: nil)
            #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
            #
            #   @param i_pv4_address [String]
            #   @param i_pv6_address [String]
            #   @param link_local_ips [Array<String>]
          end
        end
      end

      class Port < DockerEngine::Internal::Type::BaseModel
        # @!attribute private_port
        #   Port on the container
        #
        #   @return [Integer]
        required :private_port, Integer, api_name: :PrivatePort

        # @!attribute type
        #
        #   @return [Symbol, DockerEngine::Models::Summary::Port::Type]
        required :type, enum: -> { DockerEngine::Summary::Port::Type }, api_name: :Type

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
        #   @param type [Symbol, DockerEngine::Models::Summary::Port::Type]
        #
        #   @param ip [String] Host IP address that the container's port is mapped to
        #
        #   @param public_port [Integer] Port exposed on the host

        # @see DockerEngine::Models::Summary::Port#type
        module Type
          extend DockerEngine::Internal::Type::Enum

          TCP = :tcp
          UDP = :udp
          SCTP = :sctp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The state of this container.
      #
      # @see DockerEngine::Models::Summary#state
      module State
        extend DockerEngine::Internal::Type::Enum

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
