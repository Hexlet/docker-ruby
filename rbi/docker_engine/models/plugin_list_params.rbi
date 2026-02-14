# typed: strong

module DockerEngine
  module Models
    class PluginListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::PluginListParams, DockerEngine::Internal::AnyHash)
        end

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # plugin list.
      #
      # Available filters:
      #
      # - `capability=<capability name>`
      # - `enable=<true>|<false>`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig do
        params(
          filters: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # plugin list.
        #
        # Available filters:
        #
        # - `capability=<capability name>`
        # - `enable=<true>|<false>`
        filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { filters: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
