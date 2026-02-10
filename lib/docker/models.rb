# frozen_string_literal: true

module Docker
  [Docker::Internal::Type::BaseModel, *Docker::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Docker::Internal::AnyHash) } }
  end

  Docker::Internal::Util.walk_namespaces(Docker::Models).each do |mod|
    case mod
    in Docker::Internal::Type::Enum | Docker::Internal::Type::Union
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

  Docker::Internal::Util.walk_namespaces(Docker::Models)
                        .lazy
                        .grep(Docker::Internal::Type::Union)
                        .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AuthLoginParams = Docker::Models::AuthLoginParams

  AuthResponse = Docker::Models::AuthResponse

  Config = Docker::Models::Config

  Container = Docker::Models::Container

  ContainerCreateParams = Docker::Models::ContainerCreateParams

  ContainerDeleteParams = Docker::Models::ContainerDeleteParams

  ContainerInspectParams = Docker::Models::ContainerInspectParams

  ContainerKillParams = Docker::Models::ContainerKillParams

  ContainerListParams = Docker::Models::ContainerListParams

  ContainerLogsParams = Docker::Models::ContainerLogsParams

  ContainerStartParams = Docker::Models::ContainerStartParams

  ContainerStopParams = Docker::Models::ContainerStopParams

  CreateRequest = Docker::Models::CreateRequest

  CreateResponse = Docker::Models::CreateResponse

  Error = Docker::Models::Error

  Image = Docker::Models::Image

  ImageDeleteParams = Docker::Models::ImageDeleteParams

  ImageInspectParams = Docker::Models::ImageInspectParams

  ImageListParams = Docker::Models::ImageListParams

  ImagePullParams = Docker::Models::ImagePullParams

  Network = Docker::Models::Network

  NetworkCreateParams = Docker::Models::NetworkCreateParams

  NetworkDeleteParams = Docker::Models::NetworkDeleteParams

  NetworkInspectParams = Docker::Models::NetworkInspectParams

  NetworkListParams = Docker::Models::NetworkListParams

  Service = Docker::Models::Service

  ServiceCreateParams = Docker::Models::ServiceCreateParams

  ServiceDeleteParams = Docker::Models::ServiceDeleteParams

  ServiceInspectParams = Docker::Models::ServiceInspectParams

  ServiceListParams = Docker::Models::ServiceListParams

  Spec = Docker::Models::Spec

  Summary = Docker::Models::Summary

  SystemInfoParams = Docker::Models::SystemInfoParams

  SystemPingParams = Docker::Models::SystemPingParams

  SystemVersionParams = Docker::Models::SystemVersionParams

  Volume = Docker::Models::Volume

  VolumeCreateParams = Docker::Models::VolumeCreateParams

  VolumeDeleteParams = Docker::Models::VolumeDeleteParams

  VolumeInspectParams = Docker::Models::VolumeInspectParams

  VolumeListParams = Docker::Models::VolumeListParams
end
