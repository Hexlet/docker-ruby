# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#build
    class ImageBuildParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart]
      required :body, DockerEngineAPI::Internal::Type::FileInput

      # @!attribute buildargs
      #   JSON map of string pairs for build-time variables. Users pass these values at
      #   build-time. Docker uses the buildargs as the environment context for commands
      #   run via the `Dockerfile` RUN instruction, or for variable expansion in other
      #   `Dockerfile` instructions. This is not meant for passing secret values.
      #
      #   For example, the build arg `FOO=bar` would become `{"FOO":"bar"}` in JSON. This
      #   would result in the query parameter `buildargs={"FOO":"bar"}`. Note that
      #   `{"FOO":"bar"}` should be URI component encoded.
      #
      #   [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)
      #
      #   @return [String, nil]
      optional :buildargs, String

      # @!attribute cachefrom
      #   JSON array of images used for build cache resolution.
      #
      #   @return [String, nil]
      optional :cachefrom, String

      # @!attribute cpuperiod
      #   The length of a CPU period in microseconds.
      #
      #   @return [Integer, nil]
      optional :cpuperiod, Integer

      # @!attribute cpuquota
      #   Microseconds of CPU time that the container can get in a CPU period.
      #
      #   @return [Integer, nil]
      optional :cpuquota, Integer

      # @!attribute cpusetcpus
      #   CPUs in which to allow execution (e.g., `0-3`, `0,1`).
      #
      #   @return [String, nil]
      optional :cpusetcpus, String

      # @!attribute cpushares
      #   CPU shares (relative weight).
      #
      #   @return [Integer, nil]
      optional :cpushares, Integer

      # @!attribute dockerfile
      #   Path within the build context to the `Dockerfile`. This is ignored if `remote`
      #   is specified and points to an external `Dockerfile`.
      #
      #   @return [String, nil]
      optional :dockerfile, String

      # @!attribute extrahosts
      #   Extra hosts to add to /etc/hosts
      #
      #   @return [String, nil]
      optional :extrahosts, String

      # @!attribute forcerm
      #   Always remove intermediate containers, even upon failure.
      #
      #   @return [Boolean, nil]
      optional :forcerm, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute labels
      #   Arbitrary key/value labels to set on the image, as a JSON map of string pairs.
      #
      #   @return [String, nil]
      optional :labels, String

      # @!attribute memory
      #   Set memory limit for build.
      #
      #   @return [Integer, nil]
      optional :memory, Integer

      # @!attribute memswap
      #   Total memory (memory + swap). Set as `-1` to disable swap.
      #
      #   @return [Integer, nil]
      optional :memswap, Integer

      # @!attribute networkmode
      #   Sets the networking mode for the run commands during build. Supported standard
      #   values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value
      #   is taken as a custom network's name or ID to which this container should connect
      #   to.
      #
      #   @return [String, nil]
      optional :networkmode, String

      # @!attribute nocache
      #   Do not use the cache when building the image.
      #
      #   @return [Boolean, nil]
      optional :nocache, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute outputs
      #   BuildKit output configuration in the format of a stringified JSON array of
      #   objects. Each object must have two top-level properties: `Type` and `Attrs`. The
      #   `Type` property must be set to 'moby'. The `Attrs` property is a map of
      #   attributes for the BuildKit output configuration. See
      #   https://docs.docker.com/build/exporters/oci-docker/ for more information.
      #
      #   Example:
      #
      #   ```
      #   [{"Type":"moby","Attrs":{"type":"image","force-compression":"true","compression":"zstd"}}]
      #   ```
      #
      #   @return [String, nil]
      optional :outputs, String

      # @!attribute platform
      #   Platform in the format os[/arch[/variant]]
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute pull
      #   Attempt to pull the image even if an older image exists locally.
      #
      #   @return [String, nil]
      optional :pull, String

      # @!attribute q
      #   Suppress verbose build output.
      #
      #   @return [Boolean, nil]
      optional :q, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute remote
      #   A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single
      #   text file, the file’s contents are placed into a file called `Dockerfile` and
      #   the image is built from that file. If the URI points to a tarball, the file is
      #   downloaded by the daemon and the contents therein used as the context for the
      #   build. If the URI points to a tarball and the `dockerfile` parameter is also
      #   specified, there must be a file with the corresponding path inside the tarball.
      #
      #   @return [String, nil]
      optional :remote, String

      # @!attribute rm
      #   Remove intermediate containers after a successful build.
      #
      #   @return [Boolean, nil]
      optional :rm, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute shmsize
      #   Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the
      #   system uses 64MB.
      #
      #   @return [Integer, nil]
      optional :shmsize, Integer

      # @!attribute squash
      #   Squash the resulting images layers into a single layer. _(Experimental release
      #   only.)_
      #
      #   @return [Boolean, nil]
      optional :squash, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute t
      #   A name and optional tag to apply to the image in the `name:tag` format. If you
      #   omit the tag the default `latest` value is assumed. You can provide several `t`
      #   parameters.
      #
      #   @return [String, nil]
      optional :t, String

      # @!attribute target
      #   Target build stage
      #
      #   @return [String, nil]
      optional :target, String

      # @!attribute version
      #   Version of the builder backend to use.
      #
      #   - `1` is the first generation classic (deprecated) builder in the Docker daemon
      #     (default)
      #   - `2` is [BuildKit](https://github.com/moby/buildkit)
      #
      #   @return [Symbol, DockerEngineAPI::Models::ImageBuildParams::Version, nil]
      optional :version, enum: -> { DockerEngineAPI::ImageBuildParams::Version }

      # @!attribute x_registry_config
      #
      #   @return [String, nil]
      optional :x_registry_config, String

      # @!method initialize(body:, buildargs: nil, cachefrom: nil, cpuperiod: nil, cpuquota: nil, cpusetcpus: nil, cpushares: nil, dockerfile: nil, extrahosts: nil, forcerm: nil, labels: nil, memory: nil, memswap: nil, networkmode: nil, nocache: nil, outputs: nil, platform: nil, pull: nil, q: nil, remote: nil, rm: nil, shmsize: nil, squash: nil, t: nil, target: nil, version: nil, x_registry_config: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ImageBuildParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart]
      #
      #   @param buildargs [String] JSON map of string pairs for build-time variables. Users pass these values at bu
      #
      #   @param cachefrom [String] JSON array of images used for build cache resolution.
      #
      #   @param cpuperiod [Integer] The length of a CPU period in microseconds.
      #
      #   @param cpuquota [Integer] Microseconds of CPU time that the container can get in a CPU period.
      #
      #   @param cpusetcpus [String] CPUs in which to allow execution (e.g., `0-3`, `0,1`).
      #
      #   @param cpushares [Integer] CPU shares (relative weight).
      #
      #   @param dockerfile [String] Path within the build context to the `Dockerfile`. This is ignored if `remote` i
      #
      #   @param extrahosts [String] Extra hosts to add to /etc/hosts
      #
      #   @param forcerm [Boolean] Always remove intermediate containers, even upon failure.
      #
      #   @param labels [String] Arbitrary key/value labels to set on the image, as a JSON map of string pairs.
      #
      #   @param memory [Integer] Set memory limit for build.
      #
      #   @param memswap [Integer] Total memory (memory + swap). Set as `-1` to disable swap.
      #
      #   @param networkmode [String] Sets the networking mode for the run commands during build. Supported
      #
      #   @param nocache [Boolean] Do not use the cache when building the image.
      #
      #   @param outputs [String] BuildKit output configuration in the format of a stringified JSON array of objec
      #
      #   @param platform [String] Platform in the format os[/arch[/variant]]
      #
      #   @param pull [String] Attempt to pull the image even if an older image exists locally.
      #
      #   @param q [Boolean] Suppress verbose build output.
      #
      #   @param remote [String] A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single te
      #
      #   @param rm [Boolean] Remove intermediate containers after a successful build.
      #
      #   @param shmsize [Integer] Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the sys
      #
      #   @param squash [Boolean] Squash the resulting images layers into a single layer. \*(Experimental release
      #   o
      #
      #   @param t [String] A name and optional tag to apply to the image in the `name:tag` format. If you o
      #
      #   @param target [String] Target build stage
      #
      #   @param version [Symbol, DockerEngineAPI::Models::ImageBuildParams::Version] Version of the builder backend to use.
      #
      #   @param x_registry_config [String]
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      # Version of the builder backend to use.
      #
      # - `1` is the first generation classic (deprecated) builder in the Docker daemon
      #   (default)
      # - `2` is [BuildKit](https://github.com/moby/buildkit)
      module Version
        extend DockerEngineAPI::Internal::Type::Enum

        VERSION_1 = :"1"
        VERSION_2 = :"2"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
