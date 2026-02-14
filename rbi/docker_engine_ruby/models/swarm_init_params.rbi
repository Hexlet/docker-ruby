# typed: strong

module DockerEngineRuby
  module Models
    class SwarmInitParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SwarmInitParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :advertise_addr

      sig { params(advertise_addr: String).void }
      attr_writer :advertise_addr

      sig { returns(T.nilable(String)) }
      attr_reader :data_path_addr

      sig { params(data_path_addr: String).void }
      attr_writer :data_path_addr

      sig { returns(T.nilable(Integer)) }
      attr_reader :data_path_port

      sig { params(data_path_port: Integer).void }
      attr_writer :data_path_port

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :default_addr_pool

      sig { params(default_addr_pool: T::Array[String]).void }
      attr_writer :default_addr_pool

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force_new_cluster

      sig { params(force_new_cluster: T::Boolean).void }
      attr_writer :force_new_cluster

      sig { returns(T.nilable(String)) }
      attr_reader :listen_addr

      sig { params(listen_addr: String).void }
      attr_writer :listen_addr

      # User modifiable swarm configuration.
      sig { returns(T.nilable(DockerEngineRuby::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::Spec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(Integer)) }
      attr_reader :subnet_size

      sig { params(subnet_size: Integer).void }
      attr_writer :subnet_size

      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          data_path_port: Integer,
          default_addr_pool: T::Array[String],
          force_new_cluster: T::Boolean,
          listen_addr: String,
          spec: DockerEngineRuby::Spec::OrHash,
          subnet_size: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        advertise_addr: nil,
        data_path_addr: nil,
        data_path_port: nil,
        default_addr_pool: nil,
        force_new_cluster: nil,
        listen_addr: nil,
        # User modifiable swarm configuration.
        spec: nil,
        subnet_size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            advertise_addr: String,
            data_path_addr: String,
            data_path_port: Integer,
            default_addr_pool: T::Array[String],
            force_new_cluster: T::Boolean,
            listen_addr: String,
            spec: DockerEngineRuby::Spec,
            subnet_size: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
