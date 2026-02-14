# typed: strong

module DockerEngineAPI
  class Client < DockerEngineAPI::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(DockerEngineAPI::Resources::Auth) }
    attr_reader :auth

    sig { returns(DockerEngineAPI::Resources::System) }
    attr_reader :system_

    sig { returns(DockerEngineAPI::Resources::Containers) }
    attr_reader :containers

    sig { returns(DockerEngineAPI::Resources::Exec) }
    attr_reader :exec_

    sig { returns(DockerEngineAPI::Resources::Images) }
    attr_reader :images

    sig { returns(DockerEngineAPI::Resources::Networks) }
    attr_reader :networks

    sig { returns(DockerEngineAPI::Resources::Volumes) }
    attr_reader :volumes

    sig { returns(DockerEngineAPI::Resources::Services) }
    attr_reader :services

    sig { returns(DockerEngineAPI::Resources::Configs) }
    attr_reader :configs

    sig { returns(DockerEngineAPI::Resources::Secrets) }
    attr_reader :secrets

    sig { returns(DockerEngineAPI::Resources::Nodes) }
    attr_reader :nodes

    sig { returns(DockerEngineAPI::Resources::Swarm) }
    attr_reader :swarm

    sig { returns(DockerEngineAPI::Resources::Tasks) }
    attr_reader :tasks

    sig { returns(DockerEngineAPI::Resources::Plugins) }
    attr_reader :plugins

    sig { returns(DockerEngineAPI::Resources::Distribution) }
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
      max_retries: DockerEngineAPI::Client::DEFAULT_MAX_RETRIES,
      timeout: DockerEngineAPI::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DockerEngineAPI::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DockerEngineAPI::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
