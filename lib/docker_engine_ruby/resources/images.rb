# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Images
      # List Images
      #
      # @overload list(all: nil, digests: nil, filters: nil, manifests: nil, shared_size: nil, request_options: {})
      #
      # @param all [Boolean]
      # @param digests [Boolean]
      # @param filters [String]
      # @param manifests [Boolean]
      # @param shared_size [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::ImageSummary>]
      #
      # @see DockerEngineRuby::Models::ImageListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::ImageListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/json",
          query: parsed.transform_keys(shared_size: "shared-size"),
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ImageSummary],
          options: options
        )
      end

      # Remove an image
      #
      # @overload delete(name, force: nil, noprune: nil, platforms: nil, request_options: {})
      #
      # @param name [String]
      # @param force [Boolean]
      # @param noprune [Boolean]
      # @param platforms [Array<String>]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::DeleteItem>]
      #
      # @see DockerEngineRuby::Models::ImageDeleteParams
      def delete(name, params = {})
        parsed, options = DockerEngineRuby::ImageDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["images/%1$s", name],
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::DeleteItem],
          options: options
        )
      end

      # Build an image
      #
      # @overload build(body:, buildargs: nil, cachefrom: nil, cpuperiod: nil, cpuquota: nil, cpusetcpus: nil, cpushares: nil, dockerfile: nil, extrahosts: nil, forcerm: nil, labels: nil, memory: nil, memswap: nil, networkmode: nil, nocache: nil, outputs: nil, platform: nil, pull: nil, q: nil, remote: nil, rm: nil, shmsize: nil, squash: nil, t: nil, target: nil, version: nil, x_registry_config: nil, request_options: {})
      #
      # @param body [Object] Body param
      #
      # @param buildargs [String] Query param
      #
      # @param cachefrom [String] Query param
      #
      # @param cpuperiod [Integer] Query param
      #
      # @param cpuquota [Integer] Query param
      #
      # @param cpusetcpus [String] Query param
      #
      # @param cpushares [Integer] Query param
      #
      # @param dockerfile [String] Query param
      #
      # @param extrahosts [String] Query param
      #
      # @param forcerm [Boolean] Query param
      #
      # @param labels [String] Query param
      #
      # @param memory [Integer] Query param
      #
      # @param memswap [Integer] Query param
      #
      # @param networkmode [String] Query param
      #
      # @param nocache [Boolean] Query param
      #
      # @param outputs [String] Query param
      #
      # @param platform [String] Query param
      #
      # @param pull [String] Query param
      #
      # @param q [Boolean] Query param
      #
      # @param remote [String] Query param
      #
      # @param rm [Boolean] Query param
      #
      # @param shmsize [Integer] Query param
      #
      # @param squash [Boolean] Query param
      #
      # @param t [String] Query param
      #
      # @param target [String] Query param
      #
      # @param version [Symbol, DockerEngineRuby::Models::ImageBuildParams::Version] Query param
      #
      # @param x_registry_config [String] Header param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ImageBuildParams
      def build(params)
        parsed, options = DockerEngineRuby::ImageBuildParams.dump_request(params)
        query_params =
          [
            :buildargs,
            :cachefrom,
            :cpuperiod,
            :cpuquota,
            :cpusetcpus,
            :cpushares,
            :dockerfile,
            :extrahosts,
            :forcerm,
            :labels,
            :memory,
            :memswap,
            :networkmode,
            :nocache,
            :outputs,
            :platform,
            :pull,
            :q,
            :remote,
            :rm,
            :shmsize,
            :squash,
            :t,
            :target,
            :version
          ]
        @client.request(
          method: :post,
          path: "build",
          query: parsed.slice(*query_params),
          headers: {
            "content-type" => "application/x-tar",
            **parsed.except(:body, *query_params)
          }.transform_keys(
            x_registry_config: "x-registry-config"
          ),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Delete builder cache
      #
      # @overload build_prune(all: nil, filters: nil, max_used_space: nil, min_free_space: nil, reserved_space: nil, request_options: {})
      #
      # @param all [Boolean]
      # @param filters [String]
      # @param max_used_space [Integer]
      # @param min_free_space [Integer]
      # @param reserved_space [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ImageBuildPruneResponse]
      #
      # @see DockerEngineRuby::Models::ImageBuildPruneParams
      def build_prune(params = {})
        parsed, options = DockerEngineRuby::ImageBuildPruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "build/prune",
          query: parsed.transform_keys(
            max_used_space: "max-used-space",
            min_free_space: "min-free-space",
            reserved_space: "reserved-space"
          ),
          model: DockerEngineRuby::Models::ImageBuildPruneResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ImageCommitParams} for more details.
      #
      # Create a new image from a container
      #
      # @overload commit(author: nil, changes: nil, comment: nil, container: nil, pause: nil, repo: nil, tag: nil, args_escaped: nil, attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, domainname: nil, entrypoint: nil, env: nil, exposed_ports: nil, healthcheck: nil, hostname: nil, image: nil, labels: nil, network_disabled: nil, on_build: nil, open_stdin: nil, shell: nil, stdin_once: nil, stop_signal: nil, stop_timeout: nil, tty: nil, user: nil, volumes: nil, working_dir: nil, request_options: {})
      #
      # @param author [String] Query param
      #
      # @param changes [String] Query param
      #
      # @param comment [String] Query param
      #
      # @param container [String] Query param
      #
      # @param pause [Boolean] Query param
      #
      # @param repo [String] Query param
      #
      # @param tag [String] Query param
      #
      # @param args_escaped [Boolean, nil] Body param: Command is already escaped (Windows only)
      #
      # @param attach_stderr [Boolean] Body param: Whether to attach to `stderr`.
      #
      # @param attach_stdin [Boolean] Body param: Whether to attach to `stdin`.
      #
      # @param attach_stdout [Boolean] Body param: Whether to attach to `stdout`.
      #
      # @param cmd [Array<String>] Body param: Command to run specified as a string or an array of strings.
      #
      # @param domainname [String] Body param: The domain name to use for the container.
      #
      # @param entrypoint [Array<String>] Body param: The entry point for the container as a string or an array of strings
      #
      # @param env [Array<String>] Body param: A list of environment variables to set inside the container in the
      #
      # @param exposed_ports [Object, nil] Body param: An object mapping ports to an empty object in the form:
      #
      # @param healthcheck [DockerEngineRuby::Models::Config::Healthcheck] Body param: A test to perform to check that the container is healthy.
      #
      # @param hostname [String] Body param: The hostname to use for the container, as a valid RFC 1123 hostname.
      #
      # @param image [String] Body param: The name (or reference) of the image to use when creating the contai
      #
      # @param labels [Object] Body param: User-defined key/value metadata.
      #
      # @param network_disabled [Boolean, nil] Body param: Disable networking for the container.
      #
      # @param on_build [Array<String>, nil] Body param: `ONBUILD` metadata that were defined in the image's `Dockerfile`.
      #
      # @param open_stdin [Boolean] Body param: Open `stdin`
      #
      # @param shell [Array<String>, nil] Body param: Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
      #
      # @param stdin_once [Boolean] Body param: Close `stdin` after one attached client disconnects
      #
      # @param stop_signal [String, nil] Body param: Signal to stop a container as a string or unsigned integer.
      #
      # @param stop_timeout [Integer, nil] Body param: Timeout to stop a container in seconds.
      #
      # @param tty [Boolean] Body param: Attach standard streams to a TTY, including `stdin` if it is not clo
      #
      # @param user [String] Body param: Commands run as this user inside the container. If omitted, commands
      #
      # @param volumes [Object] Body param: An object mapping mount point paths inside the container to empty
      #
      # @param working_dir [String] Body param: The working directory for commands to run in.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ImageCommitResponse]
      #
      # @see DockerEngineRuby::Models::ImageCommitParams
      def commit(params = {})
        parsed, options = DockerEngineRuby::ImageCommitParams.dump_request(params)
        query_params = [:author, :changes, :comment, :container, :pause, :repo, :tag]
        @client.request(
          method: :post,
          path: "commit",
          query: parsed.slice(*query_params),
          body: parsed.except(*query_params),
          model: DockerEngineRuby::Models::ImageCommitResponse,
          options: options
        )
      end

      # Export an image
      #
      # @overload get(name, platform: nil, request_options: {})
      #
      # @param name [String]
      # @param platform [Array<String>]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineRuby::Models::ImageGetParams
      def get(name, params = {})
        parsed, options = DockerEngineRuby::ImageGetParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/get", name],
          query: parsed,
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Export several images
      #
      # @overload get_all(names: nil, platform: nil, request_options: {})
      #
      # @param names [Array<String>]
      # @param platform [Array<String>]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineRuby::Models::ImageGetAllParams
      def get_all(params = {})
        parsed, options = DockerEngineRuby::ImageGetAllParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/get",
          query: parsed,
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Get the history of an image
      #
      # @overload history(name, platform: nil, request_options: {})
      #
      # @param name [String]
      # @param platform [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::HistoryItem>]
      #
      # @see DockerEngineRuby::Models::ImageHistoryParams
      def history(name, params = {})
        parsed, options = DockerEngineRuby::ImageHistoryParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/history", name],
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::HistoryItem],
          options: options
        )
      end

      # Inspect an image
      #
      # @overload inspect_(name, manifests: nil, request_options: {})
      #
      # @param name [String]
      # @param manifests [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Image]
      #
      # @see DockerEngineRuby::Models::ImageInspectParams
      def inspect_(name, params = {})
        parsed, options = DockerEngineRuby::ImageInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/json", name],
          query: parsed,
          model: DockerEngineRuby::Image,
          options: options
        )
      end

      # Import images
      #
      # @overload load_(body:, platform: nil, quiet: nil, request_options: {})
      #
      # @param body [Object] Body param
      #
      # @param platform [Array<String>] Query param
      #
      # @param quiet [Boolean] Query param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ImageLoadParams
      def load_(params)
        parsed, options = DockerEngineRuby::ImageLoadParams.dump_request(params)
        @client.request(
          method: :post,
          path: "images/load",
          query: parsed.except(:body),
          headers: {"content-type" => "application/octet-stream"},
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Delete unused images
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ImagePruneResponse]
      #
      # @see DockerEngineRuby::Models::ImagePruneParams
      def prune(params = {})
        parsed, options = DockerEngineRuby::ImagePruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "images/prune",
          query: parsed,
          model: DockerEngineRuby::Models::ImagePruneResponse,
          options: options
        )
      end

      # Create an image
      #
      # @overload pull(body:, changes: nil, from_image: nil, from_src: nil, message: nil, platform: nil, repo: nil, tag: nil, x_registry_auth: nil, request_options: {})
      #
      # @param body [String] Body param
      #
      # @param changes [Array<String>] Query param
      #
      # @param from_image [String] Query param
      #
      # @param from_src [String] Query param
      #
      # @param message [String] Query param
      #
      # @param platform [String] Query param
      #
      # @param repo [String] Query param
      #
      # @param tag [String] Query param
      #
      # @param x_registry_auth [String] Header param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ImagePullParams
      def pull(params)
        parsed, options = DockerEngineRuby::ImagePullParams.dump_request(params)
        query_params = [:changes, :from_image, :from_src, :message, :platform, :repo, :tag]
        @client.request(
          method: :post,
          path: "images/create",
          query: parsed.slice(*query_params).transform_keys(from_image: "fromImage", from_src: "fromSrc"),
          headers: {"content-type" => "text/plain", **parsed.except(:body, *query_params)}.transform_keys(
            x_registry_auth: "x-registry-auth"
          ),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Push an image
      #
      # @overload push(name, x_registry_auth:, platform: nil, tag: nil, request_options: {})
      #
      # @param name [String] Path param
      #
      # @param x_registry_auth [String] Header param
      #
      # @param platform [String] Query param
      #
      # @param tag [String] Query param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ImagePushParams
      def push(name, params)
        parsed, options = DockerEngineRuby::ImagePushParams.dump_request(params)
        query_params = [:platform, :tag]
        @client.request(
          method: :post,
          path: ["images/%1$s/push", name],
          query: parsed.slice(*query_params),
          headers: parsed.except(*query_params).transform_keys(x_registry_auth: "x-registry-auth"),
          model: NilClass,
          options: options
        )
      end

      # Search images
      #
      # @overload search(term:, filters: nil, limit: nil, request_options: {})
      #
      # @param term [String]
      # @param filters [String]
      # @param limit [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::ImageSearchResponseItem>]
      #
      # @see DockerEngineRuby::Models::ImageSearchParams
      def search(params)
        parsed, options = DockerEngineRuby::ImageSearchParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/search",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Models::ImageSearchResponseItem],
          options: options
        )
      end

      # Tag an image
      #
      # @overload tag(name, repo: nil, tag: nil, request_options: {})
      #
      # @param name [String]
      # @param repo [String]
      # @param tag [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ImageTagParams
      def tag(name, params = {})
        parsed, options = DockerEngineRuby::ImageTagParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["images/%1$s/tag", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
