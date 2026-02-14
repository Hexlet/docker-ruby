# typed: strong

module DockerEngineRuby
  module Models
    class ImageBuildPruneParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageBuildPruneParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Remove all types of build cache
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all

      sig { params(all: T::Boolean).void }
      attr_writer :all

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # list of build cache objects.
      #
      # Available filters:
      #
      # - `until=<timestamp>` remove cache older than `<timestamp>`. The `<timestamp>`
      #   can be Unix timestamps, date formatted timestamps, or Go duration strings
      #   (e.g. `10m`, `1h30m`) computed relative to the daemon's local time.
      # - `id=<id>`
      # - `parent=<id>`
      # - `type=<string>`
      # - `description=<string>`
      # - `inuse`
      # - `shared`
      # - `private`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Maximum amount of disk space allowed to keep for cache
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_used_space

      sig { params(max_used_space: Integer).void }
      attr_writer :max_used_space

      # Target amount of free disk space after pruning
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_free_space

      sig { params(min_free_space: Integer).void }
      attr_writer :min_free_space

      # Amount of disk space in bytes to keep for cache
      sig { returns(T.nilable(Integer)) }
      attr_reader :reserved_space

      sig { params(reserved_space: Integer).void }
      attr_writer :reserved_space

      sig do
        params(
          all: T::Boolean,
          filters: String,
          max_used_space: Integer,
          min_free_space: Integer,
          reserved_space: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Remove all types of build cache
        all: nil,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # list of build cache objects.
        #
        # Available filters:
        #
        # - `until=<timestamp>` remove cache older than `<timestamp>`. The `<timestamp>`
        #   can be Unix timestamps, date formatted timestamps, or Go duration strings
        #   (e.g. `10m`, `1h30m`) computed relative to the daemon's local time.
        # - `id=<id>`
        # - `parent=<id>`
        # - `type=<string>`
        # - `description=<string>`
        # - `inuse`
        # - `shared`
        # - `private`
        filters: nil,
        # Maximum amount of disk space allowed to keep for cache
        max_used_space: nil,
        # Target amount of free disk space after pruning
        min_free_space: nil,
        # Amount of disk space in bytes to keep for cache
        reserved_space: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            filters: String,
            max_used_space: Integer,
            min_free_space: Integer,
            reserved_space: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
