# typed: strong

module DockerEngineRuby
  module Models
    class SwarmJoinParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SwarmJoinParams,
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

      sig { returns(T.nilable(String)) }
      attr_reader :join_token

      sig { params(join_token: String).void }
      attr_writer :join_token

      sig { returns(T.nilable(String)) }
      attr_reader :listen_addr

      sig { params(listen_addr: String).void }
      attr_writer :listen_addr

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :remote_addrs

      sig { params(remote_addrs: T::Array[String]).void }
      attr_writer :remote_addrs

      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          join_token: String,
          listen_addr: String,
          remote_addrs: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        advertise_addr: nil,
        data_path_addr: nil,
        join_token: nil,
        listen_addr: nil,
        remote_addrs: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            advertise_addr: String,
            data_path_addr: String,
            join_token: String,
            listen_addr: String,
            remote_addrs: T::Array[String],
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
