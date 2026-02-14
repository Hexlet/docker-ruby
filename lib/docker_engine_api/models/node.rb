# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Nodes#inspect_
    class Node < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute created_at
      #   Date and time at which the node was added to the swarm in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :CreatedAt

      # @!attribute description
      #   NodeDescription encapsulates the properties of the Node as reported by the
      #   agent.
      #
      #   @return [DockerEngineAPI::Models::Node::Description, nil]
      optional :description, -> { DockerEngineAPI::Node::Description }, api_name: :Description

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute manager_status
      #   ManagerStatus represents the status of a manager.
      #
      #   It provides the current status of a node's manager component, if the node is a
      #   manager.
      #
      #   @return [DockerEngineAPI::Models::Node::ManagerStatus, nil]
      optional :manager_status,
               -> { DockerEngineAPI::Node::ManagerStatus },
               api_name: :ManagerStatus,
               nil?: true

      # @!attribute spec
      #
      #   @return [DockerEngineAPI::Models::Spec, nil]
      optional :spec, -> { DockerEngineAPI::Spec }, api_name: :Spec

      # @!attribute status
      #   NodeStatus represents the status of a node.
      #
      #   It provides the current status of the node, as seen by the manager.
      #
      #   @return [DockerEngineAPI::Models::Node::Status, nil]
      optional :status, -> { DockerEngineAPI::Node::Status }, api_name: :Status

      # @!attribute updated_at
      #   Date and time at which the node was last updated in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   @return [String, nil]
      optional :updated_at, String, api_name: :UpdatedAt

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
      #   @return [DockerEngineAPI::Models::Node::Version, nil]
      optional :version, -> { DockerEngineAPI::Node::Version }, api_name: :Version

      # @!method initialize(created_at: nil, description: nil, id: nil, manager_status: nil, spec: nil, status: nil, updated_at: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::Node} for more details.
      #
      #   @param created_at [String] Date and time at which the node was added to the swarm in
      #
      #   @param description [DockerEngineAPI::Models::Node::Description] NodeDescription encapsulates the properties of the Node as reported by the
      #
      #   @param id [String]
      #
      #   @param manager_status [DockerEngineAPI::Models::Node::ManagerStatus, nil] ManagerStatus represents the status of a manager.
      #
      #   @param spec [DockerEngineAPI::Models::Spec]
      #
      #   @param status [DockerEngineAPI::Models::Node::Status] NodeStatus represents the status of a node.
      #
      #   @param updated_at [String] Date and time at which the node was last updated in
      #
      #   @param version [DockerEngineAPI::Models::Node::Version] The version number of the object such as node, service, etc. This is needed

      # @see DockerEngineAPI::Models::Node#description
      class Description < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute engine
        #   EngineDescription provides information about an engine.
        #
        #   @return [DockerEngineAPI::Models::Node::Description::Engine, nil]
        optional :engine, -> { DockerEngineAPI::Node::Description::Engine }, api_name: :Engine

        # @!attribute hostname
        #
        #   @return [String, nil]
        optional :hostname, String, api_name: :Hostname

        # @!attribute platform
        #   Platform represents the platform (Arch/OS).
        #
        #   @return [DockerEngineAPI::Models::Node::Description::Platform, nil]
        optional :platform, -> { DockerEngineAPI::Node::Description::Platform }, api_name: :Platform

        # @!attribute resources
        #   An object describing the resources which can be advertised by a node and
        #   requested by a task.
        #
        #   @return [DockerEngineAPI::Models::Node::Description::Resources, nil]
        optional :resources, -> { DockerEngineAPI::Node::Description::Resources }, api_name: :Resources

        # @!attribute tls_info
        #   Information about the issuer of leaf TLS certificates and the trusted root CA
        #   certificate.
        #
        #   @return [DockerEngineAPI::Models::Node::Description::TlsInfo, nil]
        optional :tls_info, -> { DockerEngineAPI::Node::Description::TlsInfo }, api_name: :TLSInfo

        # @!method initialize(engine: nil, hostname: nil, platform: nil, resources: nil, tls_info: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Node::Description} for more details.
        #
        #   NodeDescription encapsulates the properties of the Node as reported by the
        #   agent.
        #
        #   @param engine [DockerEngineAPI::Models::Node::Description::Engine] EngineDescription provides information about an engine.
        #
        #   @param hostname [String]
        #
        #   @param platform [DockerEngineAPI::Models::Node::Description::Platform] Platform represents the platform (Arch/OS).
        #
        #   @param resources [DockerEngineAPI::Models::Node::Description::Resources] An object describing the resources which can be advertised by a node and
        #
        #   @param tls_info [DockerEngineAPI::Models::Node::Description::TlsInfo] Information about the issuer of leaf TLS certificates and the trusted root

        # @see DockerEngineAPI::Models::Node::Description#engine
        class Engine < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute engine_version
          #
          #   @return [String, nil]
          optional :engine_version, String, api_name: :EngineVersion

          # @!attribute labels
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :labels, DockerEngineAPI::Internal::Type::HashOf[String], api_name: :Labels

          # @!attribute plugins
          #
          #   @return [Array<DockerEngineAPI::Models::Node::Description::Engine::Plugin>, nil]
          optional :plugins,
                   -> {
                     DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Node::Description::Engine::Plugin]
                   },
                   api_name: :Plugins

          # @!method initialize(engine_version: nil, labels: nil, plugins: nil)
          #   EngineDescription provides information about an engine.
          #
          #   @param engine_version [String]
          #   @param labels [Hash{Symbol=>String}]
          #   @param plugins [Array<DockerEngineAPI::Models::Node::Description::Engine::Plugin>]

          class Plugin < DockerEngineAPI::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, api_name: :Type

            # @!method initialize(name: nil, type: nil)
            #   @param name [String]
            #   @param type [String]
          end
        end

        # @see DockerEngineAPI::Models::Node::Description#platform
        class Platform < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute architecture
          #   Architecture represents the hardware architecture (for example, `x86_64`).
          #
          #   @return [String, nil]
          optional :architecture, String, api_name: :Architecture

          # @!attribute os
          #   OS represents the Operating System (for example, `linux` or `windows`).
          #
          #   @return [String, nil]
          optional :os, String, api_name: :OS

          # @!method initialize(architecture: nil, os: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Node::Description::Platform} for more details.
          #
          #   Platform represents the platform (Arch/OS).
          #
          #   @param architecture [String] Architecture represents the hardware architecture (for example,
          #
          #   @param os [String] OS represents the Operating System (for example, `linux` or `windows`).
        end

        # @see DockerEngineAPI::Models::Node::Description#resources
        class Resources < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute generic_resources
          #   User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
          #   resources (e.g, `GPU=UUID1`).
          #
          #   @return [Array<DockerEngineAPI::Models::Node::Description::Resources::GenericResource>, nil]
          optional :generic_resources,
                   -> {
                     DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Node::Description::Resources::GenericResource]
                   },
                   api_name: :GenericResources

          # @!attribute memory_bytes
          #
          #   @return [Integer, nil]
          optional :memory_bytes, Integer, api_name: :MemoryBytes

          # @!attribute nano_cpus
          #
          #   @return [Integer, nil]
          optional :nano_cpus, Integer, api_name: :NanoCPUs

          # @!method initialize(generic_resources: nil, memory_bytes: nil, nano_cpus: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Node::Description::Resources} for more details.
          #
          #   An object describing the resources which can be advertised by a node and
          #   requested by a task.
          #
          #   @param generic_resources [Array<DockerEngineAPI::Models::Node::Description::Resources::GenericResource>] User-defined resources can be either Integer resources (e.g, `SSD=3`) or
          #
          #   @param memory_bytes [Integer]
          #
          #   @param nano_cpus [Integer]

          class GenericResource < DockerEngineAPI::Internal::Type::BaseModel
            # @!attribute discrete_resource_spec
            #
            #   @return [DockerEngineAPI::Models::Node::Description::Resources::GenericResource::DiscreteResourceSpec, nil]
            optional :discrete_resource_spec,
                     -> {
                       DockerEngineAPI::Node::Description::Resources::GenericResource::DiscreteResourceSpec
                     },
                     api_name: :DiscreteResourceSpec

            # @!attribute named_resource_spec
            #
            #   @return [DockerEngineAPI::Models::Node::Description::Resources::GenericResource::NamedResourceSpec, nil]
            optional :named_resource_spec,
                     -> { DockerEngineAPI::Node::Description::Resources::GenericResource::NamedResourceSpec },
                     api_name: :NamedResourceSpec

            # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
            #   @param discrete_resource_spec [DockerEngineAPI::Models::Node::Description::Resources::GenericResource::DiscreteResourceSpec]
            #   @param named_resource_spec [DockerEngineAPI::Models::Node::Description::Resources::GenericResource::NamedResourceSpec]

            # @see DockerEngineAPI::Models::Node::Description::Resources::GenericResource#discrete_resource_spec
            class DiscreteResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
              # @!attribute kind
              #
              #   @return [String, nil]
              optional :kind, String, api_name: :Kind

              # @!attribute value
              #
              #   @return [Integer, nil]
              optional :value, Integer, api_name: :Value

              # @!method initialize(kind: nil, value: nil)
              #   @param kind [String]
              #   @param value [Integer]
            end

            # @see DockerEngineAPI::Models::Node::Description::Resources::GenericResource#named_resource_spec
            class NamedResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
              # @!attribute kind
              #
              #   @return [String, nil]
              optional :kind, String, api_name: :Kind

              # @!attribute value
              #
              #   @return [String, nil]
              optional :value, String, api_name: :Value

              # @!method initialize(kind: nil, value: nil)
              #   @param kind [String]
              #   @param value [String]
            end
          end
        end

        # @see DockerEngineAPI::Models::Node::Description#tls_info
        class TlsInfo < DockerEngineAPI::Internal::Type::BaseModel
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
          #   {DockerEngineAPI::Models::Node::Description::TlsInfo} for more details.
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
      end

      # @see DockerEngineAPI::Models::Node#manager_status
      class ManagerStatus < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute addr
        #   The IP address and port at which the manager is reachable.
        #
        #   @return [String, nil]
        optional :addr, String, api_name: :Addr

        # @!attribute leader
        #
        #   @return [Boolean, nil]
        optional :leader, DockerEngineAPI::Internal::Type::Boolean, api_name: :Leader

        # @!attribute reachability
        #   Reachability represents the reachability of a node.
        #
        #   @return [Symbol, DockerEngineAPI::Models::Node::ManagerStatus::Reachability, nil]
        optional :reachability,
                 enum: -> { DockerEngineAPI::Node::ManagerStatus::Reachability },
                 api_name: :Reachability

        # @!method initialize(addr: nil, leader: nil, reachability: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Node::ManagerStatus} for more details.
        #
        #   ManagerStatus represents the status of a manager.
        #
        #   It provides the current status of a node's manager component, if the node is a
        #   manager.
        #
        #   @param addr [String] The IP address and port at which the manager is reachable.
        #
        #   @param leader [Boolean]
        #
        #   @param reachability [Symbol, DockerEngineAPI::Models::Node::ManagerStatus::Reachability] Reachability represents the reachability of a node.

        # Reachability represents the reachability of a node.
        #
        # @see DockerEngineAPI::Models::Node::ManagerStatus#reachability
        module Reachability
          extend DockerEngineAPI::Internal::Type::Enum

          UNKNOWN = :unknown
          UNREACHABLE = :unreachable
          REACHABLE = :reachable

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineAPI::Models::Node#status
      class Status < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute addr
        #   IP address of the node.
        #
        #   @return [String, nil]
        optional :addr, String, api_name: :Addr

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String, api_name: :Message

        # @!attribute state
        #   NodeState represents the state of a node.
        #
        #   @return [Symbol, DockerEngineAPI::Models::Node::Status::State, nil]
        optional :state, enum: -> { DockerEngineAPI::Node::Status::State }, api_name: :State

        # @!method initialize(addr: nil, message: nil, state: nil)
        #   NodeStatus represents the status of a node.
        #
        #   It provides the current status of the node, as seen by the manager.
        #
        #   @param addr [String] IP address of the node.
        #
        #   @param message [String]
        #
        #   @param state [Symbol, DockerEngineAPI::Models::Node::Status::State] NodeState represents the state of a node.

        # NodeState represents the state of a node.
        #
        # @see DockerEngineAPI::Models::Node::Status#state
        module State
          extend DockerEngineAPI::Internal::Type::Enum

          UNKNOWN = :unknown
          DOWN = :down
          READY = :ready
          DISCONNECTED = :disconnected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineAPI::Models::Node#version
      class Version < DockerEngineAPI::Internal::Type::BaseModel
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
