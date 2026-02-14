# typed: strong

module DockerEngine
  module Models
    class NodeListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::NodeListParams, DockerEngine::Internal::AnyHash)
        end

      # Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      #
      # Available filters:
      #
      # - `id=<node id>`
      # - `label=<engine label>`
      # - `membership=`(`accepted`|`pending`)`
      # - `name=<node name>`
      # - `node.label=<node label>`
      # - `role=`(`manager`|`worker`)`
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
        # Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `id=<node id>`
        # - `label=<engine label>`
        # - `membership=`(`accepted`|`pending`)`
        # - `name=<node name>`
        # - `node.label=<node label>`
        # - `role=`(`manager`|`worker`)`
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
