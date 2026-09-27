# typed: strong

module DockerEngineRuby
  module Models
    class ContainerCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::Config) }
      attr_reader :config

      sig { params(config: DockerEngineRuby::Config::OrHash).void }
      attr_writer :config

      sig { returns(T.nilable(DockerEngineRuby::Container::HostConfig)) }
      attr_reader :host_config

      sig do
        params(
          host_config: DockerEngineRuby::Container::HostConfig::OrHash
        ).void
      end
      attr_writer :host_config

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig do
        params(
          config: DockerEngineRuby::Config::OrHash,
          host_config: DockerEngineRuby::Container::HostConfig::OrHash,
          name: String,
          platform: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        config:,
        host_config: nil,
        name: nil,
        platform: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            config: DockerEngineRuby::Config,
            host_config: DockerEngineRuby::Container::HostConfig,
            name: String,
            platform: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
