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

      sig { returns(T.anything) }
      attr_accessor :body

      sig { returns(T.nilable(String)) }
      attr_reader :buildargs

      sig { params(buildargs: String).void }
      attr_writer :buildargs

      sig { returns(T.nilable(String)) }
      attr_reader :cachefrom

      sig { params(cachefrom: String).void }
      attr_writer :cachefrom

      sig { returns(T.nilable(Integer)) }
      attr_reader :cpuperiod

      sig { params(cpuperiod: Integer).void }
      attr_writer :cpuperiod

      sig { returns(T.nilable(Integer)) }
      attr_reader :cpuquota

      sig { params(cpuquota: Integer).void }
      attr_writer :cpuquota

      sig { returns(T.nilable(String)) }
      attr_reader :cpusetcpus

      sig { params(cpusetcpus: String).void }
      attr_writer :cpusetcpus

      sig { returns(T.nilable(Integer)) }
      attr_reader :cpushares

      sig { params(cpushares: Integer).void }
      attr_writer :cpushares

      sig { returns(T.nilable(String)) }
      attr_reader :dockerfile

      sig { params(dockerfile: String).void }
      attr_writer :dockerfile

      sig { returns(T.nilable(String)) }
      attr_reader :extrahosts

      sig { params(extrahosts: String).void }
      attr_writer :extrahosts

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :forcerm

      sig { params(forcerm: T::Boolean).void }
      attr_writer :forcerm

      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      sig { returns(T.nilable(Integer)) }
      attr_reader :memory

      sig { params(memory: Integer).void }
      attr_writer :memory

      sig { returns(T.nilable(Integer)) }
      attr_reader :memswap

      sig { params(memswap: Integer).void }
      attr_writer :memswap

      sig { returns(T.nilable(String)) }
      attr_reader :networkmode

      sig { params(networkmode: String).void }
      attr_writer :networkmode

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :nocache

      sig { params(nocache: T::Boolean).void }
      attr_writer :nocache

      sig { returns(T.nilable(String)) }
      attr_reader :outputs

      sig { params(outputs: String).void }
      attr_writer :outputs

      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig { returns(T.nilable(String)) }
      attr_reader :pull

      sig { params(pull: String).void }
      attr_writer :pull

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :q

      sig { params(q: T::Boolean).void }
      attr_writer :q

      sig { returns(T.nilable(String)) }
      attr_reader :remote

      sig { params(remote: String).void }
      attr_writer :remote

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rm

      sig { params(rm: T::Boolean).void }
      attr_writer :rm

      sig { returns(T.nilable(Integer)) }
      attr_reader :shmsize

      sig { params(shmsize: Integer).void }
      attr_writer :shmsize

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :squash

      sig { params(squash: T::Boolean).void }
      attr_writer :squash

      sig { returns(T.nilable(String)) }
      attr_reader :t

      sig { params(t: String).void }
      attr_writer :t

      sig { returns(T.nilable(String)) }
      attr_reader :target

      sig { params(target: String).void }
      attr_writer :target

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
          body: T.anything,
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
        buildargs: nil,
        cachefrom: nil,
        cpuperiod: nil,
        cpuquota: nil,
        cpusetcpus: nil,
        cpushares: nil,
        dockerfile: nil,
        extrahosts: nil,
        forcerm: nil,
        labels: nil,
        memory: nil,
        memswap: nil,
        networkmode: nil,
        nocache: nil,
        outputs: nil,
        platform: nil,
        pull: nil,
        q: nil,
        remote: nil,
        rm: nil,
        shmsize: nil,
        squash: nil,
        t: nil,
        target: nil,
        version: nil,
        x_registry_config: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: T.anything,
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
