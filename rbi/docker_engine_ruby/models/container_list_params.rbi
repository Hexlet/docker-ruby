# typed: strong

module DockerEngineRuby
  module Models
    class ContainerListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerListParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Return all containers. By default, only running containers are shown.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all

      sig { params(all: T::Boolean).void }
      attr_writer :all

      # Filters to process on the container list, encoded as JSON (a
      # `map[string][]string`). For example, `{"status": ["paused"]}` will only return
      # paused containers.
      #
      # Available filters:
      #
      # - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
      # - `before`=(`<container id>` or `<container name>`)
      # - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      # - `exited=<int>` containers with exit code of `<int>`
      # - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
      # - `id=<ID>` a container's ID
      # - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
      # - `is-task=`(`true`|`false`)
      # - `label=key` or `label="key=value"` of a container label
      # - `name=<name>` a container's name
      # - `network`=(`<network id>` or `<network name>`)
      # - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      # - `since`=(`<container id>` or `<container name>`)
      # - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
      # - `volume`=(`<volume name>` or `<mount point destination>`)
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Return this number of most recently created containers, including non-running
      # ones.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Return the size of container as fields `SizeRw` and `SizeRootFs`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :size

      sig { params(size: T::Boolean).void }
      attr_writer :size

      sig do
        params(
          all: T::Boolean,
          filters: String,
          limit: Integer,
          size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Return all containers. By default, only running containers are shown.
        all: nil,
        # Filters to process on the container list, encoded as JSON (a
        # `map[string][]string`). For example, `{"status": ["paused"]}` will only return
        # paused containers.
        #
        # Available filters:
        #
        # - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
        # - `before`=(`<container id>` or `<container name>`)
        # - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
        # - `exited=<int>` containers with exit code of `<int>`
        # - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
        # - `id=<ID>` a container's ID
        # - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
        # - `is-task=`(`true`|`false`)
        # - `label=key` or `label="key=value"` of a container label
        # - `name=<name>` a container's name
        # - `network`=(`<network id>` or `<network name>`)
        # - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
        # - `since`=(`<container id>` or `<container name>`)
        # - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
        # - `volume`=(`<volume name>` or `<mount point destination>`)
        filters: nil,
        # Return this number of most recently created containers, including non-running
        # ones.
        limit: nil,
        # Return the size of container as fields `SizeRw` and `SizeRootFs`.
        size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            filters: String,
            limit: Integer,
            size: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
