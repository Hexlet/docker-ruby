# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    TaskListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Task }]
  end
end
