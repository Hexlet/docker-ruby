# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Services#inspect_
    class Service < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute created_at
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :CreatedAt

      # @!attribute endpoint
      #
      #   @return [DockerEngineAPI::Models::Service::Endpoint, nil]
      optional :endpoint, -> { DockerEngineAPI::Service::Endpoint }, api_name: :Endpoint

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute job_status
      #   The status of the service when it is in one of ReplicatedJob or GlobalJob modes.
      #   Absent on Replicated and Global mode services. The JobIteration is an
      #   ObjectVersion, but unlike the Service's version, does not need to be sent with
      #   an update request.
      #
      #   @return [DockerEngineAPI::Models::Service::JobStatus, nil]
      optional :job_status, -> { DockerEngineAPI::Service::JobStatus }, api_name: :JobStatus

      # @!attribute service_status
      #   The status of the service's tasks. Provided only when requested as part of a
      #   ServiceList operation.
      #
      #   @return [DockerEngineAPI::Models::Service::ServiceStatus, nil]
      optional :service_status, -> { DockerEngineAPI::Service::ServiceStatus }, api_name: :ServiceStatus

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [DockerEngineAPI::Models::Spec, nil]
      optional :spec, -> { DockerEngineAPI::Spec }, api_name: :Spec

      # @!attribute updated_at
      #
      #   @return [String, nil]
      optional :updated_at, String, api_name: :UpdatedAt

      # @!attribute update_status
      #   The status of a service update.
      #
      #   @return [DockerEngineAPI::Models::Service::UpdateStatus, nil]
      optional :update_status, -> { DockerEngineAPI::Service::UpdateStatus }, api_name: :UpdateStatus

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
      #   @return [DockerEngineAPI::Models::Service::Version, nil]
      optional :version, -> { DockerEngineAPI::Service::Version }, api_name: :Version

      # @!method initialize(created_at: nil, endpoint: nil, id: nil, job_status: nil, service_status: nil, spec: nil, updated_at: nil, update_status: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::Service} for more details.
      #
      #   @param created_at [String]
      #
      #   @param endpoint [DockerEngineAPI::Models::Service::Endpoint]
      #
      #   @param id [String]
      #
      #   @param job_status [DockerEngineAPI::Models::Service::JobStatus] The status of the service when it is in one of ReplicatedJob or
      #
      #   @param service_status [DockerEngineAPI::Models::Service::ServiceStatus] The status of the service's tasks. Provided only when requested as
      #
      #   @param spec [DockerEngineAPI::Models::Spec] User modifiable configuration for a service.
      #
      #   @param updated_at [String]
      #
      #   @param update_status [DockerEngineAPI::Models::Service::UpdateStatus] The status of a service update.
      #
      #   @param version [DockerEngineAPI::Models::Service::Version] The version number of the object such as node, service, etc. This is needed

      # @see DockerEngineAPI::Models::Service#endpoint
      class Endpoint < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute ports
        #
        #   @return [Array<DockerEngineAPI::Models::Service::Endpoint::Port>, nil]
        optional :ports,
                 -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service::Endpoint::Port] },
                 api_name: :Ports

        # @!attribute spec
        #   Properties that can be configured to access and load balance a service.
        #
        #   @return [DockerEngineAPI::Models::Service::Endpoint::Spec, nil]
        optional :spec, -> { DockerEngineAPI::Service::Endpoint::Spec }, api_name: :Spec

        # @!attribute virtual_ips
        #
        #   @return [Array<DockerEngineAPI::Models::Service::Endpoint::VirtualIP>, nil]
        optional :virtual_ips,
                 -> {
                   DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service::Endpoint::VirtualIP]
                 },
                 api_name: :VirtualIPs

        # @!method initialize(ports: nil, spec: nil, virtual_ips: nil)
        #   @param ports [Array<DockerEngineAPI::Models::Service::Endpoint::Port>]
        #
        #   @param spec [DockerEngineAPI::Models::Service::Endpoint::Spec] Properties that can be configured to access and load balance a service.
        #
        #   @param virtual_ips [Array<DockerEngineAPI::Models::Service::Endpoint::VirtualIP>]

        class Port < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute protocol
          #
          #   @return [Symbol, DockerEngineAPI::Models::Service::Endpoint::Port::Protocol, nil]
          optional :protocol,
                   enum: -> {
                     DockerEngineAPI::Service::Endpoint::Port::Protocol
                   },
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
          #   @return [Symbol, DockerEngineAPI::Models::Service::Endpoint::Port::PublishMode, nil]
          optional :publish_mode,
                   enum: -> { DockerEngineAPI::Service::Endpoint::Port::PublishMode },
                   api_name: :PublishMode

          # @!attribute target_port
          #   The port inside the container.
          #
          #   @return [Integer, nil]
          optional :target_port, Integer, api_name: :TargetPort

          # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Service::Endpoint::Port} for more details.
          #
          #   @param name [String]
          #
          #   @param protocol [Symbol, DockerEngineAPI::Models::Service::Endpoint::Port::Protocol]
          #
          #   @param published_port [Integer] The port on the swarm hosts.
          #
          #   @param publish_mode [Symbol, DockerEngineAPI::Models::Service::Endpoint::Port::PublishMode] The mode in which port is published.
          #
          #   @param target_port [Integer] The port inside the container.

          # @see DockerEngineAPI::Models::Service::Endpoint::Port#protocol
          module Protocol
            extend DockerEngineAPI::Internal::Type::Enum

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
          # @see DockerEngineAPI::Models::Service::Endpoint::Port#publish_mode
          module PublishMode
            extend DockerEngineAPI::Internal::Type::Enum

            INGRESS = :ingress
            HOST = :host

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see DockerEngineAPI::Models::Service::Endpoint#spec
        class Spec < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute mode
          #   The mode of resolution to use for internal load balancing between tasks.
          #
          #   @return [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Mode, nil]
          optional :mode, enum: -> { DockerEngineAPI::Service::Endpoint::Spec::Mode }, api_name: :Mode

          # @!attribute ports
          #   List of exposed ports that this service is accessible on from the outside. Ports
          #   can only be provided if `vip` resolution mode is used.
          #
          #   @return [Array<DockerEngineAPI::Models::Service::Endpoint::Spec::Port>, nil]
          optional :ports,
                   -> {
                     DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service::Endpoint::Spec::Port]
                   },
                   api_name: :Ports

          # @!method initialize(mode: nil, ports: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Service::Endpoint::Spec} for more details.
          #
          #   Properties that can be configured to access and load balance a service.
          #
          #   @param mode [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Mode] The mode of resolution to use for internal load balancing between tasks.
          #
          #   @param ports [Array<DockerEngineAPI::Models::Service::Endpoint::Spec::Port>] List of exposed ports that this service is accessible on from the

          # The mode of resolution to use for internal load balancing between tasks.
          #
          # @see DockerEngineAPI::Models::Service::Endpoint::Spec#mode
          module Mode
            extend DockerEngineAPI::Internal::Type::Enum

            VIP = :vip
            DNSRR = :dnsrr

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Port < DockerEngineAPI::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute protocol
            #
            #   @return [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Port::Protocol, nil]
            optional :protocol,
                     enum: -> { DockerEngineAPI::Service::Endpoint::Spec::Port::Protocol },
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
            #   @return [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Port::PublishMode, nil]
            optional :publish_mode,
                     enum: -> { DockerEngineAPI::Service::Endpoint::Spec::Port::PublishMode },
                     api_name: :PublishMode

            # @!attribute target_port
            #   The port inside the container.
            #
            #   @return [Integer, nil]
            optional :target_port, Integer, api_name: :TargetPort

            # @!method initialize(name: nil, protocol: nil, published_port: nil, publish_mode: nil, target_port: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineAPI::Models::Service::Endpoint::Spec::Port} for more details.
            #
            #   @param name [String]
            #
            #   @param protocol [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Port::Protocol]
            #
            #   @param published_port [Integer] The port on the swarm hosts.
            #
            #   @param publish_mode [Symbol, DockerEngineAPI::Models::Service::Endpoint::Spec::Port::PublishMode] The mode in which port is published.
            #
            #   @param target_port [Integer] The port inside the container.

            # @see DockerEngineAPI::Models::Service::Endpoint::Spec::Port#protocol
            module Protocol
              extend DockerEngineAPI::Internal::Type::Enum

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
            # @see DockerEngineAPI::Models::Service::Endpoint::Spec::Port#publish_mode
            module PublishMode
              extend DockerEngineAPI::Internal::Type::Enum

              INGRESS = :ingress
              HOST = :host

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        class VirtualIP < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute addr
          #
          #   @return [String, nil]
          optional :addr, String, api_name: :Addr

          # @!attribute network_id
          #
          #   @return [String, nil]
          optional :network_id, String, api_name: :NetworkID

          # @!method initialize(addr: nil, network_id: nil)
          #   @param addr [String]
          #   @param network_id [String]
        end
      end

      # @see DockerEngineAPI::Models::Service#job_status
      class JobStatus < DockerEngineAPI::Internal::Type::BaseModel
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
        #   @return [DockerEngineAPI::Models::Service::JobStatus::JobIteration, nil]
        optional :job_iteration,
                 -> {
                   DockerEngineAPI::Service::JobStatus::JobIteration
                 },
                 api_name: :JobIteration

        # @!attribute last_execution
        #   The last time, as observed by the server, that this job was started.
        #
        #   @return [String, nil]
        optional :last_execution, String, api_name: :LastExecution

        # @!method initialize(job_iteration: nil, last_execution: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Service::JobStatus} for more details.
        #
        #   The status of the service when it is in one of ReplicatedJob or GlobalJob modes.
        #   Absent on Replicated and Global mode services. The JobIteration is an
        #   ObjectVersion, but unlike the Service's version, does not need to be sent with
        #   an update request.
        #
        #   @param job_iteration [DockerEngineAPI::Models::Service::JobStatus::JobIteration] The version number of the object such as node, service, etc. This is needed
        #
        #   @param last_execution [String] The last time, as observed by the server, that this job was

        # @see DockerEngineAPI::Models::Service::JobStatus#job_iteration
        class JobIteration < DockerEngineAPI::Internal::Type::BaseModel
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

      # @see DockerEngineAPI::Models::Service#service_status
      class ServiceStatus < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute completed_tasks
        #   The number of tasks for a job that are in the Completed state. This field must
        #   be cross-referenced with the service type, as the value of 0 may mean the
        #   service is not in a job mode, or it may mean the job-mode service has no tasks
        #   yet Completed.
        #
        #   @return [Integer, nil]
        optional :completed_tasks, Integer, api_name: :CompletedTasks

        # @!attribute desired_tasks
        #   The number of tasks for the service desired to be running. For replicated
        #   services, this is the replica count from the service spec. For global services,
        #   this is computed by taking count of all tasks for the service with a Desired
        #   State other than Shutdown.
        #
        #   @return [Integer, nil]
        optional :desired_tasks, Integer, api_name: :DesiredTasks

        # @!attribute running_tasks
        #   The number of tasks for the service currently in the Running state.
        #
        #   @return [Integer, nil]
        optional :running_tasks, Integer, api_name: :RunningTasks

        # @!method initialize(completed_tasks: nil, desired_tasks: nil, running_tasks: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Service::ServiceStatus} for more details.
        #
        #   The status of the service's tasks. Provided only when requested as part of a
        #   ServiceList operation.
        #
        #   @param completed_tasks [Integer] The number of tasks for a job that are in the Completed state.
        #
        #   @param desired_tasks [Integer] The number of tasks for the service desired to be running.
        #
        #   @param running_tasks [Integer] The number of tasks for the service currently in the Running state.
      end

      # @see DockerEngineAPI::Models::Service#update_status
      class UpdateStatus < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute completed_at
        #
        #   @return [String, nil]
        optional :completed_at, String, api_name: :CompletedAt

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String, api_name: :Message

        # @!attribute started_at
        #
        #   @return [String, nil]
        optional :started_at, String, api_name: :StartedAt

        # @!attribute state
        #
        #   @return [Symbol, DockerEngineAPI::Models::Service::UpdateStatus::State, nil]
        optional :state, enum: -> { DockerEngineAPI::Service::UpdateStatus::State }, api_name: :State

        # @!method initialize(completed_at: nil, message: nil, started_at: nil, state: nil)
        #   The status of a service update.
        #
        #   @param completed_at [String]
        #   @param message [String]
        #   @param started_at [String]
        #   @param state [Symbol, DockerEngineAPI::Models::Service::UpdateStatus::State]

        # @see DockerEngineAPI::Models::Service::UpdateStatus#state
        module State
          extend DockerEngineAPI::Internal::Type::Enum

          UPDATING = :updating
          PAUSED = :paused
          COMPLETED = :completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see DockerEngineAPI::Models::Service#version
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
