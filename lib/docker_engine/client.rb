# frozen_string_literal: true

module DockerEngine
  class Client < DockerEngine::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [DockerEngine::Resources::Auth]
    attr_reader :auth

    # @return [DockerEngine::Resources::System]
    attr_reader :system_

    # @return [DockerEngine::Resources::Containers]
    attr_reader :containers

    # @return [DockerEngine::Resources::Images]
    attr_reader :images

    # @return [DockerEngine::Resources::Networks]
    attr_reader :networks

    # @return [DockerEngine::Resources::Volumes]
    attr_reader :volumes

    # @return [DockerEngine::Resources::Services]
    attr_reader :services

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

      @auth = DockerEngine::Resources::Auth.new(client: self)
      @system_ = DockerEngine::Resources::System.new(client: self)
      @containers = DockerEngine::Resources::Containers.new(client: self)
      @images = DockerEngine::Resources::Images.new(client: self)
      @networks = DockerEngine::Resources::Networks.new(client: self)
      @volumes = DockerEngine::Resources::Volumes.new(client: self)
      @services = DockerEngine::Resources::Services.new(client: self)
    end
  end
end
