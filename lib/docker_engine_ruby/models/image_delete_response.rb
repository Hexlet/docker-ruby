# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ImageDeleteResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::DeleteItem }]
  end
end
