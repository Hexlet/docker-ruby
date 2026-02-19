# typed: strong

module DockerEngineRuby
  module Models
    class Version < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Version, DockerEngineRuby::Internal::AnyHash)
        end

      # The default (and highest) API version that is supported by the daemon
      sig { returns(T.nilable(String)) }
      attr_reader :api_version

      sig { params(api_version: String).void }
      attr_writer :api_version

      # Architecture of the daemon, as returned by the Go runtime (`GOARCH`).
      #
      # A full list of possible values can be found in the
      # [Go documentation](https://go.dev/doc/install/source#environment).
      sig { returns(T.nilable(String)) }
      attr_reader :arch

      sig { params(arch: String).void }
      attr_writer :arch

      # The date and time that the daemon was compiled.
      sig { returns(T.nilable(String)) }
      attr_reader :build_time

      sig { params(build_time: String).void }
      attr_writer :build_time

      # Information about system components
      sig { returns(T.nilable(T::Array[DockerEngineRuby::Version::Component])) }
      attr_reader :components

      sig do
        params(
          components: T::Array[DockerEngineRuby::Version::Component::OrHash]
        ).void
      end
      attr_writer :components

      # Indicates if the daemon is started with experimental features enabled.
      #
      # This field is omitted when empty / false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :experimental

      sig { params(experimental: T::Boolean).void }
      attr_writer :experimental

      # The Git commit of the source code that was used to build the daemon
      sig { returns(T.nilable(String)) }
      attr_reader :git_commit

      sig { params(git_commit: String).void }
      attr_writer :git_commit

      # The version Go used to compile the daemon, and the version of the Go runtime in
      # use.
      sig { returns(T.nilable(String)) }
      attr_reader :go_version

      sig { params(go_version: String).void }
      attr_writer :go_version

      # The kernel version (`uname -r`) that the daemon is running on.
      #
      # This field is omitted when empty.
      sig { returns(T.nilable(String)) }
      attr_reader :kernel_version

      sig { params(kernel_version: String).void }
      attr_writer :kernel_version

      # The minimum API version that is supported by the daemon
      sig { returns(T.nilable(String)) }
      attr_reader :min_api_version

      sig { params(min_api_version: String).void }
      attr_writer :min_api_version

      # The operating system that the daemon is running on ("linux" or "windows")
      sig { returns(T.nilable(String)) }
      attr_reader :os

      sig { params(os: String).void }
      attr_writer :os

      sig { returns(T.nilable(DockerEngineRuby::Version::Platform)) }
      attr_reader :platform

      sig { params(platform: DockerEngineRuby::Version::Platform::OrHash).void }
      attr_writer :platform

      # The version of the daemon
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      # Response of Engine API: GET "/version"
      sig do
        params(
          api_version: String,
          arch: String,
          build_time: String,
          components: T::Array[DockerEngineRuby::Version::Component::OrHash],
          experimental: T::Boolean,
          git_commit: String,
          go_version: String,
          kernel_version: String,
          min_api_version: String,
          os: String,
          platform: DockerEngineRuby::Version::Platform::OrHash,
          version: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The default (and highest) API version that is supported by the daemon
        api_version: nil,
        # Architecture of the daemon, as returned by the Go runtime (`GOARCH`).
        #
        # A full list of possible values can be found in the
        # [Go documentation](https://go.dev/doc/install/source#environment).
        arch: nil,
        # The date and time that the daemon was compiled.
        build_time: nil,
        # Information about system components
        components: nil,
        # Indicates if the daemon is started with experimental features enabled.
        #
        # This field is omitted when empty / false.
        experimental: nil,
        # The Git commit of the source code that was used to build the daemon
        git_commit: nil,
        # The version Go used to compile the daemon, and the version of the Go runtime in
        # use.
        go_version: nil,
        # The kernel version (`uname -r`) that the daemon is running on.
        #
        # This field is omitted when empty.
        kernel_version: nil,
        # The minimum API version that is supported by the daemon
        min_api_version: nil,
        # The operating system that the daemon is running on ("linux" or "windows")
        os: nil,
        platform: nil,
        # The version of the daemon
        version: nil
      )
      end

      sig do
        override.returns(
          {
            api_version: String,
            arch: String,
            build_time: String,
            components: T::Array[DockerEngineRuby::Version::Component],
            experimental: T::Boolean,
            git_commit: String,
            go_version: String,
            kernel_version: String,
            min_api_version: String,
            os: String,
            platform: DockerEngineRuby::Version::Platform,
            version: String
          }
        )
      end
      def to_hash
      end

      class Component < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Version::Component,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(T.anything)) }
        attr_accessor :details

        sig do
          params(
            name: String,
            version: String,
            details: T.nilable(T.anything)
          ).returns(T.attached_class)
        end
        def self.new(name:, version:, details: nil)
        end

        sig do
          override.returns(
            { name: String, version: String, details: T.nilable(T.anything) }
          )
        end
        def to_hash
        end
      end

      class Platform < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Version::Platform,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { params(name: String).returns(T.attached_class) }
        def self.new(name:)
        end

        sig { override.returns({ name: String }) }
        def to_hash
        end
      end
    end
  end
end
