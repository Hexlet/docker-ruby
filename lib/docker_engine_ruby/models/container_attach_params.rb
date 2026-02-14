# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#attach
    class ContainerAttachParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute detach_keys
      #
      #   @return [String, nil]
      optional :detach_keys, String

      # @!attribute logs
      #
      #   @return [Boolean, nil]
      optional :logs, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stderr
      #
      #   @return [Boolean, nil]
      optional :stderr, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stdin
      #
      #   @return [Boolean, nil]
      optional :stdin, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stdout
      #
      #   @return [Boolean, nil]
      optional :stdout, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stream
      #
      #   @return [Boolean, nil]
      optional :stream, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(detach_keys: nil, logs: nil, stderr: nil, stdin: nil, stdout: nil, stream: nil, request_options: {})
      #   @param detach_keys [String]
      #   @param logs [Boolean]
      #   @param stderr [Boolean]
      #   @param stdin [Boolean]
      #   @param stdout [Boolean]
      #   @param stream [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
