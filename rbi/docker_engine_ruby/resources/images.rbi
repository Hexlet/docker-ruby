# typed: strong

module DockerEngineRuby
  module Resources
    class Images
      # List Images
      sig do
        params(
          all: T::Boolean,
          digests: T::Boolean,
          filters: String,
          manifests: T::Boolean,
          shared_size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::ImageSummary])
      end
      def list(
        all: nil,
        digests: nil,
        filters: nil,
        manifests: nil,
        shared_size: nil,
        request_options: {}
      )
      end

      # Remove an image
      sig do
        params(
          name: String,
          force: T::Boolean,
          noprune: T::Boolean,
          platforms: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::DeleteItem])
      end
      def delete(
        name,
        force: nil,
        noprune: nil,
        platforms: nil,
        request_options: {}
      )
      end

      # Build an image
      sig do
        params(
          body: DockerEngineRuby::Internal::FileInput,
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
          version: DockerEngineRuby::ImageBuildParams::Version::OrSymbol,
          x_registry_config: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def build(
        # Body param
        body:,
        # Query param
        buildargs: nil,
        # Query param
        cachefrom: nil,
        # Query param
        cpuperiod: nil,
        # Query param
        cpuquota: nil,
        # Query param
        cpusetcpus: nil,
        # Query param
        cpushares: nil,
        # Query param
        dockerfile: nil,
        # Query param
        extrahosts: nil,
        # Query param
        forcerm: nil,
        # Query param
        labels: nil,
        # Query param
        memory: nil,
        # Query param
        memswap: nil,
        # Query param
        networkmode: nil,
        # Query param
        nocache: nil,
        # Query param
        outputs: nil,
        # Query param
        platform: nil,
        # Query param
        pull: nil,
        # Query param
        q: nil,
        # Query param
        remote: nil,
        # Query param
        rm: nil,
        # Query param
        shmsize: nil,
        # Query param
        squash: nil,
        # Query param
        t: nil,
        # Query param
        target: nil,
        # Query param
        version: nil,
        # Header param
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ImageBuildPruneResponse)
      end
      def build_prune(
        all: nil,
        filters: nil,
        max_used_space: nil,
        min_free_space: nil,
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
          exposed_ports:
            T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
          healthcheck: DockerEngineRuby::Config::Healthcheck::OrHash,
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
          volumes: T::Hash[Symbol, T::Hash[Symbol, T.anything]],
          working_dir: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ImageCommitResponse)
      end
      def commit(
        # Query param
        author: nil,
        # Query param
        changes: nil,
        # Query param
        comment: nil,
        # Query param
        container: nil,
        # Query param
        pause: nil,
        # Query param
        repo: nil,
        # Query param
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

      # Export an image
      sig do
        params(
          name: String,
          platform: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def get(name, platform: nil, request_options: {})
      end

      # Export several images
      sig do
        params(
          names: T::Array[String],
          platform: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def get_all(names: nil, platform: nil, request_options: {})
      end

      # Get the history of an image
      sig do
        params(
          name: String,
          platform: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::HistoryItem])
      end
      def history(name, platform: nil, request_options: {})
      end

      # Inspect an image
      sig do
        params(
          name: String,
          manifests: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Image)
      end
      def inspect_(name, manifests: nil, request_options: {})
      end

      # Import images
      sig do
        params(
          body: DockerEngineRuby::Internal::FileInput,
          platform: T::Array[String],
          quiet: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def load_(
        # Body param
        body:,
        # Query param
        platform: nil,
        # Query param
        quiet: nil,
        request_options: {}
      )
      end

      # Delete unused images
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ImagePruneResponse)
      end
      def prune(filters: nil, request_options: {})
      end

      # Create an image
      sig do
        params(
          body: String,
          changes: T::Array[String],
          from_image: String,
          from_src: String,
          message: String,
          platform: String,
          repo: String,
          tag: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def pull(
        # Body param
        body:,
        # Query param
        changes: nil,
        # Query param
        from_image: nil,
        # Query param
        from_src: nil,
        # Query param
        message: nil,
        # Query param
        platform: nil,
        # Query param
        repo: nil,
        # Query param
        tag: nil,
        # Header param
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Push an image
      sig do
        params(
          name: String,
          x_registry_auth: String,
          platform: String,
          tag: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def push(
        # Path param
        name,
        # Header param
        x_registry_auth:,
        # Query param
        platform: nil,
        # Query param
        tag: nil,
        request_options: {}
      )
      end

      # Search images
      sig do
        params(
          term: String,
          filters: String,
          limit: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Models::ImageSearchResponseItem])
      end
      def search(term:, filters: nil, limit: nil, request_options: {})
      end

      # Tag an image
      sig do
        params(
          name: String,
          repo: String,
          tag: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def tag(name, repo: nil, tag: nil, request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
