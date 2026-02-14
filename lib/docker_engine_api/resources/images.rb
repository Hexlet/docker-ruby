# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Images
      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageListParams} for more details.
      #
      # Returns a list of images on the server. Note that it uses a different, smaller
      # representation of an image than inspecting a single image.
      #
      # @overload list(all: nil, digests: nil, filters: nil, manifests: nil, shared_size: nil, request_options: {})
      #
      # @param all [Boolean] Show all images. Only images from a final layer (no children) are shown by defau
      #
      # @param digests [Boolean] Show digest information as a `RepoDigests` field on each image.
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param manifests [Boolean] Include `Manifests` in the image summary.
      #
      # @param shared_size [Boolean] Compute and show shared size as a `SharedSize` field on each image.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::Summary>]
      #
      # @see DockerEngineAPI::Models::ImageListParams
      def list(params = {})
        parsed, options = DockerEngineAPI::ImageListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/json",
          query: parsed.transform_keys(shared_size: "shared-size"),
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Summary],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageDeleteParams} for more details.
      #
      # Remove an image, along with any untagged parent images that were referenced by
      # that image.
      #
      # Images can't be removed if they have descendant images, are being used by a
      # running container or are being used by a build.
      #
      # @overload delete(name, force: nil, noprune: nil, platforms: nil, request_options: {})
      #
      # @param name [String] Image name or ID
      #
      # @param force [Boolean] Remove the image even if it is being used by stopped containers or has other tag
      #
      # @param noprune [Boolean] Do not delete untagged parent images
      #
      # @param platforms [Array<String>] Select platform-specific content to delete.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::DeleteItem>]
      #
      # @see DockerEngineAPI::Models::ImageDeleteParams
      def delete(name, params = {})
        parsed, options = DockerEngineAPI::ImageDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["images/%1$s", name],
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::DeleteItem],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageBuildParams} for more details.
      #
      # Build an image from a tar archive with a `Dockerfile` in it.
      #
      # The `Dockerfile` specifies how the image is built from the tar archive. It is
      # typically in the archive's root, but can be at a different path or have a
      # different name by specifying the `dockerfile` parameter.
      # [See the `Dockerfile` reference for more information](https://docs.docker.com/engine/reference/builder/).
      #
      # The Docker daemon performs a preliminary validation of the `Dockerfile` before
      # starting the build, and returns an error if the syntax is incorrect. After that,
      # each instruction is run one-by-one until the ID of the new image is output.
      #
      # The build is canceled if the client drops the connection by quitting or being
      # killed.
      #
      # @overload build(body:, buildargs: nil, cachefrom: nil, cpuperiod: nil, cpuquota: nil, cpusetcpus: nil, cpushares: nil, dockerfile: nil, extrahosts: nil, forcerm: nil, labels: nil, memory: nil, memswap: nil, networkmode: nil, nocache: nil, outputs: nil, platform: nil, pull: nil, q: nil, remote: nil, rm: nil, shmsize: nil, squash: nil, t: nil, target: nil, version: nil, x_registry_config: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart] Body param
      #
      # @param buildargs [String] Query param: JSON map of string pairs for build-time variables. Users pass these
      #
      # @param cachefrom [String] Query param: JSON array of images used for build cache resolution.
      #
      # @param cpuperiod [Integer] Query param: The length of a CPU period in microseconds.
      #
      # @param cpuquota [Integer] Query param: Microseconds of CPU time that the container can get in a CPU period
      #
      # @param cpusetcpus [String] Query param: CPUs in which to allow execution (e.g., `0-3`, `0,1`).
      #
      # @param cpushares [Integer] Query param: CPU shares (relative weight).
      #
      # @param dockerfile [String] Query param: Path within the build context to the `Dockerfile`. This is ignored
      #
      # @param extrahosts [String] Query param: Extra hosts to add to /etc/hosts
      #
      # @param forcerm [Boolean] Query param: Always remove intermediate containers, even upon failure.
      #
      # @param labels [String] Query param: Arbitrary key/value labels to set on the image, as a JSON map of st
      #
      # @param memory [Integer] Query param: Set memory limit for build.
      #
      # @param memswap [Integer] Query param: Total memory (memory + swap). Set as `-1` to disable swap.
      #
      # @param networkmode [String] Query param: Sets the networking mode for the run commands during build. Support
      #
      # @param nocache [Boolean] Query param: Do not use the cache when building the image.
      #
      # @param outputs [String] Query param: BuildKit output configuration in the format of a stringified JSON a
      #
      # @param platform [String] Query param: Platform in the format os[/arch[/variant]]
      #
      # @param pull [String] Query param: Attempt to pull the image even if an older image exists locally.
      #
      # @param q [Boolean] Query param: Suppress verbose build output.
      #
      # @param remote [String] Query param: A Git repository URI or HTTP/HTTPS context URI. If the URI points t
      #
      # @param rm [Boolean] Query param: Remove intermediate containers after a successful build.
      #
      # @param shmsize [Integer] Query param: Size of `/dev/shm` in bytes. The size must be greater than 0. If om
      #
      # @param squash [Boolean] Query param: Squash the resulting images layers into a single layer.
      # \*(Experimen
      #
      # @param t [String] Query param: A name and optional tag to apply to the image in the `name:tag` for
      #
      # @param target [String] Query param: Target build stage
      #
      # @param version [Symbol, DockerEngineAPI::Models::ImageBuildParams::Version] Query param: Version of the builder backend to use.
      #
      # @param x_registry_config [String] Header param: This is a base64-encoded JSON object with auth configurations for
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ImageBuildParams
      def build(params)
        parsed, options = DockerEngineAPI::ImageBuildParams.dump_request(params)
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
            "content-type" => "application/octet-stream",
            **parsed.except(:body, *query_params)
          }.transform_keys(
            x_registry_config: "x-registry-config"
          ),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageBuildPruneParams} for more details.
      #
      # Delete builder cache
      #
      # @overload build_prune(all: nil, filters: nil, max_used_space: nil, min_free_space: nil, reserved_space: nil, request_options: {})
      #
      # @param all [Boolean] Remove all types of build cache
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param max_used_space [Integer] Maximum amount of disk space allowed to keep for cache
      #
      # @param min_free_space [Integer] Target amount of free disk space after pruning
      #
      # @param reserved_space [Integer] Amount of disk space in bytes to keep for cache
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::ImageBuildPruneResponse]
      #
      # @see DockerEngineAPI::Models::ImageBuildPruneParams
      def build_prune(params = {})
        parsed, options = DockerEngineAPI::ImageBuildPruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "build/prune",
          query: parsed.transform_keys(
            max_used_space: "max-used-space",
            min_free_space: "min-free-space",
            reserved_space: "reserved-space"
          ),
          model: DockerEngineAPI::Models::ImageBuildPruneResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageCommitParams} for more details.
      #
      # Create a new image from a container
      #
      # @overload commit(author: nil, changes: nil, comment: nil, container: nil, pause: nil, repo: nil, tag: nil, args_escaped: nil, attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, domainname: nil, entrypoint: nil, env: nil, exposed_ports: nil, healthcheck: nil, hostname: nil, image: nil, labels: nil, network_disabled: nil, on_build: nil, open_stdin: nil, shell: nil, stdin_once: nil, stop_signal: nil, stop_timeout: nil, tty: nil, user: nil, volumes: nil, working_dir: nil, request_options: {})
      #
      # @param author [String] Query param: Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.co
      #
      # @param changes [String] Query param: `Dockerfile` instructions to apply while committing
      #
      # @param comment [String] Query param: Commit message
      #
      # @param container [String] Query param: The ID or name of the container to commit
      #
      # @param pause [Boolean] Query param: Whether to pause the container before committing
      #
      # @param repo [String] Query param: Repository name for the created image
      #
      # @param tag [String] Query param: Tag name for the create image
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
      # @param exposed_ports [Hash{Symbol=>Object}, nil] Body param: An object mapping ports to an empty object in the form:
      #
      # @param healthcheck [DockerEngineAPI::Models::Config::Healthcheck] Body param: A test to perform to check that the container is healthy.
      #
      # @param hostname [String] Body param: The hostname to use for the container, as a valid RFC 1123 hostname.
      #
      # @param image [String] Body param: The name (or reference) of the image to use when creating the contai
      #
      # @param labels [Hash{Symbol=>String}] Body param: User-defined key/value metadata.
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
      # @param volumes [Hash{Symbol=>Object}] Body param: An object mapping mount point paths inside the container to empty
      #
      # @param working_dir [String] Body param: The working directory for commands to run in.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::ImageCommitResponse]
      #
      # @see DockerEngineAPI::Models::ImageCommitParams
      def commit(params = {})
        parsed, options = DockerEngineAPI::ImageCommitParams.dump_request(params)
        query_params = [:author, :changes, :comment, :container, :pause, :repo, :tag]
        @client.request(
          method: :post,
          path: "commit",
          query: parsed.slice(*query_params),
          body: parsed.except(*query_params),
          model: DockerEngineAPI::Models::ImageCommitResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageGetParams} for more details.
      #
      # Get a tarball containing all images and metadata for a repository.
      #
      # If `name` is a specific name and tag (e.g. `ubuntu:latest`), then only that
      # image (and its parents) are returned. If `name` is an image ID, similarly only
      # that image (and its parents) are returned, but with the exclusion of the
      # `repositories` file in the tarball, as there were no image names referenced.
      #
      # ### Image tarball format
      #
      # An image tarball contains
      # [Content as defined in the OCI Image Layout Specification](https://github.com/opencontainers/image-spec/blob/v1.1.1/image-layout.md#content).
      #
      # Additionally, includes the manifest.json file associated with a backwards
      # compatible docker save format.
      #
      # If the tarball defines a repository, the tarball should also include a
      # `repositories` file at the root that contains a list of repository and tag names
      # mapped to layer IDs.
      #
      # ```json
      # {
      #   "hello-world": {
      #     "latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"
      #   }
      # }
      # ```
      #
      # @overload get(name, platform: nil, request_options: {})
      #
      # @param name [String] Image name or ID
      #
      # @param platform [Array<String>] JSON encoded OCI platform describing a platform which will be used
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineAPI::Models::ImageGetParams
      def get(name, params = {})
        parsed, options = DockerEngineAPI::ImageGetParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/get", name],
          query: parsed,
          headers: {"accept" => "application/x-tar"},
          model: StringIO,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageGetAllParams} for more details.
      #
      # Get a tarball containing all images and metadata for several image repositories.
      #
      # For each value of the `names` parameter: if it is a specific name and tag (e.g.
      # `ubuntu:latest`), then only that image (and its parents) are returned; if it is
      # an image ID, similarly only that image (and its parents) are returned and there
      # would be no names referenced in the 'repositories' file for this image ID.
      #
      # For details on the format, see the [export image endpoint](#operation/ImageGet).
      #
      # @overload get_all(names: nil, platform: nil, request_options: {})
      #
      # @param names [Array<String>] Image names to filter by
      #
      # @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineAPI::Models::ImageGetAllParams
      def get_all(params = {})
        parsed, options = DockerEngineAPI::ImageGetAllParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/get",
          query: parsed,
          headers: {"accept" => "application/x-tar"},
          model: StringIO,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageHistoryParams} for more details.
      #
      # Return parent layers of an image.
      #
      # @overload history(name, platform: nil, request_options: {})
      #
      # @param name [String] Image name or ID
      #
      # @param platform [String] JSON-encoded OCI platform to select the platform-variant.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::HistoryItem>]
      #
      # @see DockerEngineAPI::Models::ImageHistoryParams
      def history(name, params = {})
        parsed, options = DockerEngineAPI::ImageHistoryParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/history", name],
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::HistoryItem],
          options: options
        )
      end

      # Return low-level information about an image.
      #
      # @overload inspect_(name, manifests: nil, request_options: {})
      #
      # @param name [String] Image name or id
      #
      # @param manifests [Boolean] Include Manifests in the image summary.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Image]
      #
      # @see DockerEngineAPI::Models::ImageInspectParams
      def inspect_(name, params = {})
        parsed, options = DockerEngineAPI::ImageInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/json", name],
          query: parsed,
          model: DockerEngineAPI::Image,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageLoadParams} for more details.
      #
      # Load a set of images and tags into a repository.
      #
      # For details on the format, see the [export image endpoint](#operation/ImageGet).
      #
      # @overload load_(body:, platform: nil, quiet: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart] Body param
      #
      # @param platform [Array<String>] Query param: JSON encoded OCI platform(s) which will be used to select the
      #
      # @param quiet [Boolean] Query param: Suppress progress details during load.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ImageLoadParams
      def load_(params)
        parsed, options = DockerEngineAPI::ImageLoadParams.dump_request(params)
        @client.request(
          method: :post,
          path: "images/load",
          query: parsed.except(:body),
          headers: {"content-type" => "application/x-tar"},
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImagePruneParams} for more details.
      #
      # Delete unused images
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::ImagePruneResponse]
      #
      # @see DockerEngineAPI::Models::ImagePruneParams
      def prune(params = {})
        parsed, options = DockerEngineAPI::ImagePruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "images/prune",
          query: parsed,
          model: DockerEngineAPI::Models::ImagePruneResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImagePullParams} for more details.
      #
      # Pull or import an image.
      #
      # @overload pull(changes: nil, from_image: nil, from_src: nil, message: nil, platform: nil, repo: nil, tag: nil, body: nil, x_registry_auth: nil, request_options: {})
      #
      # @param changes [Array<String>] Query param: Apply `Dockerfile` instructions to the image that is created,
      #
      # @param from_image [String] Query param: Name of the image to pull. If the name includes a tag or digest, sp
      #
      # @param from_src [String] Query param: Source to import. The value may be a URL from which the image can b
      #
      # @param message [String] Query param: Set commit message for imported image.
      #
      # @param platform [String] Query param: Platform in the format os[/arch[/variant]].
      #
      # @param repo [String] Query param: Repository name given to an image when it is imported. The repo may
      #
      # @param tag [String] Query param: Tag or digest. If empty when pulling an image, this causes all tags
      #
      # @param body [String] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ImagePullParams
      def pull(params = {})
        parsed, options = DockerEngineAPI::ImagePullParams.dump_request(params)
        query_params = [:changes, :from_image, :from_src, :message, :platform, :repo, :tag]
        @client.request(
          method: :post,
          path: "images/create",
          query: parsed.slice(*query_params).transform_keys(from_image: "fromImage", from_src: "fromSrc"),
          headers: {
            "content-type" => "application/octet-stream",
            **parsed.except(:body, *query_params)
          }.transform_keys(
            x_registry_auth: "x-registry-auth"
          ),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImagePushParams} for more details.
      #
      # Push an image to a registry.
      #
      # If you wish to push an image on to a private registry, that image must already
      # have a tag which references the registry. For example,
      # `registry.example.com/myimage:latest`.
      #
      # The push is cancelled if the HTTP connection is closed.
      #
      # @overload push(name, x_registry_auth:, platform: nil, tag: nil, request_options: {})
      #
      # @param name [String] Path param: Name of the image to push. For example, `registry.example.com/myimag
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration.
      #
      # @param platform [String] Query param: JSON-encoded OCI platform to select the platform-variant to push.
      #
      # @param tag [String] Query param: Tag of the image to push. For example, `latest`. If no tag is provi
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ImagePushParams
      def push(name, params)
        parsed, options = DockerEngineAPI::ImagePushParams.dump_request(params)
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ImageSearchParams} for more details.
      #
      # Search for an image on Docker Hub.
      #
      # @overload search(term:, filters: nil, limit: nil, request_options: {})
      #
      # @param term [String] Term to search
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::ImageSearchResponseItem>]
      #
      # @see DockerEngineAPI::Models::ImageSearchParams
      def search(params)
        parsed, options = DockerEngineAPI::ImageSearchParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/search",
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Models::ImageSearchResponseItem],
          options: options
        )
      end

      # Create a tag that refers to a source image.
      #
      # This creates an additional reference (tag) to the source image. The tag can
      # include a different repository name and/or tag. If the repository or tag already
      # exists, it will be overwritten.
      #
      # @overload tag(name, repo: nil, tag: nil, request_options: {})
      #
      # @param name [String] Image name or ID to tag.
      #
      # @param repo [String] The repository to tag in. For example, `someuser/someimage`.
      #
      # @param tag [String] The name of the new tag.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ImageTagParams
      def tag(name, params = {})
        parsed, options = DockerEngineAPI::ImageTagParams.dump_request(params)
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
      # @param client [DockerEngineAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
