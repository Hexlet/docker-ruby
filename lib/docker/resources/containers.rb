# frozen_string_literal: true

module Docker
  module Resources
    class Containers
      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerCreateParams} for more details.
      #
      # Create a container
      #
      # @overload create(config:, name: nil, platform: nil, request_options: {})
      #
      # @param config [Docker::Models::ContainerCreateParams::Config] Body param: Configuration for a container that is portable between hosts.
      #
      # @param name [String] Query param: Assign the specified name to the container. Must match
      #
      # @param platform [String] Query param: Platform in the format `os[/arch[/variant]]` used for image lookup.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::CreateResponse]
      #
      # @see Docker::Models::ContainerCreateParams
      def create(params)
        parsed, options = Docker::ContainerCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "containers/create",
          query: parsed.except(:config),
          body: parsed[:config],
          model: Docker::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerListParams} for more details.
      #
      # Returns a list of containers. For details on the format, see the
      # [inspect endpoint](#operation/ContainerInspect).
      #
      # Note that it uses a different, smaller representation of a container than
      # inspecting a single container. For example, the list of linked containers is not
      # propagated .
      #
      # @overload list(all: nil, filters: nil, limit: nil, size: nil, request_options: {})
      #
      # @param all [Boolean] Return all containers. By default, only running containers are shown.
      #
      # @param filters [String] Filters to process on the container list, encoded as JSON (a
      #
      # @param limit [Integer] Return this number of most recently created containers, including
      #
      # @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Docker::Models::Summary>]
      #
      # @see Docker::Models::ContainerListParams
      def list(params = {})
        parsed, options = Docker::ContainerListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "containers/json",
          query: parsed,
          model: Docker::Internal::Type::ArrayOf[Docker::Summary],
          options: options
        )
      end

      # Remove a container
      #
      # @overload delete(id, force: nil, link: nil, v: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param force [Boolean] If the container is running, kill it before removing it.
      #
      # @param link [Boolean] Remove the specified link associated with the container.
      #
      # @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ContainerDeleteParams
      def delete(id, params = {})
        parsed, options = Docker::ContainerDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["containers/%1$s", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Return low-level information about a container.
      #
      # @overload inspect_(id, size: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::Container]
      #
      # @see Docker::Models::ContainerInspectParams
      def inspect_(id, params = {})
        parsed, options = Docker::ContainerInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/json", id],
          query: parsed,
          model: Docker::Container,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerKillParams} for more details.
      #
      # Send a POSIX signal to a container, defaulting to killing to the container.
      #
      # @overload kill(id, signal: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ContainerKillParams
      def kill(id, params = {})
        parsed, options = Docker::ContainerKillParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/kill", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerLogsParams} for more details.
      #
      # Get `stdout` and `stderr` logs from a container.
      #
      # Note: This endpoint works only for containers with the `json-file` or `journald`
      # logging driver.
      #
      # @overload logs(id, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, until_: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param follow [Boolean] Keep connection after returning logs.
      #
      # @param since [Integer] Only return logs since this time, as a UNIX timestamp
      #
      # @param stderr [Boolean] Return logs from `stderr`
      #
      # @param stdout [Boolean] Return logs from `stdout`
      #
      # @param tail [String] Only return this number of log lines from the end of the logs.
      #
      # @param timestamps [Boolean] Add timestamps to every log line
      #
      # @param until_ [Integer] Only return logs before this time, as a UNIX timestamp
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see Docker::Models::ContainerLogsParams
      def logs(id, params = {})
        parsed, options = Docker::ContainerLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/logs", id],
          query: parsed.transform_keys(until_: "until"),
          headers: {"accept" => "application/vnd.docker.multiplexed-stream"},
          model: StringIO,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerStartParams} for more details.
      #
      # Start a container
      #
      # @overload start(id, detach_keys: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param detach_keys [String] Override the key sequence for detaching a container. Format is a
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ContainerStartParams
      def start(id, params = {})
        parsed, options = Docker::ContainerStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/start", id],
          query: parsed.transform_keys(detach_keys: "detachKeys"),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ContainerStopParams} for more details.
      #
      # Stop a container
      #
      # @overload stop(id, signal: nil, t: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      # @param t [Integer] Number of seconds to wait before killing the container
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ContainerStopParams
      def stop(id, params = {})
        parsed, options = Docker::ContainerStopParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/stop", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Docker::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
