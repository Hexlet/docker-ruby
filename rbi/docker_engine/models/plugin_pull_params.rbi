# typed: strong

module DockerEngine
  module Models
    class PluginPullParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::PluginPullParams, DockerEngine::Internal::AnyHash)
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

      sig { returns(T.nilable(T::Array[DockerEngine::Privilege])) }
      attr_reader :body

      sig { params(body: T::Array[DockerEngine::Privilege::OrHash]).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          remote: String,
          name: String,
          body: T::Array[DockerEngine::Privilege::OrHash],
          x_registry_auth: String,
          request_options: DockerEngine::RequestOptions::OrHash
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
            body: T::Array[DockerEngine::Privilege],
            x_registry_auth: String,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
