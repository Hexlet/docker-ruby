# typed: strong

module DockerEngineRuby
  class Client < DockerEngineRuby::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          production: "http://localhost:2375",
          production_tls: "https://localhost:2376"
        },
        T::Hash[Symbol, String]
      )

    sig { returns(DockerEngineRuby::Resources::Auth) }
    attr_reader :auth

    sig { returns(DockerEngineRuby::Resources::System) }
    attr_reader :system_

    sig { returns(DockerEngineRuby::Resources::Containers) }
    attr_reader :containers

    sig { returns(DockerEngineRuby::Resources::Exec) }
    attr_reader :exec_

    sig { returns(DockerEngineRuby::Resources::Images) }
    attr_reader :images

    sig { returns(DockerEngineRuby::Resources::Networks) }
    attr_reader :networks

    sig { returns(DockerEngineRuby::Resources::Volumes) }
    attr_reader :volumes

    sig { returns(DockerEngineRuby::Resources::Services) }
    attr_reader :services

    sig { returns(DockerEngineRuby::Resources::Configs) }
    attr_reader :configs

    sig { returns(DockerEngineRuby::Resources::Secrets) }
    attr_reader :secrets

    sig { returns(DockerEngineRuby::Resources::Nodes) }
    attr_reader :nodes

    sig { returns(DockerEngineRuby::Resources::Swarm) }
    attr_reader :swarm

    sig { returns(DockerEngineRuby::Resources::Tasks) }
    attr_reader :tasks

    sig { returns(DockerEngineRuby::Resources::Plugins) }
    attr_reader :plugins

    sig { returns(DockerEngineRuby::Resources::Distribution) }
    attr_reader :distribution

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `http://localhost:2375`
      # - `production_tls` corresponds to `https://localhost:2376`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["DOCKER_BASE_URL"]`
      base_url: ENV["DOCKER_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DockerEngineRuby::Client::DEFAULT_MAX_RETRIES,
      timeout: DockerEngineRuby::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DockerEngineRuby::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DockerEngineRuby::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
