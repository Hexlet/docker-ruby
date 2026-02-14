# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Exec#start
    class ExecStartParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute console_size
      #   Initial console size, as an `[height, width]` array.
      #
      #   @return [Array<Integer>, nil]
      optional :console_size,
               DockerEngine::Internal::Type::ArrayOf[Integer],
               api_name: :ConsoleSize,
               nil?: true

      # @!attribute detach
      #   Detach from the command.
      #
      #   @return [Boolean, nil]
      optional :detach, DockerEngine::Internal::Type::Boolean, api_name: :Detach

      # @!attribute tty
      #   Allocate a pseudo-TTY.
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngine::Internal::Type::Boolean, api_name: :Tty

      # @!method initialize(console_size: nil, detach: nil, tty: nil, request_options: {})
      #   @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
      #
      #   @param detach [Boolean] Detach from the command.
      #
      #   @param tty [Boolean] Allocate a pseudo-TTY.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
