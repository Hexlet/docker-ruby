# typed: strong

module DockerEngineAPI
  module Resources
    class Images
      # Returns a list of images on the server. Note that it uses a different, smaller
      # representation of an image than inspecting a single image.
      sig do
        params(
          all: T::Boolean,
          digests: T::Boolean,
          filters: String,
          manifests: T::Boolean,
          shared_size: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineAPI::Summary])
      end
      def list(
        # Show all images. Only images from a final layer (no children) are shown by
        # default.
        all: nil,
        # Show digest information as a `RepoDigests` field on each image.
        digests: nil,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # images list.
        #
        # Available filters:
        #
        # - `before`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `dangling=true`
        # - `label=key` or `label="key=value"` of an image label
        # - `reference`=(`<image-name>[:<tag>]`)
        # - `since`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `until=<timestamp>`
        filters: nil,
        # Include `Manifests` in the image summary.
        manifests: nil,
        # Compute and show shared size as a `SharedSize` field on each image.
        shared_size: nil,
        request_options: {}
      )
      end

      # Remove an image, along with any untagged parent images that were referenced by
      # that image.
      #
      # Images can't be removed if they have descendant images, are being used by a
      # running container or are being used by a build.
      sig do
        params(
          name: String,
          force: T::Boolean,
          noprune: T::Boolean,
          platforms: T::Array[String],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineAPI::DeleteItem])
      end
      def delete(
        # Image name or ID
        name,
        # Remove the image even if it is being used by stopped containers or has other
        # tags
        force: nil,
        # Do not delete untagged parent images
        noprune: nil,
        # Select platform-specific content to delete. Multiple values are accepted. Each
        # platform is a OCI platform encoded as a JSON string.
        platforms: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          body: DockerEngineAPI::Internal::FileInput,
          buildargs: String,
          cachefrom: String,
          cpuperiod: Integer,
          cpuquota: Integer,
          cpusetcpus: String,
          cpushares: Integer,
          dockerfile: String,
          extrahosts: String,
          forcerm: T::Boolean,
          labels: String,
          memory: Integer,
          memswap: Integer,
          networkmode: String,
          nocache: T::Boolean,
          outputs: String,
          platform: String,
          pull: String,
          q: T::Boolean,
          remote: String,
          rm: T::Boolean,
          shmsize: Integer,
          squash: T::Boolean,
          t: String,
          target: String,
          version: DockerEngineAPI::ImageBuildParams::Version::OrSymbol,
          x_registry_config: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def build(
        # Body param
        body:,
        # Query param: JSON map of string pairs for build-time variables. Users pass these
        # values at build-time. Docker uses the buildargs as the environment context for
        # commands run via the `Dockerfile` RUN instruction, or for variable expansion in
        # other `Dockerfile` instructions. This is not meant for passing secret values.
        #
        # For example, the build arg `FOO=bar` would become `{"FOO":"bar"}` in JSON. This
        # would result in the query parameter `buildargs={"FOO":"bar"}`. Note that
        # `{"FOO":"bar"}` should be URI component encoded.
        #
        # [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)
        buildargs: nil,
        # Query param: JSON array of images used for build cache resolution.
        cachefrom: nil,
        # Query param: The length of a CPU period in microseconds.
        cpuperiod: nil,
        # Query param: Microseconds of CPU time that the container can get in a CPU
        # period.
        cpuquota: nil,
        # Query param: CPUs in which to allow execution (e.g., `0-3`, `0,1`).
        cpusetcpus: nil,
        # Query param: CPU shares (relative weight).
        cpushares: nil,
        # Query param: Path within the build context to the `Dockerfile`. This is ignored
        # if `remote` is specified and points to an external `Dockerfile`.
        dockerfile: nil,
        # Query param: Extra hosts to add to /etc/hosts
        extrahosts: nil,
        # Query param: Always remove intermediate containers, even upon failure.
        forcerm: nil,
        # Query param: Arbitrary key/value labels to set on the image, as a JSON map of
        # string pairs.
        labels: nil,
        # Query param: Set memory limit for build.
        memory: nil,
        # Query param: Total memory (memory + swap). Set as `-1` to disable swap.
        memswap: nil,
        # Query param: Sets the networking mode for the run commands during build.
        # Supported standard values are: `bridge`, `host`, `none`, and
        # `container:<name|id>`. Any other value is taken as a custom network's name or ID
        # to which this container should connect to.
        networkmode: nil,
        # Query param: Do not use the cache when building the image.
        nocache: nil,
        # Query param: BuildKit output configuration in the format of a stringified JSON
        # array of objects. Each object must have two top-level properties: `Type` and
        # `Attrs`. The `Type` property must be set to 'moby'. The `Attrs` property is a
        # map of attributes for the BuildKit output configuration. See
        # https://docs.docker.com/build/exporters/oci-docker/ for more information.
        #
        # Example:
        #
        # ```
        # [{"Type":"moby","Attrs":{"type":"image","force-compression":"true","compression":"zstd"}}]
        # ```
        outputs: nil,
        # Query param: Platform in the format os[/arch[/variant]]
        platform: nil,
        # Query param: Attempt to pull the image even if an older image exists locally.
        pull: nil,
        # Query param: Suppress verbose build output.
        q: nil,
        # Query param: A Git repository URI or HTTP/HTTPS context URI. If the URI points
        # to a single text file, the file’s contents are placed into a file called
        # `Dockerfile` and the image is built from that file. If the URI points to a
        # tarball, the file is downloaded by the daemon and the contents therein used as
        # the context for the build. If the URI points to a tarball and the `dockerfile`
        # parameter is also specified, there must be a file with the corresponding path
        # inside the tarball.
        remote: nil,
        # Query param: Remove intermediate containers after a successful build.
        rm: nil,
        # Query param: Size of `/dev/shm` in bytes. The size must be greater than 0. If
        # omitted the system uses 64MB.
        shmsize: nil,
        # Query param: Squash the resulting images layers into a single layer.
        # _(Experimental release only.)_
        squash: nil,
        # Query param: A name and optional tag to apply to the image in the `name:tag`
        # format. If you omit the tag the default `latest` value is assumed. You can
        # provide several `t` parameters.
        t: nil,
        # Query param: Target build stage
        target: nil,
        # Query param: Version of the builder backend to use.
        #
        # - `1` is the first generation classic (deprecated) builder in the Docker daemon
        #   (default)
        # - `2` is [BuildKit](https://github.com/moby/buildkit)
        version: nil,
        # Header param: This is a base64-encoded JSON object with auth configurations for
        # multiple registries that a build may refer to.
        #
        # The key is a registry URL, and the value is an auth configuration object,
        # [as described in the authentication section](#section/Authentication). For
        # example:
        #
        # ```
        # {
        #   "docker.example.com": {
        #     "username": "janedoe",
        #     "password": "hunter2"
        #   },
        #   "https://index.docker.io/v1/": {
        #     "username": "mobydock",
        #     "password": "conta1n3rize14"
        #   }
        # }
        # ```
        #
        # Only the registry domain name (and port if not the default 443) are required.
        # However, for legacy reasons, the Docker Hub registry must be specified with both
        # a `https://` prefix and a `/v1/` suffix even though Docker will prefer to use
        # the v2 registry API.
        x_registry_config: nil,
        request_options: {}
      )
      end

      # Delete builder cache
      sig do
        params(
          all: T::Boolean,
          filters: String,
          max_used_space: Integer,
          min_free_space: Integer,
          reserved_space: Integer,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Models::ImageBuildPruneResponse)
      end
      def build_prune(
        # Remove all types of build cache
        all: nil,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # list of build cache objects.
        #
        # Available filters:
        #
        # - `until=<timestamp>` remove cache older than `<timestamp>`. The `<timestamp>`
        #   can be Unix timestamps, date formatted timestamps, or Go duration strings
        #   (e.g. `10m`, `1h30m`) computed relative to the daemon's local time.
        # - `id=<id>`
        # - `parent=<id>`
        # - `type=<string>`
        # - `description=<string>`
        # - `inuse`
        # - `shared`
        # - `private`
        filters: nil,
        # Maximum amount of disk space allowed to keep for cache
        max_used_space: nil,
        # Target amount of free disk space after pruning
        min_free_space: nil,
        # Amount of disk space in bytes to keep for cache
        reserved_space: nil,
        request_options: {}
      )
      end

      # Create a new image from a container
      sig do
        params(
          author: String,
          changes: String,
          comment: String,
          container: String,
          pause: T::Boolean,
          repo: String,
          tag: String,
          args_escaped: T.nilable(T::Boolean),
          attach_stderr: T::Boolean,
          attach_stdin: T::Boolean,
          attach_stdout: T::Boolean,
          cmd: T::Array[String],
          domainname: String,
          entrypoint: T::Array[String],
          env: T::Array[String],
          exposed_ports: T.nilable(T::Hash[Symbol, T.anything]),
          healthcheck: DockerEngineAPI::Config::Healthcheck::OrHash,
          hostname: String,
          image: String,
          labels: T::Hash[Symbol, String],
          network_disabled: T.nilable(T::Boolean),
          on_build: T.nilable(T::Array[String]),
          open_stdin: T::Boolean,
          shell: T.nilable(T::Array[String]),
          stdin_once: T::Boolean,
          stop_signal: T.nilable(String),
          stop_timeout: T.nilable(Integer),
          tty: T::Boolean,
          user: String,
          volumes: T::Hash[Symbol, T.anything],
          working_dir: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Models::ImageCommitResponse)
      end
      def commit(
        # Query param: Author of the image (e.g.,
        # `John Hannibal Smith <hannibal@a-team.com>`)
        author: nil,
        # Query param: `Dockerfile` instructions to apply while committing
        changes: nil,
        # Query param: Commit message
        comment: nil,
        # Query param: The ID or name of the container to commit
        container: nil,
        # Query param: Whether to pause the container before committing
        pause: nil,
        # Query param: Repository name for the created image
        repo: nil,
        # Query param: Tag name for the create image
        tag: nil,
        # Body param: Command is already escaped (Windows only)
        args_escaped: nil,
        # Body param: Whether to attach to `stderr`.
        attach_stderr: nil,
        # Body param: Whether to attach to `stdin`.
        attach_stdin: nil,
        # Body param: Whether to attach to `stdout`.
        attach_stdout: nil,
        # Body param: Command to run specified as a string or an array of strings.
        cmd: nil,
        # Body param: The domain name to use for the container.
        domainname: nil,
        # Body param: The entry point for the container as a string or an array of
        # strings.
        #
        # If the array consists of exactly one empty string (`[""]`) then the entry point
        # is reset to system default (i.e., the entry point used by docker when there is
        # no `ENTRYPOINT` instruction in the `Dockerfile`).
        entrypoint: nil,
        # Body param: A list of environment variables to set inside the container in the
        # form `["VAR=value", ...]`. A variable without `=` is removed from the
        # environment, rather than to have an empty value.
        env: nil,
        # Body param: An object mapping ports to an empty object in the form:
        #
        # `{"<port>/<tcp|udp|sctp>": {}}`
        exposed_ports: nil,
        # Body param: A test to perform to check that the container is healthy.
        # Healthcheck commands should be side-effect free.
        healthcheck: nil,
        # Body param: The hostname to use for the container, as a valid RFC 1123 hostname.
        hostname: nil,
        # Body param: The name (or reference) of the image to use when creating the
        # container, or which was used when the container was created.
        image: nil,
        # Body param: User-defined key/value metadata.
        labels: nil,
        # Body param: Disable networking for the container.
        network_disabled: nil,
        # Body param: `ONBUILD` metadata that were defined in the image's `Dockerfile`.
        on_build: nil,
        # Body param: Open `stdin`
        open_stdin: nil,
        # Body param: Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell.
        shell: nil,
        # Body param: Close `stdin` after one attached client disconnects
        stdin_once: nil,
        # Body param: Signal to stop a container as a string or unsigned integer.
        stop_signal: nil,
        # Body param: Timeout to stop a container in seconds.
        stop_timeout: nil,
        # Body param: Attach standard streams to a TTY, including `stdin` if it is not
        # closed.
        tty: nil,
        # Body param: Commands run as this user inside the container. If omitted, commands
        # run as the user specified in the image the container was started from.
        #
        # Can be either user-name or UID, and optional group-name or GID, separated by a
        # colon (`<user-name|UID>[<:group-name|GID>]`).
        user: nil,
        # Body param: An object mapping mount point paths inside the container to empty
        # objects.
        volumes: nil,
        # Body param: The working directory for commands to run in.
        working_dir: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          name: String,
          platform: T::Array[String],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def get(
        # Image name or ID
        name,
        # JSON encoded OCI platform describing a platform which will be used to select a
        # platform-specific image to be saved if the image is multi-platform. If not
        # provided, the full multi-platform image will be saved.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      # Get a tarball containing all images and metadata for several image repositories.
      #
      # For each value of the `names` parameter: if it is a specific name and tag (e.g.
      # `ubuntu:latest`), then only that image (and its parents) are returned; if it is
      # an image ID, similarly only that image (and its parents) are returned and there
      # would be no names referenced in the 'repositories' file for this image ID.
      #
      # For details on the format, see the [export image endpoint](#operation/ImageGet).
      sig do
        params(
          names: T::Array[String],
          platform: T::Array[String],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def get_all(
        # Image names to filter by
        names: nil,
        # JSON encoded OCI platform(s) which will be used to select the platform-specific
        # image(s) to be saved if the image is multi-platform. If not provided, the full
        # multi-platform image will be saved.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      # Return parent layers of an image.
      sig do
        params(
          name: String,
          platform: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineAPI::HistoryItem])
      end
      def history(
        # Image name or ID
        name,
        # JSON-encoded OCI platform to select the platform-variant. If omitted, it
        # defaults to any locally available platform, prioritizing the daemon's host
        # platform.
        #
        # If the daemon provides a multi-platform image store, this selects the
        # platform-variant to show the history for. If the image is a single-platform
        # image, or if the multi-platform image does not provide a variant matching the
        # given platform, an error is returned.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      # Return low-level information about an image.
      sig do
        params(
          name: String,
          manifests: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Image)
      end
      def inspect_(
        # Image name or id
        name,
        # Include Manifests in the image summary.
        manifests: nil,
        request_options: {}
      )
      end

      # Load a set of images and tags into a repository.
      #
      # For details on the format, see the [export image endpoint](#operation/ImageGet).
      sig do
        params(
          body: DockerEngineAPI::Internal::FileInput,
          platform: T::Array[String],
          quiet: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def load_(
        # Body param
        body:,
        # Query param: JSON encoded OCI platform(s) which will be used to select the
        # platform-specific image(s) to load if the image is multi-platform. If not
        # provided, the full multi-platform image will be loaded.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        # Query param: Suppress progress details during load.
        quiet: nil,
        request_options: {}
      )
      end

      # Delete unused images
      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Models::ImagePruneResponse)
      end
      def prune(
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        # Available filters:
        #
        # - `dangling=<boolean>` When set to `true` (or `1`), prune only unused _and_
        #   untagged images. When set to `false` (or `0`), all unused images are pruned.
        # - `until=<string>` Prune images created before this timestamp. The `<timestamp>`
        #   can be Unix timestamps, date formatted timestamps, or Go duration strings
        #   (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune images with (or without, in case `label!=...` is
        #   used) the specified labels.
        filters: nil,
        request_options: {}
      )
      end

      # Pull or import an image.
      sig do
        params(
          changes: T::Array[String],
          from_image: String,
          from_src: String,
          message: String,
          platform: String,
          repo: String,
          tag: String,
          body: String,
          x_registry_auth: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def pull(
        # Query param: Apply `Dockerfile` instructions to the image that is created, for
        # example: `changes=ENV DEBUG=true`. Note that `ENV DEBUG=true` should be URI
        # component encoded.
        #
        # Supported `Dockerfile` instructions:
        # `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
        changes: nil,
        # Query param: Name of the image to pull. If the name includes a tag or digest,
        # specific behavior applies:
        #
        # - If only `fromImage` includes a tag, that tag is used.
        # - If both `fromImage` and `tag` are provided, `tag` takes precedence.
        # - If `fromImage` includes a digest, the image is pulled by digest, and `tag` is
        #   ignored.
        # - If neither a tag nor digest is specified, all tags are pulled.
        from_image: nil,
        # Query param: Source to import. The value may be a URL from which the image can
        # be retrieved or `-` to read the image from the request body. This parameter may
        # only be used when importing an image.
        from_src: nil,
        # Query param: Set commit message for imported image.
        message: nil,
        # Query param: Platform in the format os[/arch[/variant]].
        #
        # When used in combination with the `fromImage` option, the daemon checks if the
        # given image is present in the local image cache with the given OS and
        # Architecture, and otherwise attempts to pull the image. If the option is not
        # set, the host's native OS and Architecture are used. If the given image does not
        # exist in the local image cache, the daemon attempts to pull the image with the
        # host's native OS and Architecture. If the given image does exists in the local
        # image cache, but its OS or architecture does not match, a warning is produced.
        #
        # When used with the `fromSrc` option to import an image from an archive, this
        # option sets the platform information for the imported image. If the option is
        # not set, the host's native OS and Architecture are used for the imported image.
        platform: nil,
        # Query param: Repository name given to an image when it is imported. The repo may
        # include a tag. This parameter may only be used when importing an image.
        repo: nil,
        # Query param: Tag or digest. If empty when pulling an image, this causes all tags
        # for the given image to be pulled.
        tag: nil,
        # Body param
        body: nil,
        # Header param: A base64url-encoded auth configuration.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Push an image to a registry.
      #
      # If you wish to push an image on to a private registry, that image must already
      # have a tag which references the registry. For example,
      # `registry.example.com/myimage:latest`.
      #
      # The push is cancelled if the HTTP connection is closed.
      sig do
        params(
          name: String,
          x_registry_auth: String,
          platform: String,
          tag: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def push(
        # Path param: Name of the image to push. For example,
        # `registry.example.com/myimage`. The image must be present in the local image
        # store with the same name.
        #
        # The name should be provided without tag; if a tag is provided, it is ignored.
        # For example, `registry.example.com/myimage:latest` is considered equivalent to
        # `registry.example.com/myimage`.
        #
        # Use the `tag` parameter to specify the tag to push.
        name,
        # Header param: A base64url-encoded auth configuration.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth:,
        # Query param: JSON-encoded OCI platform to select the platform-variant to push.
        # If not provided, all available variants will attempt to be pushed.
        #
        # If the daemon provides a multi-platform image store, this selects the
        # platform-variant to push to the registry. If the image is a single-platform
        # image, or if the multi-platform image does not provide a variant matching the
        # given platform, an error is returned.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        # Query param: Tag of the image to push. For example, `latest`. If no tag is
        # provided, all tags of the given image that are present in the local image store
        # are pushed.
        tag: nil,
        request_options: {}
      )
      end

      # Search for an image on Docker Hub.
      sig do
        params(
          term: String,
          filters: String,
          limit: Integer,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineAPI::Models::ImageSearchResponseItem])
      end
      def search(
        # Term to search
        term:,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # images list. Available filters:
        #
        # - `is-official=(true|false)`
        # - `stars=<number>` Matches images that has at least 'number' stars.
        filters: nil,
        # Maximum number of results to return
        limit: nil,
        request_options: {}
      )
      end

      # Create a tag that refers to a source image.
      #
      # This creates an additional reference (tag) to the source image. The tag can
      # include a different repository name and/or tag. If the repository or tag already
      # exists, it will be overwritten.
      sig do
        params(
          name: String,
          repo: String,
          tag: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def tag(
        # Image name or ID to tag.
        name,
        # The repository to tag in. For example, `someuser/someimage`.
        repo: nil,
        # The name of the new tag.
        tag: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
