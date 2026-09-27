# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#create
    class ContainerCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute config
      #
      #   @return [DockerEngineRuby::Models::Config]
      required :config, -> { DockerEngineRuby::Config }

      # @!attribute host_config
      #   Контейнерные настройки хоста: монтирования, сеть, лимиты.
      #
      #   @return [DockerEngineRuby::Models::Container::HostConfig, nil]
      optional :host_config, -> { DockerEngineRuby::Container::HostConfig }

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute platform
      #
      #   @return [String, nil]
      optional :platform, String

      # @!method initialize(config:, host_config: nil, name: nil, platform: nil, request_options: {})
      #   @param config [DockerEngineRuby::Models::Config]
      #   @param host_config [DockerEngineRuby::Models::Container::HostConfig]
      #   @param name [String]
      #   @param platform [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
