# typed: strong

module DockerEngineRuby
  module Models
    class ImageBuildParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageBuildParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::Internal::FileInput) }
      attr_accessor :body

      # JSON map of string pairs for build-time variables. Users pass these values at
      # build-time. Docker uses the buildargs as the environment context for commands
      # run via the `Dockerfile` RUN instruction, or for variable expansion in other
      # `Dockerfile` instructions. This is not meant for passing secret values.
      #
      # For example, the build arg `FOO=bar` would become `{"FOO":"bar"}` in JSON. This
      # would result in the query parameter `buildargs={"FOO":"bar"}`. Note that
      # `{"FOO":"bar"}` should be URI component encoded.
      #
      # [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)
      sig { returns(T.nilable(String)) }
      attr_reader :buildargs

      sig { params(buildargs: String).void }
      attr_writer :buildargs

      # JSON array of images used for build cache resolution.
      sig { returns(T.nilable(String)) }
      attr_reader :cachefrom

      sig { params(cachefrom: String).void }
      attr_writer :cachefrom

      # The length of a CPU period in microseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :cpuperiod

      sig { params(cpuperiod: Integer).void }
      attr_writer :cpuperiod

      # Microseconds of CPU time that the container can get in a CPU period.
      sig { returns(T.nilable(Integer)) }
      attr_reader :cpuquota

      sig { params(cpuquota: Integer).void }
      attr_writer :cpuquota

      # CPUs in which to allow execution (e.g., `0-3`, `0,1`).
      sig { returns(T.nilable(String)) }
      attr_reader :cpusetcpus

      sig { params(cpusetcpus: String).void }
      attr_writer :cpusetcpus

      # CPU shares (relative weight).
      sig { returns(T.nilable(Integer)) }
      attr_reader :cpushares

      sig { params(cpushares: Integer).void }
      attr_writer :cpushares

      # Path within the build context to the `Dockerfile`. This is ignored if `remote`
      # is specified and points to an external `Dockerfile`.
      sig { returns(T.nilable(String)) }
      attr_reader :dockerfile

      sig { params(dockerfile: String).void }
      attr_writer :dockerfile

      # Extra hosts to add to /etc/hosts
      sig { returns(T.nilable(String)) }
      attr_reader :extrahosts

      sig { params(extrahosts: String).void }
      attr_writer :extrahosts

      # Always remove intermediate containers, even upon failure.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :forcerm

      sig { params(forcerm: T::Boolean).void }
      attr_writer :forcerm

      # Arbitrary key/value labels to set on the image, as a JSON map of string pairs.
      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      # Set memory limit for build.
      sig { returns(T.nilable(Integer)) }
      attr_reader :memory

      sig { params(memory: Integer).void }
      attr_writer :memory

      # Total memory (memory + swap). Set as `-1` to disable swap.
      sig { returns(T.nilable(Integer)) }
      attr_reader :memswap

      sig { params(memswap: Integer).void }
      attr_writer :memswap

      # Sets the networking mode for the run commands during build. Supported standard
      # values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value
      # is taken as a custom network's name or ID to which this container should connect
      # to.
      sig { returns(T.nilable(String)) }
      attr_reader :networkmode

      sig { params(networkmode: String).void }
      attr_writer :networkmode

      # Do not use the cache when building the image.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :nocache

      sig { params(nocache: T::Boolean).void }
      attr_writer :nocache

      # BuildKit output configuration in the format of a stringified JSON array of
      # objects. Each object must have two top-level properties: `Type` and `Attrs`. The
      # `Type` property must be set to 'moby'. The `Attrs` property is a map of
      # attributes for the BuildKit output configuration. See
      # https://docs.docker.com/build/exporters/oci-docker/ for more information.
      #
      # Example:
      #
      # ```
      # [{"Type":"moby","Attrs":{"type":"image","force-compression":"true","compression":"zstd"}}]
      # ```
      sig { returns(T.nilable(String)) }
      attr_reader :outputs

      sig { params(outputs: String).void }
      attr_writer :outputs

      # Platform in the format os[/arch[/variant]]
      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      # Attempt to pull the image even if an older image exists locally.
      sig { returns(T.nilable(String)) }
      attr_reader :pull

      sig { params(pull: String).void }
      attr_writer :pull

      # Suppress verbose build output.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :q

      sig { params(q: T::Boolean).void }
      attr_writer :q

      # A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single
      # text file, the file’s contents are placed into a file called `Dockerfile` and
      # the image is built from that file. If the URI points to a tarball, the file is
      # downloaded by the daemon and the contents therein used as the context for the
      # build. If the URI points to a tarball and the `dockerfile` parameter is also
      # specified, there must be a file with the corresponding path inside the tarball.
      sig { returns(T.nilable(String)) }
      attr_reader :remote

      sig { params(remote: String).void }
      attr_writer :remote

      # Remove intermediate containers after a successful build.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rm

      sig { params(rm: T::Boolean).void }
      attr_writer :rm

      # Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the
      # system uses 64MB.
      sig { returns(T.nilable(Integer)) }
      attr_reader :shmsize

      sig { params(shmsize: Integer).void }
      attr_writer :shmsize

      # Squash the resulting images layers into a single layer. _(Experimental release
      # only.)_
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :squash

      sig { params(squash: T::Boolean).void }
      attr_writer :squash

      # A name and optional tag to apply to the image in the `name:tag` format. If you
      # omit the tag the default `latest` value is assumed. You can provide several `t`
      # parameters.
      sig { returns(T.nilable(String)) }
      attr_reader :t

      sig { params(t: String).void }
      attr_writer :t

      # Target build stage
      sig { returns(T.nilable(String)) }
      attr_reader :target

      sig { params(target: String).void }
      attr_writer :target

      # Version of the builder backend to use.
      #
      # - `1` is the first generation classic (deprecated) builder in the Docker daemon
      #   (default)
      # - `2` is [BuildKit](https://github.com/moby/buildkit)
      sig do
        returns(
          T.nilable(DockerEngineRuby::ImageBuildParams::Version::OrSymbol)
        )
      end
      attr_reader :version

      sig do
        params(
          version: DockerEngineRuby::ImageBuildParams::Version::OrSymbol
        ).void
      end
      attr_writer :version

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_config

      sig { params(x_registry_config: String).void }
      attr_writer :x_registry_config

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
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        # JSON map of string pairs for build-time variables. Users pass these values at
        # build-time. Docker uses the buildargs as the environment context for commands
        # run via the `Dockerfile` RUN instruction, or for variable expansion in other
        # `Dockerfile` instructions. This is not meant for passing secret values.
        #
        # For example, the build arg `FOO=bar` would become `{"FOO":"bar"}` in JSON. This
        # would result in the query parameter `buildargs={"FOO":"bar"}`. Note that
        # `{"FOO":"bar"}` should be URI component encoded.
        #
        # [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)
        buildargs: nil,
        # JSON array of images used for build cache resolution.
        cachefrom: nil,
        # The length of a CPU period in microseconds.
        cpuperiod: nil,
        # Microseconds of CPU time that the container can get in a CPU period.
        cpuquota: nil,
        # CPUs in which to allow execution (e.g., `0-3`, `0,1`).
        cpusetcpus: nil,
        # CPU shares (relative weight).
        cpushares: nil,
        # Path within the build context to the `Dockerfile`. This is ignored if `remote`
        # is specified and points to an external `Dockerfile`.
        dockerfile: nil,
        # Extra hosts to add to /etc/hosts
        extrahosts: nil,
        # Always remove intermediate containers, even upon failure.
        forcerm: nil,
        # Arbitrary key/value labels to set on the image, as a JSON map of string pairs.
        labels: nil,
        # Set memory limit for build.
        memory: nil,
        # Total memory (memory + swap). Set as `-1` to disable swap.
        memswap: nil,
        # Sets the networking mode for the run commands during build. Supported standard
        # values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value
        # is taken as a custom network's name or ID to which this container should connect
        # to.
        networkmode: nil,
        # Do not use the cache when building the image.
        nocache: nil,
        # BuildKit output configuration in the format of a stringified JSON array of
        # objects. Each object must have two top-level properties: `Type` and `Attrs`. The
        # `Type` property must be set to 'moby'. The `Attrs` property is a map of
        # attributes for the BuildKit output configuration. See
        # https://docs.docker.com/build/exporters/oci-docker/ for more information.
        #
        # Example:
        #
        # ```
        # [{"Type":"moby","Attrs":{"type":"image","force-compression":"true","compression":"zstd"}}]
        # ```
        outputs: nil,
        # Platform in the format os[/arch[/variant]]
        platform: nil,
        # Attempt to pull the image even if an older image exists locally.
        pull: nil,
        # Suppress verbose build output.
        q: nil,
        # A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single
        # text file, the file’s contents are placed into a file called `Dockerfile` and
        # the image is built from that file. If the URI points to a tarball, the file is
        # downloaded by the daemon and the contents therein used as the context for the
        # build. If the URI points to a tarball and the `dockerfile` parameter is also
        # specified, there must be a file with the corresponding path inside the tarball.
        remote: nil,
        # Remove intermediate containers after a successful build.
        rm: nil,
        # Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the
        # system uses 64MB.
        shmsize: nil,
        # Squash the resulting images layers into a single layer. _(Experimental release
        # only.)_
        squash: nil,
        # A name and optional tag to apply to the image in the `name:tag` format. If you
        # omit the tag the default `latest` value is assumed. You can provide several `t`
        # parameters.
        t: nil,
        # Target build stage
        target: nil,
        # Version of the builder backend to use.
        #
        # - `1` is the first generation classic (deprecated) builder in the Docker daemon
        #   (default)
        # - `2` is [BuildKit](https://github.com/moby/buildkit)
        version: nil,
        x_registry_config: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Version of the builder backend to use.
      #
      # - `1` is the first generation classic (deprecated) builder in the Docker daemon
      #   (default)
      # - `2` is [BuildKit](https://github.com/moby/buildkit)
      module Version
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineRuby::ImageBuildParams::Version)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VERSION_1 =
          T.let(:"1", DockerEngineRuby::ImageBuildParams::Version::TaggedSymbol)
        VERSION_2 =
          T.let(:"2", DockerEngineRuby::ImageBuildParams::Version::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::ImageBuildParams::Version::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
