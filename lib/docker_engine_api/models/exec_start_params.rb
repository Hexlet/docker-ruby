# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Exec#start
    class ExecStartParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute console_size
      #   Initial console size, as an `[height, width]` array.
      #
      #   @return [Array<Integer>, nil]
      optional :console_size,
               DockerEngineAPI::Internal::Type::ArrayOf[Integer],
               api_name: :ConsoleSize,
               nil?: true

      # @!attribute detach
      #   Detach from the command.
      #
      #   @return [Boolean, nil]
      optional :detach, DockerEngineAPI::Internal::Type::Boolean, api_name: :Detach

      # @!attribute tty
      #   Allocate a pseudo-TTY.
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngineAPI::Internal::Type::Boolean, api_name: :Tty

      # @!method initialize(console_size: nil, detach: nil, tty: nil, request_options: {})
      #   @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
      #
      #   @param detach [Boolean] Detach from the command.
      #
      #   @param tty [Boolean] Allocate a pseudo-TTY.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
