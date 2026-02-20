# typed: strong

module DockerEngineRuby
  module Models
    class ConfigSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ConfigSpec,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Data is the data to store as a config, formatted as a standard base64-encoded
      # ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. The maximum
      # allowed size is 1000KB, as defined in
      # [MaxConfigSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
      sig { returns(T.nilable(String)) }
      attr_reader :data

      sig { params(data: String).void }
      attr_writer :data

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # User-defined name of the config.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Driver represents a driver (network, logging, secrets).
      sig { returns(T.nilable(DockerEngineRuby::ConfigSpec::Templating)) }
      attr_reader :templating

      sig do
        params(
          templating: DockerEngineRuby::ConfigSpec::Templating::OrHash
        ).void
      end
      attr_writer :templating

      sig do
        params(
          data: String,
          labels: T::Hash[Symbol, String],
          name: String,
          templating: DockerEngineRuby::ConfigSpec::Templating::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Data is the data to store as a config, formatted as a standard base64-encoded
        # ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. The maximum
        # allowed size is 1000KB, as defined in
        # [MaxConfigSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
        data: nil,
        # User-defined key/value metadata.
        labels: nil,
        # User-defined name of the config.
        name: nil,
        # Driver represents a driver (network, logging, secrets).
        templating: nil
      )
      end

      sig do
        override.returns(
          {
            data: String,
            labels: T::Hash[Symbol, String],
            name: String,
            templating: DockerEngineRuby::ConfigSpec::Templating
          }
        )
      end
      def to_hash
      end

      class Templating < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ConfigSpec::Templating,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Name of the driver.
        sig { returns(String) }
        attr_accessor :name

        # Key/value map of driver-specific options.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :options

        sig { params(options: T::Hash[Symbol, String]).void }
        attr_writer :options

        # Driver represents a driver (network, logging, secrets).
        sig do
          params(name: String, options: T::Hash[Symbol, String]).returns(
            T.attached_class
          )
        end
        def self.new(
          # Name of the driver.
          name:,
          # Key/value map of driver-specific options.
          options: nil
        )
        end

        sig do
          override.returns({ name: String, options: T::Hash[Symbol, String] })
        end
        def to_hash
        end
      end
    end
  end
end
