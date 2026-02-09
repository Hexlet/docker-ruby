# typed: strong

module Docker
  class Client < Docker::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(Docker::Resources::Auth) }
    attr_reader :auth

    sig { returns(Docker::Resources::System) }
    attr_reader :system_

    sig { returns(Docker::Resources::Containers) }
    attr_reader :containers

    sig { returns(Docker::Resources::Images) }
    attr_reader :images

    sig { returns(Docker::Resources::Networks) }
    attr_reader :networks

    sig { returns(Docker::Resources::Volumes) }
    attr_reader :volumes

    sig { returns(Docker::Resources::Services) }
    attr_reader :services

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["DOCKER_BASE_URL"]`
      base_url: ENV["DOCKER_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Docker::Client::DEFAULT_MAX_RETRIES,
      timeout: Docker::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Docker::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Docker::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
