# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#build
    class ImageBuildParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Object]
      required :body, DockerEngineRuby::Internal::Type::Unknown

      # @!attribute buildargs
      #
      #   @return [String, nil]
      optional :buildargs, String

      # @!attribute cachefrom
      #
      #   @return [String, nil]
      optional :cachefrom, String

      # @!attribute cpuperiod
      #
      #   @return [Integer, nil]
      optional :cpuperiod, Integer

      # @!attribute cpuquota
      #
      #   @return [Integer, nil]
      optional :cpuquota, Integer

      # @!attribute cpusetcpus
      #
      #   @return [String, nil]
      optional :cpusetcpus, String

      # @!attribute cpushares
      #
      #   @return [Integer, nil]
      optional :cpushares, Integer

      # @!attribute dockerfile
      #
      #   @return [String, nil]
      optional :dockerfile, String

      # @!attribute extrahosts
      #
      #   @return [String, nil]
      optional :extrahosts, String

      # @!attribute forcerm
      #
      #   @return [Boolean, nil]
      optional :forcerm, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute labels
      #
      #   @return [String, nil]
      optional :labels, String

      # @!attribute memory
      #
      #   @return [Integer, nil]
      optional :memory, Integer

      # @!attribute memswap
      #
      #   @return [Integer, nil]
      optional :memswap, Integer

      # @!attribute networkmode
      #
      #   @return [String, nil]
      optional :networkmode, String

      # @!attribute nocache
      #
      #   @return [Boolean, nil]
      optional :nocache, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute outputs
      #
      #   @return [String, nil]
      optional :outputs, String

      # @!attribute platform
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute pull
      #
      #   @return [String, nil]
      optional :pull, String

      # @!attribute q
      #
      #   @return [Boolean, nil]
      optional :q, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute remote
      #
      #   @return [String, nil]
      optional :remote, String

      # @!attribute rm
      #
      #   @return [Boolean, nil]
      optional :rm, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute shmsize
      #
      #   @return [Integer, nil]
      optional :shmsize, Integer

      # @!attribute squash
      #
      #   @return [Boolean, nil]
      optional :squash, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute t
      #
      #   @return [String, nil]
      optional :t, String

      # @!attribute target
      #
      #   @return [String, nil]
      optional :target, String

      # @!attribute version
      #
      #   @return [Symbol, DockerEngineRuby::Models::ImageBuildParams::Version, nil]
      optional :version, enum: -> { DockerEngineRuby::ImageBuildParams::Version }

      # @!attribute x_registry_config
      #
      #   @return [String, nil]
      optional :x_registry_config, String

      # @!method initialize(body:, buildargs: nil, cachefrom: nil, cpuperiod: nil, cpuquota: nil, cpusetcpus: nil, cpushares: nil, dockerfile: nil, extrahosts: nil, forcerm: nil, labels: nil, memory: nil, memswap: nil, networkmode: nil, nocache: nil, outputs: nil, platform: nil, pull: nil, q: nil, remote: nil, rm: nil, shmsize: nil, squash: nil, t: nil, target: nil, version: nil, x_registry_config: nil, request_options: {})
      #   @param body [Object]
      #   @param buildargs [String]
      #   @param cachefrom [String]
      #   @param cpuperiod [Integer]
      #   @param cpuquota [Integer]
      #   @param cpusetcpus [String]
      #   @param cpushares [Integer]
      #   @param dockerfile [String]
      #   @param extrahosts [String]
      #   @param forcerm [Boolean]
      #   @param labels [String]
      #   @param memory [Integer]
      #   @param memswap [Integer]
      #   @param networkmode [String]
      #   @param nocache [Boolean]
      #   @param outputs [String]
      #   @param platform [String]
      #   @param pull [String]
      #   @param q [Boolean]
      #   @param remote [String]
      #   @param rm [Boolean]
      #   @param shmsize [Integer]
      #   @param squash [Boolean]
      #   @param t [String]
      #   @param target [String]
      #   @param version [Symbol, DockerEngineRuby::Models::ImageBuildParams::Version]
      #   @param x_registry_config [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      module Version
        extend DockerEngineRuby::Internal::Type::Enum

        VERSION_1 = :"1"
        VERSION_2 = :"2"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
