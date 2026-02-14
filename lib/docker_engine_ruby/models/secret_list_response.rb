# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    SecretListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Secret }]
  end
end
