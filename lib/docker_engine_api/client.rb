# frozen_string_literal: true

module DockerEngineAPI
  class Client < DockerEngineAPI::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [DockerEngineAPI::Resources::Auth]
    attr_reader :auth

    # @return [DockerEngineAPI::Resources::System]
    attr_reader :system_

    # @return [DockerEngineAPI::Resources::Containers]
    attr_reader :containers

    # @return [DockerEngineAPI::Resources::Exec]
    attr_reader :exec_

    # @return [DockerEngineAPI::Resources::Images]
    attr_reader :images

    # @return [DockerEngineAPI::Resources::Networks]
    attr_reader :networks

    # @return [DockerEngineAPI::Resources::Volumes]
    attr_reader :volumes

    # @return [DockerEngineAPI::Resources::Services]
    attr_reader :services

    # @return [DockerEngineAPI::Resources::Configs]
    attr_reader :configs

    # @return [DockerEngineAPI::Resources::Secrets]
    attr_reader :secrets

    # @return [DockerEngineAPI::Resources::Nodes]
    attr_reader :nodes

    # @return [DockerEngineAPI::Resources::Swarm]
    attr_reader :swarm

    # @return [DockerEngineAPI::Resources::Tasks]
    attr_reader :tasks

    # @return [DockerEngineAPI::Resources::Plugins]
    attr_reader :plugins

    # @return [DockerEngineAPI::Resources::Distribution]
    attr_reader :distribution

    # Creates and returns a new client for interacting with the API.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["DOCKER_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      base_url: ENV["DOCKER_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "http://localhost:2375"

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @auth = DockerEngineAPI::Resources::Auth.new(client: self)
      @system_ = DockerEngineAPI::Resources::System.new(client: self)
      @containers = DockerEngineAPI::Resources::Containers.new(client: self)
      @exec_ = DockerEngineAPI::Resources::Exec.new(client: self)
      @images = DockerEngineAPI::Resources::Images.new(client: self)
      @networks = DockerEngineAPI::Resources::Networks.new(client: self)
      @volumes = DockerEngineAPI::Resources::Volumes.new(client: self)
      @services = DockerEngineAPI::Resources::Services.new(client: self)
      @configs = DockerEngineAPI::Resources::Configs.new(client: self)
      @secrets = DockerEngineAPI::Resources::Secrets.new(client: self)
      @nodes = DockerEngineAPI::Resources::Nodes.new(client: self)
      @swarm = DockerEngineAPI::Resources::Swarm.new(client: self)
      @tasks = DockerEngineAPI::Resources::Tasks.new(client: self)
      @plugins = DockerEngineAPI::Resources::Plugins.new(client: self)
      @distribution = DockerEngineAPI::Resources::Distribution.new(client: self)
    end
  end
end
