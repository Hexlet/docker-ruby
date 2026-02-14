# typed: strong

module DockerEngineRuby
  module Models
    ContainerChangesResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::FilesystemChange
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
