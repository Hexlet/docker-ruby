# typed: strong

module DockerEngineRuby
  module Models
    class SecretSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SecretSpec,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Data is the data to store as a secret, formatted as a standard base64-encoded
      # ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. It must be
      # empty if the Driver field is set, in which case the data is loaded from an
      # external secret store. The maximum allowed size is 500KB, as defined in
      # [MaxSecretSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
      sig { returns(T.nilable(String)) }
      attr_reader :data

      sig { params(data: String).void }
      attr_writer :data

      # Driver represents a driver (network, logging, secrets).
      sig { returns(T.nilable(DockerEngineRuby::SecretSpec::Driver)) }
      attr_reader :driver

      sig { params(driver: DockerEngineRuby::SecretSpec::Driver::OrHash).void }
      attr_writer :driver

      # User-defined key/value metadata.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :labels

      sig { params(labels: T.anything).void }
      attr_writer :labels

      # User-defined name of the secret.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Driver represents a driver (network, logging, secrets).
      sig { returns(T.nilable(DockerEngineRuby::SecretSpec::Templating)) }
      attr_reader :templating

      sig do
        params(
          templating: DockerEngineRuby::SecretSpec::Templating::OrHash
        ).void
      end
      attr_writer :templating

      sig do
        params(
          data: String,
          driver: DockerEngineRuby::SecretSpec::Driver::OrHash,
          labels: T.anything,
          name: String,
          templating: DockerEngineRuby::SecretSpec::Templating::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Data is the data to store as a secret, formatted as a standard base64-encoded
        # ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. It must be
        # empty if the Driver field is set, in which case the data is loaded from an
        # external secret store. The maximum allowed size is 500KB, as defined in
        # [MaxSecretSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
        data: nil,
        # Driver represents a driver (network, logging, secrets).
        driver: nil,
        # User-defined key/value metadata.
        labels: nil,
        # User-defined name of the secret.
        name: nil,
        # Driver represents a driver (network, logging, secrets).
        templating: nil
      )
      end

      sig do
        override.returns(
          {
            data: String,
            driver: DockerEngineRuby::SecretSpec::Driver,
            labels: T.anything,
            name: String,
            templating: DockerEngineRuby::SecretSpec::Templating
          }
        )
      end
      def to_hash
      end

      class Driver < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SecretSpec::Driver,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Name of the driver.
        sig { returns(String) }
        attr_accessor :name

        # Key/value map of driver-specific options.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :options

        sig { params(options: T.anything).void }
        attr_writer :options

        # Driver represents a driver (network, logging, secrets).
        sig do
          params(name: String, options: T.anything).returns(T.attached_class)
        end
        def self.new(
          # Name of the driver.
          name:,
          # Key/value map of driver-specific options.
          options: nil
        )
        end

        sig { override.returns({ name: String, options: T.anything }) }
        def to_hash
        end
      end

      class Templating < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SecretSpec::Templating,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Name of the driver.
        sig { returns(String) }
        attr_accessor :name

        # Key/value map of driver-specific options.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :options

        sig { params(options: T.anything).void }
        attr_writer :options

        # Driver represents a driver (network, logging, secrets).
        sig do
          params(name: String, options: T.anything).returns(T.attached_class)
        end
        def self.new(
          # Name of the driver.
          name:,
          # Key/value map of driver-specific options.
          options: nil
        )
        end

        sig { override.returns({ name: String, options: T.anything }) }
        def to_hash
        end
      end
    end
  end
end
