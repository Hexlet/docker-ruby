# frozen_string_literal: true

module DockerEngine
  [DockerEngine::Internal::Type::BaseModel, *DockerEngine::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, DockerEngine::Internal::AnyHash) } }
  end

  DockerEngine::Internal::Util.walk_namespaces(DockerEngine::Models).each do |mod|
    case mod
    in DockerEngine::Internal::Type::Enum | DockerEngine::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  DockerEngine::Internal::Util.walk_namespaces(DockerEngine::Models)
                              .lazy
                              .grep(DockerEngine::Internal::Type::Union)
                              .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AuthLoginParams = DockerEngine::Models::AuthLoginParams

  AuthResponse = DockerEngine::Models::AuthResponse

  Config = DockerEngine::Models::Config

  Container = DockerEngine::Models::Container

  ContainerCreateParams = DockerEngine::Models::ContainerCreateParams

  ContainerDeleteParams = DockerEngine::Models::ContainerDeleteParams

  ContainerInspectParams = DockerEngine::Models::ContainerInspectParams

  ContainerKillParams = DockerEngine::Models::ContainerKillParams

  ContainerListParams = DockerEngine::Models::ContainerListParams

  ContainerLogsParams = DockerEngine::Models::ContainerLogsParams

  ContainerStartParams = DockerEngine::Models::ContainerStartParams

  ContainerStopParams = DockerEngine::Models::ContainerStopParams

  CreateRequest = DockerEngine::Models::CreateRequest

  CreateResponse = DockerEngine::Models::CreateResponse

  Error = DockerEngine::Models::Error

  Image = DockerEngine::Models::Image

  ImageDeleteParams = DockerEngine::Models::ImageDeleteParams

  ImageInspectParams = DockerEngine::Models::ImageInspectParams

  ImageListParams = DockerEngine::Models::ImageListParams

  ImagePullParams = DockerEngine::Models::ImagePullParams

  Network = DockerEngine::Models::Network

  NetworkCreateParams = DockerEngine::Models::NetworkCreateParams

  NetworkDeleteParams = DockerEngine::Models::NetworkDeleteParams

  NetworkInspectParams = DockerEngine::Models::NetworkInspectParams

  NetworkListParams = DockerEngine::Models::NetworkListParams

  Service = DockerEngine::Models::Service

  ServiceCreateParams = DockerEngine::Models::ServiceCreateParams

  ServiceDeleteParams = DockerEngine::Models::ServiceDeleteParams

  ServiceInspectParams = DockerEngine::Models::ServiceInspectParams

  ServiceListParams = DockerEngine::Models::ServiceListParams

  Spec = DockerEngine::Models::Spec

  Summary = DockerEngine::Models::Summary

  SystemInfoParams = DockerEngine::Models::SystemInfoParams

  SystemPingParams = DockerEngine::Models::SystemPingParams

  SystemVersionParams = DockerEngine::Models::SystemVersionParams

  Volume = DockerEngine::Models::Volume

  VolumeCreateParams = DockerEngine::Models::VolumeCreateParams

  VolumeDeleteParams = DockerEngine::Models::VolumeDeleteParams

  VolumeInspectParams = DockerEngine::Models::VolumeInspectParams

  VolumeListParams = DockerEngine::Models::VolumeListParams
end
