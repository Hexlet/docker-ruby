# frozen_string_literal: true

module DockerEngineRuby
  class Client < DockerEngineRuby::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {production: "http://localhost:2375", production_tls: "https://localhost:2376"}
    # rubocop:enable Style/MutableConstant

    # @return [DockerEngineRuby::Resources::Auth]
    attr_reader :auth

    # @return [DockerEngineRuby::Resources::System]
    attr_reader :system_

    # @return [DockerEngineRuby::Resources::Containers]
    attr_reader :containers

    # @return [DockerEngineRuby::Resources::Exec]
    attr_reader :exec_

    # @return [DockerEngineRuby::Resources::Images]
    attr_reader :images

    # @return [DockerEngineRuby::Resources::Networks]
    attr_reader :networks

    # @return [DockerEngineRuby::Resources::Volumes]
    attr_reader :volumes

    # @return [DockerEngineRuby::Resources::Services]
    attr_reader :services

    # @return [DockerEngineRuby::Resources::Configs]
    attr_reader :configs

    # @return [DockerEngineRuby::Resources::Secrets]
    attr_reader :secrets

    # @return [DockerEngineRuby::Resources::Nodes]
    attr_reader :nodes

    # @return [DockerEngineRuby::Resources::Swarm]
    attr_reader :swarm

    # @return [DockerEngineRuby::Resources::Tasks]
    attr_reader :tasks

    # @return [DockerEngineRuby::Resources::Plugins]
    attr_reader :plugins

    # @return [DockerEngineRuby::Resources::Distribution]
    attr_reader :distribution

    # Creates and returns a new client for interacting with the API.
    #
    # @param environment [:production, :production_tls, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `http://localhost:2375`
    # - `production_tls` corresponds to `https://localhost:2376`
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
      environment: nil,
      base_url: ENV["DOCKER_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= DockerEngineRuby::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{DockerEngineRuby::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @auth = DockerEngineRuby::Resources::Auth.new(client: self)
      @system_ = DockerEngineRuby::Resources::System.new(client: self)
      @containers = DockerEngineRuby::Resources::Containers.new(client: self)
      @exec_ = DockerEngineRuby::Resources::Exec.new(client: self)
      @images = DockerEngineRuby::Resources::Images.new(client: self)
      @networks = DockerEngineRuby::Resources::Networks.new(client: self)
      @volumes = DockerEngineRuby::Resources::Volumes.new(client: self)
      @services = DockerEngineRuby::Resources::Services.new(client: self)
      @configs = DockerEngineRuby::Resources::Configs.new(client: self)
      @secrets = DockerEngineRuby::Resources::Secrets.new(client: self)
      @nodes = DockerEngineRuby::Resources::Nodes.new(client: self)
      @swarm = DockerEngineRuby::Resources::Swarm.new(client: self)
      @tasks = DockerEngineRuby::Resources::Tasks.new(client: self)
      @plugins = DockerEngineRuby::Resources::Plugins.new(client: self)
      @distribution = DockerEngineRuby::Resources::Distribution.new(client: self)
    end
  end
end
