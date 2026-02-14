# typed: strong

module DockerEngineAPI
  module Models
    class PluginPullParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginPullParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Remote reference for plugin to install.
      #
      # The `:latest` tag is optional, and is used as the default if omitted.
      sig { returns(String) }
      attr_accessor :remote

      # Local name for the pulled plugin.
      #
      # The `:latest` tag is optional, and is used as the default if omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Array[DockerEngineAPI::Privilege])) }
      attr_reader :body

      sig { params(body: T::Array[DockerEngineAPI::Privilege::OrHash]).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          remote: String,
          name: String,
          body: T::Array[DockerEngineAPI::Privilege::OrHash],
          x_registry_auth: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Remote reference for plugin to install.
        #
        # The `:latest` tag is optional, and is used as the default if omitted.
        remote:,
        # Local name for the pulled plugin.
        #
        # The `:latest` tag is optional, and is used as the default if omitted.
        name: nil,
        body: nil,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            remote: String,
            name: String,
            body: T::Array[DockerEngineAPI::Privilege],
            x_registry_auth: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
