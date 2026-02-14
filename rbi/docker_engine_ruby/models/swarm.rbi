# typed: strong

module DockerEngineRuby
  module Models
    class SwarmAPI < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::SwarmAPI, DockerEngineRuby::Internal::AnyHash)
        end

      # Date and time at which the swarm was initialised in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # DataPathPort specifies the data path port number for data traffic. Acceptable
      # port range is 1024 to 49151. If no port is set or is set to 0, the default port
      # (4789) is used.
      sig { returns(T.nilable(Integer)) }
      attr_reader :data_path_port

      sig { params(data_path_port: Integer).void }
      attr_writer :data_path_port

      # Default Address Pool specifies default subnet pools for global scope networks.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :default_addr_pool

      sig { params(default_addr_pool: T::Array[String]).void }
      attr_writer :default_addr_pool

      # The ID of the swarm.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # JoinTokens contains the tokens workers and managers need to join the swarm.
      sig { returns(T.nilable(DockerEngineRuby::SwarmAPI::JoinTokens)) }
      attr_reader :join_tokens

      sig do
        params(join_tokens: DockerEngineRuby::SwarmAPI::JoinTokens::OrHash).void
      end
      attr_writer :join_tokens

      # Whether there is currently a root CA rotation in progress for the swarm
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :root_rotation_in_progress

      sig { params(root_rotation_in_progress: T::Boolean).void }
      attr_writer :root_rotation_in_progress

      # User modifiable swarm configuration.
      sig { returns(T.nilable(DockerEngineRuby::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::Spec::OrHash).void }
      attr_writer :spec

      # SubnetSize specifies the subnet size of the networks created from the default
      # subnet pool.
      sig { returns(T.nilable(Integer)) }
      attr_reader :subnet_size

      sig { params(subnet_size: Integer).void }
      attr_writer :subnet_size

      # Information about the issuer of leaf TLS certificates and the trusted root CA
      # certificate.
      sig { returns(T.nilable(DockerEngineRuby::SwarmAPI::TlsInfo)) }
      attr_reader :tls_info

      sig { params(tls_info: DockerEngineRuby::SwarmAPI::TlsInfo::OrHash).void }
      attr_writer :tls_info

      # Date and time at which the swarm was last updated in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # The version number of the object such as node, service, etc. This is needed to
      # avoid conflicting writes. The client must send the version number along with the
      # modified specification when updating these objects.
      #
      # This approach ensures safe concurrency and determinism in that the change on the
      # object may not be applied if the version number has changed from the last read.
      # In other words, if two update requests specify the same base version, only one
      # of the requests can succeed. As a result, two separate update requests that
      # happen at the same time will not unintentionally overwrite each other.
      sig { returns(T.nilable(DockerEngineRuby::SwarmAPI::Version)) }
      attr_reader :version

      sig { params(version: DockerEngineRuby::SwarmAPI::Version::OrHash).void }
      attr_writer :version

      sig do
        params(
          created_at: String,
          data_path_port: Integer,
          default_addr_pool: T::Array[String],
          id: String,
          join_tokens: DockerEngineRuby::SwarmAPI::JoinTokens::OrHash,
          root_rotation_in_progress: T::Boolean,
          spec: DockerEngineRuby::Spec::OrHash,
          subnet_size: Integer,
          tls_info: DockerEngineRuby::SwarmAPI::TlsInfo::OrHash,
          updated_at: String,
          version: DockerEngineRuby::SwarmAPI::Version::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Date and time at which the swarm was initialised in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        created_at: nil,
        # DataPathPort specifies the data path port number for data traffic. Acceptable
        # port range is 1024 to 49151. If no port is set or is set to 0, the default port
        # (4789) is used.
        data_path_port: nil,
        # Default Address Pool specifies default subnet pools for global scope networks.
        default_addr_pool: nil,
        # The ID of the swarm.
        id: nil,
        # JoinTokens contains the tokens workers and managers need to join the swarm.
        join_tokens: nil,
        # Whether there is currently a root CA rotation in progress for the swarm
        root_rotation_in_progress: nil,
        # User modifiable swarm configuration.
        spec: nil,
        # SubnetSize specifies the subnet size of the networks created from the default
        # subnet pool.
        subnet_size: nil,
        # Information about the issuer of leaf TLS certificates and the trusted root CA
        # certificate.
        tls_info: nil,
        # Date and time at which the swarm was last updated in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        updated_at: nil,
        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        version: nil
      )
      end

      sig do
        override.returns(
          {
            created_at: String,
            data_path_port: Integer,
            default_addr_pool: T::Array[String],
            id: String,
            join_tokens: DockerEngineRuby::SwarmAPI::JoinTokens,
            root_rotation_in_progress: T::Boolean,
            spec: DockerEngineRuby::Spec,
            subnet_size: Integer,
            tls_info: DockerEngineRuby::SwarmAPI::TlsInfo,
            updated_at: String,
            version: DockerEngineRuby::SwarmAPI::Version
          }
        )
      end
      def to_hash
      end

      class JoinTokens < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmAPI::JoinTokens,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # The token managers can use to join the swarm.
        sig { returns(T.nilable(String)) }
        attr_reader :manager

        sig { params(manager: String).void }
        attr_writer :manager

        # The token workers can use to join the swarm.
        sig { returns(T.nilable(String)) }
        attr_reader :worker

        sig { params(worker: String).void }
        attr_writer :worker

        # JoinTokens contains the tokens workers and managers need to join the swarm.
        sig do
          params(manager: String, worker: String).returns(T.attached_class)
        end
        def self.new(
          # The token managers can use to join the swarm.
          manager: nil,
          # The token workers can use to join the swarm.
          worker: nil
        )
        end

        sig { override.returns({ manager: String, worker: String }) }
        def to_hash
        end
      end

      class TlsInfo < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmAPI::TlsInfo,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # The base64-url-safe-encoded raw public key bytes of the issuer.
        sig { returns(T.nilable(String)) }
        attr_reader :cert_issuer_public_key

        sig { params(cert_issuer_public_key: String).void }
        attr_writer :cert_issuer_public_key

        # The base64-url-safe-encoded raw subject bytes of the issuer.
        sig { returns(T.nilable(String)) }
        attr_reader :cert_issuer_subject

        sig { params(cert_issuer_subject: String).void }
        attr_writer :cert_issuer_subject

        # The root CA certificate(s) that are used to validate leaf TLS certificates.
        sig { returns(T.nilable(String)) }
        attr_reader :trust_root

        sig { params(trust_root: String).void }
        attr_writer :trust_root

        # Information about the issuer of leaf TLS certificates and the trusted root CA
        # certificate.
        sig do
          params(
            cert_issuer_public_key: String,
            cert_issuer_subject: String,
            trust_root: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The base64-url-safe-encoded raw public key bytes of the issuer.
          cert_issuer_public_key: nil,
          # The base64-url-safe-encoded raw subject bytes of the issuer.
          cert_issuer_subject: nil,
          # The root CA certificate(s) that are used to validate leaf TLS certificates.
          trust_root: nil
        )
        end

        sig do
          override.returns(
            {
              cert_issuer_public_key: String,
              cert_issuer_subject: String,
              trust_root: String
            }
          )
        end
        def to_hash
        end
      end

      class Version < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::SwarmAPI::Version,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :index

        sig { params(index: Integer).void }
        attr_writer :index

        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        sig { params(index: Integer).returns(T.attached_class) }
        def self.new(index: nil)
        end

        sig { override.returns({ index: Integer }) }
        def to_hash
        end
      end
    end
  end
end
