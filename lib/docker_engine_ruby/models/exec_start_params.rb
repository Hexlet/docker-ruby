# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Exec#start
    class ExecStartParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute console_size
      #
      #   @return [Array<Integer>, nil]
      optional :console_size,
               DockerEngineRuby::Internal::Type::ArrayOf[Integer],
               api_name: :ConsoleSize,
               nil?: true

      # @!attribute detach
      #
      #   @return [Boolean, nil]
      optional :detach, DockerEngineRuby::Internal::Type::Boolean, api_name: :Detach

      # @!attribute tty
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngineRuby::Internal::Type::Boolean, api_name: :Tty

      # @!method initialize(console_size: nil, detach: nil, tty: nil, request_options: {})
      #   @param console_size [Array<Integer>, nil]
      #   @param detach [Boolean]
      #   @param tty [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
