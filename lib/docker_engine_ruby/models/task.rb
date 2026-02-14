# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Tasks#inspect_
    class Task < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute assigned_generic_resources
      #   User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
      #   resources (e.g, `GPU=UUID1`).
      #
      #   @return [Array<DockerEngineRuby::Models::Task::AssignedGenericResource>, nil]
      optional :assigned_generic_resources,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task::AssignedGenericResource]
               },
               api_name: :AssignedGenericResources

      # @!attribute created_at
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :CreatedAt

      # @!attribute desired_state
      #
      #   @return [Symbol, DockerEngineRuby::Models::Task::DesiredState, nil]
      optional :desired_state, enum: -> { DockerEngineRuby::Task::DesiredState }, api_name: :DesiredState

      # @!attribute id
      #   The ID of the task.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute job_iteration
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
      #   @return [DockerEngineRuby::Models::Task::JobIteration, nil]
      optional :job_iteration, -> { DockerEngineRuby::Task::JobIteration }, api_name: :JobIteration

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute name
      #   Name of the task.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute node_id
      #   The ID of the node that this task is on.
      #
      #   @return [String, nil]
      optional :node_id, String, api_name: :NodeID

      # @!attribute service_id
      #   The ID of the service this task is part of.
      #
      #   @return [String, nil]
      optional :service_id, String, api_name: :ServiceID

      # @!attribute slot
      #
      #   @return [Integer, nil]
      optional :slot, Integer, api_name: :Slot

      # @!attribute spec
      #   User modifiable task configuration.
      #
      #   @return [DockerEngineRuby::Models::Spec, nil]
      optional :spec, -> { DockerEngineRuby::Spec }, api_name: :Spec

      # @!attribute status
      #   represents the status of a task.
      #
      #   @return [DockerEngineRuby::Models::Task::Status, nil]
      optional :status, -> { DockerEngineRuby::Task::Status }, api_name: :Status

      # @!attribute updated_at
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
      #   @return [DockerEngineRuby::Models::Task::Version, nil]
      optional :version, -> { DockerEngineRuby::Task::Version }, api_name: :Version

      # @!method initialize(assigned_generic_resources: nil, created_at: nil, desired_state: nil, id: nil, job_iteration: nil, labels: nil, name: nil, node_id: nil, service_id: nil, slot: nil, spec: nil, status: nil, updated_at: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Task} for more details.
      #
      #   @param assigned_generic_resources [Array<DockerEngineRuby::Models::Task::AssignedGenericResource>] User-defined resources can be either Integer resources (e.g, `SSD=3`) or
      #
      #   @param created_at [String]
      #
      #   @param desired_state [Symbol, DockerEngineRuby::Models::Task::DesiredState]
      #
      #   @param id [String] The ID of the task.
      #
      #   @param job_iteration [DockerEngineRuby::Models::Task::JobIteration] The version number of the object such as node, service, etc. This is needed
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param name [String] Name of the task.
      #
      #   @param node_id [String] The ID of the node that this task is on.
      #
      #   @param service_id [String] The ID of the service this task is part of.
      #
      #   @param slot [Integer]
      #
      #   @param spec [DockerEngineRuby::Models::Spec] User modifiable task configuration.
      #
      #   @param status [DockerEngineRuby::Models::Task::Status] represents the status of a task.
      #
      #   @param updated_at [String]
      #
      #   @param version [DockerEngineRuby::Models::Task::Version] The version number of the object such as node, service, etc. This is needed

      class AssignedGenericResource < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute discrete_resource_spec
        #
        #   @return [DockerEngineRuby::Models::Task::AssignedGenericResource::DiscreteResourceSpec, nil]
        optional :discrete_resource_spec,
                 -> { DockerEngineRuby::Task::AssignedGenericResource::DiscreteResourceSpec },
                 api_name: :DiscreteResourceSpec

        # @!attribute named_resource_spec
        #
        #   @return [DockerEngineRuby::Models::Task::AssignedGenericResource::NamedResourceSpec, nil]
        optional :named_resource_spec,
                 -> { DockerEngineRuby::Task::AssignedGenericResource::NamedResourceSpec },
                 api_name: :NamedResourceSpec

        # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
        #   @param discrete_resource_spec [DockerEngineRuby::Models::Task::AssignedGenericResource::DiscreteResourceSpec]
        #   @param named_resource_spec [DockerEngineRuby::Models::Task::AssignedGenericResource::NamedResourceSpec]

        # @see DockerEngineRuby::Models::Task::AssignedGenericResource#discrete_resource_spec
        class DiscreteResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
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

        # @see DockerEngineRuby::Models::Task::AssignedGenericResource#named_resource_spec
        class NamedResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
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

      # @see DockerEngineRuby::Models::Task#desired_state
      module DesiredState
        extend DockerEngineRuby::Internal::Type::Enum

        NEW = :new
        ALLOCATED = :allocated
        PENDING = :pending
        ASSIGNED = :assigned
        ACCEPTED = :accepted
        PREPARING = :preparing
        READY = :ready
        STARTING = :starting
        RUNNING = :running
        COMPLETE = :complete
        SHUTDOWN = :shutdown
        FAILED = :failed
        REJECTED = :rejected
        REMOVE = :remove
        ORPHANED = :orphaned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DockerEngineRuby::Models::Task#job_iteration
      class JobIteration < DockerEngineRuby::Internal::Type::BaseModel
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

      # @see DockerEngineRuby::Models::Task#status
      class Status < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute container_status
        #   represents the status of a container.
        #
        #   @return [DockerEngineRuby::Models::Task::Status::ContainerStatus, nil]
        optional :container_status,
                 -> { DockerEngineRuby::Task::Status::ContainerStatus },
                 api_name: :ContainerStatus

        # @!attribute err
        #
        #   @return [String, nil]
        optional :err, String, api_name: :Err

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String, api_name: :Message

        # @!attribute port_status
        #   represents the port status of a task's host ports whose service has published
        #   host ports
        #
        #   @return [DockerEngineRuby::Models::Task::Status::PortStatus, nil]
        optional :port_status, -> { DockerEngineRuby::Task::Status::PortStatus }, api_name: :PortStatus

        # @!attribute state
        #
        #   @return [Symbol, DockerEngineRuby::Models::Task::Status::State, nil]
        optional :state, enum: -> { DockerEngineRuby::Task::Status::State }, api_name: :State

        # @!attribute timestamp
        #
        #   @return [String, nil]
        optional :timestamp, String, api_name: :Timestamp

        # @!method initialize(container_status: nil, err: nil, message: nil, port_status: nil, state: nil, timestamp: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Task::Status} for more details.
        #
        #   represents the status of a task.
        #
        #   @param container_status [DockerEngineRuby::Models::Task::Status::ContainerStatus] represents the status of a container.
        #
        #   @param err [String]
        #
        #   @param message [String]
        #
        #   @param port_status [DockerEngineRuby::Models::Task::Status::PortStatus] represents the port status of a task's host ports whose service has published ho
        #
        #   @param state [Symbol, DockerEngineRuby::Models::Task::Status::State]
        #
        #   @param timestamp [String]

        # @see DockerEngineRuby::Models::Task::Status#container_status
        class ContainerStatus < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute container_id
          #
          #   @return [String, nil]
          optional :container_id, String, api_name: :ContainerID

          # @!attribute exit_code
          #
          #   @return [Integer, nil]
          optional :exit_code, Integer, api_name: :ExitCode

          # @!attribute pid
          #
          #   @return [Integer, nil]
          optional :pid, Integer, api_name: :PID

          # @!method initialize(container_id: nil, exit_code: nil, pid: nil)
          #   represents the status of a container.
          #
          #   @param container_id [String]
          #   @param exit_code [Integer]
          #   @param pid [Integer]
        end

        # @see DockerEngineRuby::Models::Task::Status#port_status
        class PortStatus < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute ports
          #
          #   @return [Array<DockerEngineRuby::Models::Task::Status::PortStatus::Port>, nil]
          optional :ports,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task::Status::PortStatus::Port]
                   },
                   api_name: :Ports

          # @!method initialize(ports: nil)
          #   represents the port status of a task's host ports whose service has published
          #   host ports
          #
          #   @param ports [Array<DockerEngineRuby::Models::Task::Status::PortStatus::Port>]

          class Port < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute protocol
            #
            #   @return [Symbol, DockerEngineRuby::Models::Task::Status::PortStatus::Port::Protocol, nil]
            optional :protocol,
                     enum: -> { DockerEngineRuby::Task::Status::PortStatus::Port::Protocol },
                     api_name: :Protocol

            # @!attribute published_port
            #   The port on the swarm hosts.
            #
            #   @return [Integer, nil]
            optional :published_port, Integer, api_name: :PublishedPort

            # @!attribute publish_mode
            #   The mode in which port is published.
            #
            #   <p><br /></p>
            #
            #   - "ingress" makes the target port accessible on every node, regardless of
            #     whether there is a task for the service running on that node or not.
            #   - "host" bypasses the routing mesh and publish the port directly on the swarm
            #     node where that service is running.
            #
            #   @return [Symbol, DockerEngineRuby::Models::Task::Status::PortStatus::Port::PublishMode, nil]
            optional :publish_mode,
                     enum: -> { DockerEngineRuby::Task::Status::PortStatus::Port::PublishMode },
                     api_name: :PublishMode

            # @!attribute target_port
            #   The port inside the container.
            #
            #   @return [Integer, nil]
            optional :target_port, Integer, api_name: :TargetPort

            # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineRuby::Models::Task::Status::PortStatus::Port} for more details.
            #
            #   @param name [String]
            #
            #   @param protocol [Symbol, DockerEngineRuby::Models::Task::Status::PortStatus::Port::Protocol]
            #
            #   @param published_port [Integer] The port on the swarm hosts.
            #
            #   @param publish_mode [Symbol, DockerEngineRuby::Models::Task::Status::PortStatus::Port::PublishMode] The mode in which port is published.
            #
            #   @param target_port [Integer] The port inside the container.

            # @see DockerEngineRuby::Models::Task::Status::PortStatus::Port#protocol
            module Protocol
              extend DockerEngineRuby::Internal::Type::Enum

              TCP = :tcp
              UDP = :udp
              SCTP = :sctp

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # The mode in which port is published.
            #
            # <p><br /></p>
            #
            # - "ingress" makes the target port accessible on every node, regardless of
            #   whether there is a task for the service running on that node or not.
            # - "host" bypasses the routing mesh and publish the port directly on the swarm
            #   node where that service is running.
            #
            # @see DockerEngineRuby::Models::Task::Status::PortStatus::Port#publish_mode
            module PublishMode
              extend DockerEngineRuby::Internal::Type::Enum

              INGRESS = :ingress
              HOST = :host

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see DockerEngineRuby::Models::Task::Status#state
        module State
          extend DockerEngineRuby::Internal::Type::Enum

          NEW = :new
          ALLOCATED = :allocated
          PENDING = :pending
          ASSIGNED = :assigned
          ACCEPTED = :accepted
          PREPARING = :preparing
          READY = :ready
          STARTING = :starting
          RUNNING = :running
          COMPLETE = :complete
          SHUTDOWN = :shutdown
          FAILED = :failed
          REJECTED = :rejected
          REMOVE = :remove
          ORPHANED = :orphaned

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineRuby::Models::Task#version
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
