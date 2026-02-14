# typed: strong

module DockerEngine
  class Client < DockerEngine::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(DockerEngine::Resources::Auth) }
    attr_reader :auth

    sig { returns(DockerEngine::Resources::System) }
    attr_reader :system_

    sig { returns(DockerEngine::Resources::Containers) }
    attr_reader :containers

    sig { returns(DockerEngine::Resources::Exec) }
    attr_reader :exec_

    sig { returns(DockerEngine::Resources::Images) }
    attr_reader :images

    sig { returns(DockerEngine::Resources::Networks) }
    attr_reader :networks

    sig { returns(DockerEngine::Resources::Volumes) }
    attr_reader :volumes

    sig { returns(DockerEngine::Resources::Services) }
    attr_reader :services

    sig { returns(DockerEngine::Resources::Configs) }
    attr_reader :configs

    sig { returns(DockerEngine::Resources::Secrets) }
    attr_reader :secrets

    sig { returns(DockerEngine::Resources::Nodes) }
    attr_reader :nodes

    sig { returns(DockerEngine::Resources::Swarm) }
    attr_reader :swarm

    sig { returns(DockerEngine::Resources::Tasks) }
    attr_reader :tasks

    sig { returns(DockerEngine::Resources::Plugins) }
    attr_reader :plugins

    sig { returns(DockerEngine::Resources::Distribution) }
    attr_reader :distribution

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
      max_retries: DockerEngine::Client::DEFAULT_MAX_RETRIES,
      timeout: DockerEngine::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DockerEngine::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DockerEngine::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
