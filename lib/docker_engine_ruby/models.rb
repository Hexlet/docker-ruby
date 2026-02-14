# frozen_string_literal: true

module DockerEngineRuby
  [
    DockerEngineRuby::Internal::Type::BaseModel,
    *DockerEngineRuby::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, DockerEngineRuby::Internal::AnyHash) } }
  end

  DockerEngineRuby::Internal::Util.walk_namespaces(DockerEngineRuby::Models).each do |mod|
    case mod
    in DockerEngineRuby::Internal::Type::Enum | DockerEngineRuby::Internal::Type::Union
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

  DockerEngineRuby::Internal::Util.walk_namespaces(DockerEngineRuby::Models)
                                  .lazy
                                  .grep(DockerEngineRuby::Internal::Type::Union)
                                  .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AuthLoginParams = DockerEngineRuby::Models::AuthLoginParams

  AuthResponse = DockerEngineRuby::Models::AuthResponse

  Config = DockerEngineRuby::Models::Config

  ConfigCreateParams = DockerEngineRuby::Models::ConfigCreateParams

  ConfigDeleteParams = DockerEngineRuby::Models::ConfigDeleteParams

  ConfigInspectParams = DockerEngineRuby::Models::ConfigInspectParams

  ConfigListParams = DockerEngineRuby::Models::ConfigListParams

  ConfigUpdateParams = DockerEngineRuby::Models::ConfigUpdateParams

  ConnectRequest = DockerEngineRuby::Models::ConnectRequest

  Container = DockerEngineRuby::Models::Container

  ContainerArchiveParams = DockerEngineRuby::Models::ContainerArchiveParams

  ContainerAttachParams = DockerEngineRuby::Models::ContainerAttachParams

  ContainerChangesParams = DockerEngineRuby::Models::ContainerChangesParams

  ContainerCreateParams = DockerEngineRuby::Models::ContainerCreateParams

  ContainerDeleteParams = DockerEngineRuby::Models::ContainerDeleteParams

  ContainerExecParams = DockerEngineRuby::Models::ContainerExecParams

  ContainerExportParams = DockerEngineRuby::Models::ContainerExportParams

  ContainerInspectParams = DockerEngineRuby::Models::ContainerInspectParams

  ContainerKillParams = DockerEngineRuby::Models::ContainerKillParams

  ContainerListParams = DockerEngineRuby::Models::ContainerListParams

  ContainerLogsParams = DockerEngineRuby::Models::ContainerLogsParams

  ContainerPauseParams = DockerEngineRuby::Models::ContainerPauseParams

  ContainerPruneParams = DockerEngineRuby::Models::ContainerPruneParams

  ContainerRenameParams = DockerEngineRuby::Models::ContainerRenameParams

  ContainerResizeParams = DockerEngineRuby::Models::ContainerResizeParams

  ContainerRestartParams = DockerEngineRuby::Models::ContainerRestartParams

  ContainerStartParams = DockerEngineRuby::Models::ContainerStartParams

  ContainerStatsParams = DockerEngineRuby::Models::ContainerStatsParams

  ContainerStopParams = DockerEngineRuby::Models::ContainerStopParams

  ContainerTopParams = DockerEngineRuby::Models::ContainerTopParams

  ContainerUnpauseParams = DockerEngineRuby::Models::ContainerUnpauseParams

  ContainerUpdateParams = DockerEngineRuby::Models::ContainerUpdateParams

  ContainerWaitParams = DockerEngineRuby::Models::ContainerWaitParams

  CreateRequest = DockerEngineRuby::Models::CreateRequest

  CreateResponse = DockerEngineRuby::Models::CreateResponse

  DeleteItem = DockerEngineRuby::Models::DeleteItem

  DisconnectRequest = DockerEngineRuby::Models::DisconnectRequest

  DistributionInspectParams = DockerEngineRuby::Models::DistributionInspectParams

  Error = DockerEngineRuby::Models::Error

  ExecInspectParams = DockerEngineRuby::Models::ExecInspectParams

  ExecResizeParams = DockerEngineRuby::Models::ExecResizeParams

  ExecStartParams = DockerEngineRuby::Models::ExecStartParams

  FilesystemChange = DockerEngineRuby::Models::FilesystemChange

  HistoryItem = DockerEngineRuby::Models::HistoryItem

  Image = DockerEngineRuby::Models::Image

  ImageBuildParams = DockerEngineRuby::Models::ImageBuildParams

  ImageBuildPruneParams = DockerEngineRuby::Models::ImageBuildPruneParams

  ImageCommitParams = DockerEngineRuby::Models::ImageCommitParams

  ImageDeleteParams = DockerEngineRuby::Models::ImageDeleteParams

  ImageGetAllParams = DockerEngineRuby::Models::ImageGetAllParams

  ImageGetParams = DockerEngineRuby::Models::ImageGetParams

  ImageHistoryParams = DockerEngineRuby::Models::ImageHistoryParams

  ImageInspectParams = DockerEngineRuby::Models::ImageInspectParams

  ImageListParams = DockerEngineRuby::Models::ImageListParams

  ImageLoadParams = DockerEngineRuby::Models::ImageLoadParams

  ImagePruneParams = DockerEngineRuby::Models::ImagePruneParams

  ImagePullParams = DockerEngineRuby::Models::ImagePullParams

  ImagePushParams = DockerEngineRuby::Models::ImagePushParams

  ImageSearchParams = DockerEngineRuby::Models::ImageSearchParams

  ImageTagParams = DockerEngineRuby::Models::ImageTagParams

  Info = DockerEngineRuby::Models::Info

  Inspect = DockerEngineRuby::Models::Inspect

  InspectResponse = DockerEngineRuby::Models::InspectResponse

  ListResponse = DockerEngineRuby::Models::ListResponse

  Network = DockerEngineRuby::Models::Network

  NetworkConnectParams = DockerEngineRuby::Models::NetworkConnectParams

  NetworkCreateParams = DockerEngineRuby::Models::NetworkCreateParams

  NetworkDeleteParams = DockerEngineRuby::Models::NetworkDeleteParams

  NetworkDisconnectParams = DockerEngineRuby::Models::NetworkDisconnectParams

  NetworkInspectParams = DockerEngineRuby::Models::NetworkInspectParams

  NetworkListParams = DockerEngineRuby::Models::NetworkListParams

  NetworkPruneParams = DockerEngineRuby::Models::NetworkPruneParams

  Node = DockerEngineRuby::Models::Node

  NodeDeleteParams = DockerEngineRuby::Models::NodeDeleteParams

  NodeInspectParams = DockerEngineRuby::Models::NodeInspectParams

  NodeListParams = DockerEngineRuby::Models::NodeListParams

  NodeUpdateParams = DockerEngineRuby::Models::NodeUpdateParams

  Plugin = DockerEngineRuby::Models::Plugin

  PluginCreateParams = DockerEngineRuby::Models::PluginCreateParams

  PluginDeleteParams = DockerEngineRuby::Models::PluginDeleteParams

  PluginDisableParams = DockerEngineRuby::Models::PluginDisableParams

  PluginEnableParams = DockerEngineRuby::Models::PluginEnableParams

  PluginInspectParams = DockerEngineRuby::Models::PluginInspectParams

  PluginListParams = DockerEngineRuby::Models::PluginListParams

  PluginPrivilegesParams = DockerEngineRuby::Models::PluginPrivilegesParams

  PluginPullParams = DockerEngineRuby::Models::PluginPullParams

  PluginPushParams = DockerEngineRuby::Models::PluginPushParams

  PluginSetParams = DockerEngineRuby::Models::PluginSetParams

  PluginUpgradeParams = DockerEngineRuby::Models::PluginUpgradeParams

  Privilege = DockerEngineRuby::Models::Privilege

  Secret = DockerEngineRuby::Models::Secret

  SecretCreateParams = DockerEngineRuby::Models::SecretCreateParams

  SecretDeleteParams = DockerEngineRuby::Models::SecretDeleteParams

  SecretInspectParams = DockerEngineRuby::Models::SecretInspectParams

  SecretListParams = DockerEngineRuby::Models::SecretListParams

  SecretUpdateParams = DockerEngineRuby::Models::SecretUpdateParams

  Service = DockerEngineRuby::Models::Service

  ServiceCreateParams = DockerEngineRuby::Models::ServiceCreateParams

  ServiceDeleteParams = DockerEngineRuby::Models::ServiceDeleteParams

  ServiceInspectParams = DockerEngineRuby::Models::ServiceInspectParams

  ServiceListParams = DockerEngineRuby::Models::ServiceListParams

  ServiceLogsParams = DockerEngineRuby::Models::ServiceLogsParams

  ServiceUpdateParams = DockerEngineRuby::Models::ServiceUpdateParams

  Spec = DockerEngineRuby::Models::Spec

  StatsResponse = DockerEngineRuby::Models::StatsResponse

  Summary = DockerEngineRuby::Models::Summary

  SwarmAPI = DockerEngineRuby::Models::SwarmAPI

  SwarmInitParams = DockerEngineRuby::Models::SwarmInitParams

  SwarmInspectParams = DockerEngineRuby::Models::SwarmInspectParams

  SwarmJoinParams = DockerEngineRuby::Models::SwarmJoinParams

  SwarmLeaveParams = DockerEngineRuby::Models::SwarmLeaveParams

  SwarmUnlockKeyParams = DockerEngineRuby::Models::SwarmUnlockKeyParams

  SwarmUnlockParams = DockerEngineRuby::Models::SwarmUnlockParams

  SwarmUpdateParams = DockerEngineRuby::Models::SwarmUpdateParams

  SystemDataUsageParams = DockerEngineRuby::Models::SystemDataUsageParams

  SystemEventsParams = DockerEngineRuby::Models::SystemEventsParams

  SystemInfoParams = DockerEngineRuby::Models::SystemInfoParams

  SystemPingParams = DockerEngineRuby::Models::SystemPingParams

  SystemVersionParams = DockerEngineRuby::Models::SystemVersionParams

  Task = DockerEngineRuby::Models::Task

  TaskInspectParams = DockerEngineRuby::Models::TaskInspectParams

  TaskListParams = DockerEngineRuby::Models::TaskListParams

  TaskLogsParams = DockerEngineRuby::Models::TaskLogsParams

  TopResponse = DockerEngineRuby::Models::TopResponse

  UpdateResponse = DockerEngineRuby::Models::UpdateResponse

  Version = DockerEngineRuby::Models::Version

  Volume = DockerEngineRuby::Models::Volume

  VolumeCreateParams = DockerEngineRuby::Models::VolumeCreateParams

  VolumeDeleteParams = DockerEngineRuby::Models::VolumeDeleteParams

  VolumeInspectParams = DockerEngineRuby::Models::VolumeInspectParams

  VolumeListParams = DockerEngineRuby::Models::VolumeListParams

  VolumePruneParams = DockerEngineRuby::Models::VolumePruneParams

  VolumeUpdateParams = DockerEngineRuby::Models::VolumeUpdateParams

  WaitResponse = DockerEngineRuby::Models::WaitResponse
end
