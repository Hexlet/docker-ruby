# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    TaskListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Task }]
  end
end
