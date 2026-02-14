# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#inspect_
    class SwarmAPI < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute created_at
      #   Date and time at which the swarm was initialised in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :CreatedAt

      # @!attribute data_path_port
      #   DataPathPort specifies the data path port number for data traffic. Acceptable
      #   port range is 1024 to 49151. If no port is set or is set to 0, the default port
      #   (4789) is used.
      #
      #   @return [Integer, nil]
      optional :data_path_port, Integer, api_name: :DataPathPort

      # @!attribute default_addr_pool
      #   Default Address Pool specifies default subnet pools for global scope networks.
      #
      #   @return [Array<String>, nil]
      optional :default_addr_pool,
               DockerEngineRuby::Internal::Type::ArrayOf[String],
               api_name: :DefaultAddrPool

      # @!attribute id
      #   The ID of the swarm.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute join_tokens
      #   JoinTokens contains the tokens workers and managers need to join the swarm.
      #
      #   @return [DockerEngineRuby::Models::SwarmAPI::JoinTokens, nil]
      optional :join_tokens, -> { DockerEngineRuby::SwarmAPI::JoinTokens }, api_name: :JoinTokens

      # @!attribute root_rotation_in_progress
      #   Whether there is currently a root CA rotation in progress for the swarm
      #
      #   @return [Boolean, nil]
      optional :root_rotation_in_progress,
               DockerEngineRuby::Internal::Type::Boolean,
               api_name: :RootRotationInProgress

      # @!attribute spec
      #   User modifiable swarm configuration.
      #
      #   @return [DockerEngineRuby::Models::SwarmSpec, nil]
      optional :spec, -> { DockerEngineRuby::SwarmSpec }, api_name: :Spec

      # @!attribute subnet_size
      #   SubnetSize specifies the subnet size of the networks created from the default
      #   subnet pool.
      #
      #   @return [Integer, nil]
      optional :subnet_size, Integer, api_name: :SubnetSize

      # @!attribute tls_info
      #   Information about the issuer of leaf TLS certificates and the trusted root CA
      #   certificate.
      #
      #   @return [DockerEngineRuby::Models::SwarmAPI::TlsInfo, nil]
      optional :tls_info, -> { DockerEngineRuby::SwarmAPI::TlsInfo }, api_name: :TLSInfo

      # @!attribute updated_at
      #   Date and time at which the swarm was last updated in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :UpdatedAt

      # @!attribute version
      #   The version number of the object such as node, service, etc. This is needed to
      #   avoid conflicting writes. The client must send the version number along with the
      #   modified specification when updating these objects.
      #
      #   This approach ensures safe concurrency and determinism in that the change on the
      #   object may not be applied if the version number has changed from the last read.
      #   In other words, if two update requests specify the same base version, only one
      #   of the requests can succeed. As a result, two separate update requests that
      #   happen at the same time will not unintentionally overwrite each other.
      #
      #   @return [DockerEngineRuby::Models::SwarmAPI::Version, nil]
      optional :version, -> { DockerEngineRuby::SwarmAPI::Version }, api_name: :Version

      # @!method initialize(created_at: nil, data_path_port: nil, default_addr_pool: nil, id: nil, join_tokens: nil, root_rotation_in_progress: nil, spec: nil, subnet_size: nil, tls_info: nil, updated_at: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SwarmAPI} for more details.
      #
      #   @param created_at [Time] Date and time at which the swarm was initialised in
      #
      #   @param data_path_port [Integer] DataPathPort specifies the data path port number for data traffic.
      #
      #   @param default_addr_pool [Array<String>] Default Address Pool specifies default subnet pools for global scope
      #
      #   @param id [String] The ID of the swarm.
      #
      #   @param join_tokens [DockerEngineRuby::Models::SwarmAPI::JoinTokens] JoinTokens contains the tokens workers and managers need to join the swarm.
      #
      #   @param root_rotation_in_progress [Boolean] Whether there is currently a root CA rotation in progress for the swarm
      #
      #   @param spec [DockerEngineRuby::Models::SwarmSpec] User modifiable swarm configuration.
      #
      #   @param subnet_size [Integer] SubnetSize specifies the subnet size of the networks created from the
      #
      #   @param tls_info [DockerEngineRuby::Models::SwarmAPI::TlsInfo] Information about the issuer of leaf TLS certificates and the trusted root
      #
      #   @param updated_at [Time] Date and time at which the swarm was last updated in
      #
      #   @param version [DockerEngineRuby::Models::SwarmAPI::Version] The version number of the object such as node, service, etc. This is needed

      # @see DockerEngineRuby::Models::SwarmAPI#join_tokens
      class JoinTokens < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute manager
        #   The token managers can use to join the swarm.
        #
        #   @return [String, nil]
        optional :manager, String, api_name: :Manager

        # @!attribute worker
        #   The token workers can use to join the swarm.
        #
        #   @return [String, nil]
        optional :worker, String, api_name: :Worker

        # @!method initialize(manager: nil, worker: nil)
        #   JoinTokens contains the tokens workers and managers need to join the swarm.
        #
        #   @param manager [String] The token managers can use to join the swarm.
        #
        #   @param worker [String] The token workers can use to join the swarm.
      end

      # @see DockerEngineRuby::Models::SwarmAPI#tls_info
      class TlsInfo < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute cert_issuer_public_key
        #   The base64-url-safe-encoded raw public key bytes of the issuer.
        #
        #   @return [String, nil]
        optional :cert_issuer_public_key, String, api_name: :CertIssuerPublicKey

        # @!attribute cert_issuer_subject
        #   The base64-url-safe-encoded raw subject bytes of the issuer.
        #
        #   @return [String, nil]
        optional :cert_issuer_subject, String, api_name: :CertIssuerSubject

        # @!attribute trust_root
        #   The root CA certificate(s) that are used to validate leaf TLS certificates.
        #
        #   @return [String, nil]
        optional :trust_root, String, api_name: :TrustRoot

        # @!method initialize(cert_issuer_public_key: nil, cert_issuer_subject: nil, trust_root: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::SwarmAPI::TlsInfo} for more details.
        #
        #   Information about the issuer of leaf TLS certificates and the trusted root CA
        #   certificate.
        #
        #   @param cert_issuer_public_key [String] The base64-url-safe-encoded raw public key bytes of the issuer.
        #
        #   @param cert_issuer_subject [String] The base64-url-safe-encoded raw subject bytes of the issuer.
        #
        #   @param trust_root [String] The root CA certificate(s) that are used to validate leaf TLS
      end

      # @see DockerEngineRuby::Models::SwarmAPI#version
      class Version < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute index
        #
        #   @return [Integer, nil]
        optional :index, Integer, api_name: :Index

        # @!method initialize(index: nil)
        #   The version number of the object such as node, service, etc. This is needed to
        #   avoid conflicting writes. The client must send the version number along with the
        #   modified specification when updating these objects.
        #
        #   This approach ensures safe concurrency and determinism in that the change on the
        #   object may not be applied if the version number has changed from the last read.
        #   In other words, if two update requests specify the same base version, only one
        #   of the requests can succeed. As a result, two separate update requests that
        #   happen at the same time will not unintentionally overwrite each other.
        #
        #   @param index [Integer]
      end
    end
  end
end
