# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::System#version
    class SystemVersionResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute api_version
      #   The default (and highest) API version that is supported by the daemon
      #
      #   @return [String, nil]
      optional :api_version, String, api_name: :ApiVersion

      # @!attribute arch
      #   Architecture of the daemon, as returned by the Go runtime (`GOARCH`).
      #
      #   A full list of possible values can be found in the
      #   [Go documentation](https://go.dev/doc/install/source#environment).
      #
      #   @return [String, nil]
      optional :arch, String, api_name: :Arch

      # @!attribute build_time
      #   The date and time that the daemon was compiled.
      #
      #   @return [String, nil]
      optional :build_time, String, api_name: :BuildTime

      # @!attribute components
      #   Information about system components
      #
      #   @return [Array<DockerEngine::Models::SystemVersionResponse::Component>, nil]
      optional :components,
               -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::SystemVersionResponse::Component] },
               api_name: :Components

      # @!attribute experimental
      #   Indicates if the daemon is started with experimental features enabled.
      #
      #   This field is omitted when empty / false.
      #
      #   @return [Boolean, nil]
      optional :experimental, DockerEngine::Internal::Type::Boolean, api_name: :Experimental

      # @!attribute git_commit
      #   The Git commit of the source code that was used to build the daemon
      #
      #   @return [String, nil]
      optional :git_commit, String, api_name: :GitCommit

      # @!attribute go_version
      #   The version Go used to compile the daemon, and the version of the Go runtime in
      #   use.
      #
      #   @return [String, nil]
      optional :go_version, String, api_name: :GoVersion

      # @!attribute kernel_version
      #   The kernel version (`uname -r`) that the daemon is running on.
      #
      #   This field is omitted when empty.
      #
      #   @return [String, nil]
      optional :kernel_version, String, api_name: :KernelVersion

      # @!attribute min_api_version
      #   The minimum API version that is supported by the daemon
      #
      #   @return [String, nil]
      optional :min_api_version, String, api_name: :MinAPIVersion

      # @!attribute os
      #   The operating system that the daemon is running on ("linux" or "windows")
      #
      #   @return [String, nil]
      optional :os, String, api_name: :Os

      # @!attribute platform
      #
      #   @return [DockerEngine::Models::SystemVersionResponse::Platform, nil]
      optional :platform, -> { DockerEngine::Models::SystemVersionResponse::Platform }, api_name: :Platform

      # @!attribute version
      #   The version of the daemon
      #
      #   @return [String, nil]
      optional :version, String, api_name: :Version

      # @!method initialize(api_version: nil, arch: nil, build_time: nil, components: nil, experimental: nil, git_commit: nil, go_version: nil, kernel_version: nil, min_api_version: nil, os: nil, platform: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::SystemVersionResponse} for more details.
      #
      #   Response of Engine API: GET "/version"
      #
      #   @param api_version [String] The default (and highest) API version that is supported by the daemon
      #
      #   @param arch [String] Architecture of the daemon, as returned by the Go runtime (`GOARCH`).
      #
      #   @param build_time [String] The date and time that the daemon was compiled.
      #
      #   @param components [Array<DockerEngine::Models::SystemVersionResponse::Component>] Information about system components
      #
      #   @param experimental [Boolean] Indicates if the daemon is started with experimental features enabled.
      #
      #   @param git_commit [String] The Git commit of the source code that was used to build the daemon
      #
      #   @param go_version [String] The version Go used to compile the daemon, and the version of the Go
      #
      #   @param kernel_version [String] The kernel version (`uname -r`) that the daemon is running on.
      #
      #   @param min_api_version [String] The minimum API version that is supported by the daemon
      #
      #   @param os [String] The operating system that the daemon is running on ("linux" or "windows")
      #
      #   @param platform [DockerEngine::Models::SystemVersionResponse::Platform]
      #
      #   @param version [String] The version of the daemon

      class Component < DockerEngine::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the component
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!attribute version
        #   Version of the component
        #
        #   @return [String]
        required :version, String, api_name: :Version

        # @!attribute details
        #   Key/value pairs of strings with additional information about the component.
        #   These values are intended for informational purposes only, and their content is
        #   not defined, and not part of the API specification.
        #
        #   These messages can be printed by the client as information to the user.
        #
        #   @return [Object, nil]
        optional :details, DockerEngine::Internal::Type::Unknown, api_name: :Details, nil?: true

        # @!method initialize(name:, version:, details: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::SystemVersionResponse::Component} for more details.
        #
        #   @param name [String] Name of the component
        #
        #   @param version [String] Version of the component
        #
        #   @param details [Object, nil] Key/value pairs of strings with additional information about the
      end

      # @see DockerEngine::Models::SystemVersionResponse#platform
      class Platform < DockerEngine::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String, api_name: :Name

        # @!method initialize(name:)
        #   @param name [String]
      end
    end
  end
end
