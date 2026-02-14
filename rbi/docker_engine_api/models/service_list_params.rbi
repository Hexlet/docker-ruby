# typed: strong

module DockerEngineAPI
  module Models
    class ServiceListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ServiceListParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # services list.
      #
      # Available filters:
      #
      # - `id=<service id>`
      # - `label=<service label>`
      # - `mode=["replicated"|"global"]`
      # - `name=<service name>`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Include service status, with count of running and desired tasks.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :status

      sig { params(status: T::Boolean).void }
      attr_writer :status

      sig do
        params(
          filters: String,
          status: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # services list.
        #
        # Available filters:
        #
        # - `id=<service id>`
        # - `label=<service label>`
        # - `mode=["replicated"|"global"]`
        # - `name=<service name>`
        filters: nil,
        # Include service status, with count of running and desired tasks.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            filters: String,
            status: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
