# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#restart
    class ContainerRestartParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute signal
      #
      #   @return [String, nil]
      optional :signal, String

      # @!attribute t
      #
      #   @return [Integer, nil]
      optional :t, Integer

      # @!method initialize(signal: nil, t: nil, request_options: {})
      #   @param signal [String]
      #   @param t [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
