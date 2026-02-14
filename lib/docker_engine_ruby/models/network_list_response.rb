# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    NetworkListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::NetworkSummary }]
  end
end
