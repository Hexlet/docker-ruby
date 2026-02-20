# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class ConfigSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute data
      #   Data is the data to store as a config, formatted as a standard base64-encoded
      #   ([RFC 4648](https://tools.ietf.org/html/rfc4648#section-4)) string. The maximum
      #   allowed size is 1000KB, as defined in
      #   [MaxConfigSize](https://pkg.go.dev/github.com/moby/swarmkit/v2
      #
      #   @return [String, nil]
      optional :data, String, api_name: :Data

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute name
      #   User-defined name of the config.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute templating
      #   Driver represents a driver (network, logging, secrets).
      #
      #   @return [DockerEngineRuby::Models::ConfigSpec::Templating, nil]
      optional :templating, -> { DockerEngineRuby::ConfigSpec::Templating }, api_name: :Templating

      # @!method initialize(data: nil, labels: nil, name: nil, templating: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ConfigSpec} for more details.
      #
      #   @param data [String] Data is the data to store as a config, formatted as a standard base64-encoded
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param name [String] User-defined name of the config.
      #
      #   @param templating [DockerEngineRuby::Models::ConfigSpec::Templating] Driver represents a driver (network, logging, secrets).

      # @see DockerEngineRuby::Models::ConfigSpec#templating
      class Templating < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the driver.
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!attribute options
        #   Key/value map of driver-specific options.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :options, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Options

        # @!method initialize(name:, options: nil)
        #   Driver represents a driver (network, logging, secrets).
        #
        #   @param name [String] Name of the driver.
        #
        #   @param options [Hash{Symbol=>String}] Key/value map of driver-specific options.
      end
    end
  end
end
