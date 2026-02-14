# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ServiceListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Service }]
  end
end
