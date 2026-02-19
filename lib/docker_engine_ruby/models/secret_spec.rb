# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class SecretSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute data
      #   Data is the data to store as a secret, formatted as a standard base64-encoded
      #   ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. It must be
      #   empty if the Driver field is set, in which case the data is loaded from an
      #   external secret store. The maximum allowed size is 500KB, as defined in
      #   [MaxSecretSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
      #
      #   @return [String, nil]
      optional :data, String, api_name: :Data

      # @!attribute driver
      #   Driver represents a driver (network, logging, secrets).
      #
      #   @return [DockerEngineRuby::Models::SecretSpec::Driver, nil]
      optional :driver, -> { DockerEngineRuby::SecretSpec::Driver }, api_name: :Driver

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Object, nil]
      optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

      # @!attribute name
      #   User-defined name of the secret.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute templating
      #   Driver represents a driver (network, logging, secrets).
      #
      #   @return [DockerEngineRuby::Models::SecretSpec::Templating, nil]
      optional :templating, -> { DockerEngineRuby::SecretSpec::Templating }, api_name: :Templating

      # @!method initialize(data: nil, driver: nil, labels: nil, name: nil, templating: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SecretSpec} for more details.
      #
      #   @param data [String] Data is the data to store as a secret, formatted as a standard base64-encoded
      #
      #   @param driver [DockerEngineRuby::Models::SecretSpec::Driver] Driver represents a driver (network, logging, secrets).
      #
      #   @param labels [Object] User-defined key/value metadata.
      #
      #   @param name [String] User-defined name of the secret.
      #
      #   @param templating [DockerEngineRuby::Models::SecretSpec::Templating] Driver represents a driver (network, logging, secrets).

      # @see DockerEngineRuby::Models::SecretSpec#driver
      class Driver < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the driver.
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!attribute options
        #   Key/value map of driver-specific options.
        #
        #   @return [Object, nil]
        optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

        # @!method initialize(name:, options: nil)
        #   Driver represents a driver (network, logging, secrets).
        #
        #   @param name [String] Name of the driver.
        #
        #   @param options [Object] Key/value map of driver-specific options.
      end

      # @see DockerEngineRuby::Models::SecretSpec#templating
      class Templating < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the driver.
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!attribute options
        #   Key/value map of driver-specific options.
        #
        #   @return [Object, nil]
        optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

        # @!method initialize(name:, options: nil)
        #   Driver represents a driver (network, logging, secrets).
        #
        #   @param name [String] Name of the driver.
        #
        #   @param options [Object] Key/value map of driver-specific options.
      end
    end
  end
end
