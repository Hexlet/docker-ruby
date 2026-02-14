# typed: strong

module DockerEngineRuby
  module Models
    class ConfigListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ConfigListParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # configs list.
      #
      # Available filters:
      #
      # - `id=<config id>`
      # - `label=<key> or label=<key>=value`
      # - `name=<config name>`
      # - `names=<config name>`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # configs list.
        #
        # Available filters:
        #
        # - `id=<config id>`
        # - `label=<key> or label=<key>=value`
        # - `name=<config name>`
        # - `names=<config name>`
        filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { filters: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
