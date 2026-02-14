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

  ConfigCreateParams = DockerEngine::Models::ConfigCreateParams

  ConfigDeleteParams = DockerEngine::Models::ConfigDeleteParams

  ConfigInspectParams = DockerEngine::Models::ConfigInspectParams

  ConfigListParams = DockerEngine::Models::ConfigListParams

  ConfigUpdateParams = DockerEngine::Models::ConfigUpdateParams

  ConnectRequest = DockerEngine::Models::ConnectRequest

  Container = DockerEngine::Models::Container

  ContainerArchiveParams = DockerEngine::Models::ContainerArchiveParams

  ContainerAttachParams = DockerEngine::Models::ContainerAttachParams

  ContainerChangesParams = DockerEngine::Models::ContainerChangesParams

  ContainerCreateParams = DockerEngine::Models::ContainerCreateParams

  ContainerDeleteParams = DockerEngine::Models::ContainerDeleteParams

  ContainerExecParams = DockerEngine::Models::ContainerExecParams

  ContainerExportParams = DockerEngine::Models::ContainerExportParams

  ContainerInspectParams = DockerEngine::Models::ContainerInspectParams

  ContainerKillParams = DockerEngine::Models::ContainerKillParams

  ContainerListParams = DockerEngine::Models::ContainerListParams

  ContainerLogsParams = DockerEngine::Models::ContainerLogsParams

  ContainerPauseParams = DockerEngine::Models::ContainerPauseParams

  ContainerPruneParams = DockerEngine::Models::ContainerPruneParams

  ContainerRenameParams = DockerEngine::Models::ContainerRenameParams

  ContainerResizeParams = DockerEngine::Models::ContainerResizeParams

  ContainerRestartParams = DockerEngine::Models::ContainerRestartParams

  ContainerStartParams = DockerEngine::Models::ContainerStartParams

  ContainerStatsParams = DockerEngine::Models::ContainerStatsParams

  ContainerStopParams = DockerEngine::Models::ContainerStopParams

  ContainerTopParams = DockerEngine::Models::ContainerTopParams

  ContainerUnpauseParams = DockerEngine::Models::ContainerUnpauseParams

  ContainerUpdateParams = DockerEngine::Models::ContainerUpdateParams

  ContainerWaitParams = DockerEngine::Models::ContainerWaitParams

  CreateRequest = DockerEngine::Models::CreateRequest

  CreateResponse = DockerEngine::Models::CreateResponse

  DeleteItem = DockerEngine::Models::DeleteItem

  DisconnectRequest = DockerEngine::Models::DisconnectRequest

  DistributionInspectParams = DockerEngine::Models::DistributionInspectParams

  Error = DockerEngine::Models::Error

  ExecInspectParams = DockerEngine::Models::ExecInspectParams

  ExecResizeParams = DockerEngine::Models::ExecResizeParams

  ExecStartParams = DockerEngine::Models::ExecStartParams

  FilesystemChange = DockerEngine::Models::FilesystemChange

  HistoryItem = DockerEngine::Models::HistoryItem

  Image = DockerEngine::Models::Image

  ImageBuildParams = DockerEngine::Models::ImageBuildParams

  ImageBuildPruneParams = DockerEngine::Models::ImageBuildPruneParams

  ImageCommitParams = DockerEngine::Models::ImageCommitParams

  ImageDeleteParams = DockerEngine::Models::ImageDeleteParams

  ImageGetAllParams = DockerEngine::Models::ImageGetAllParams

  ImageGetParams = DockerEngine::Models::ImageGetParams

  ImageHistoryParams = DockerEngine::Models::ImageHistoryParams

  ImageInspectParams = DockerEngine::Models::ImageInspectParams

  ImageListParams = DockerEngine::Models::ImageListParams

  ImageLoadParams = DockerEngine::Models::ImageLoadParams

  ImagePruneParams = DockerEngine::Models::ImagePruneParams

  ImagePullParams = DockerEngine::Models::ImagePullParams

  ImagePushParams = DockerEngine::Models::ImagePushParams

  ImageSearchParams = DockerEngine::Models::ImageSearchParams

  ImageTagParams = DockerEngine::Models::ImageTagParams

  Info = DockerEngine::Models::Info

  Inspect = DockerEngine::Models::Inspect

  InspectResponse = DockerEngine::Models::InspectResponse

  ListResponse = DockerEngine::Models::ListResponse

  Network = DockerEngine::Models::Network

  NetworkConnectParams = DockerEngine::Models::NetworkConnectParams

  NetworkCreateParams = DockerEngine::Models::NetworkCreateParams

  NetworkDeleteParams = DockerEngine::Models::NetworkDeleteParams

  NetworkDisconnectParams = DockerEngine::Models::NetworkDisconnectParams

  NetworkInspectParams = DockerEngine::Models::NetworkInspectParams

  NetworkListParams = DockerEngine::Models::NetworkListParams

  NetworkPruneParams = DockerEngine::Models::NetworkPruneParams

  Node = DockerEngine::Models::Node

  NodeDeleteParams = DockerEngine::Models::NodeDeleteParams

  NodeInspectParams = DockerEngine::Models::NodeInspectParams

  NodeListParams = DockerEngine::Models::NodeListParams

  NodeUpdateParams = DockerEngine::Models::NodeUpdateParams

  Plugin = DockerEngine::Models::Plugin

  PluginCreateParams = DockerEngine::Models::PluginCreateParams

  PluginDeleteParams = DockerEngine::Models::PluginDeleteParams

  PluginDisableParams = DockerEngine::Models::PluginDisableParams

  PluginEnableParams = DockerEngine::Models::PluginEnableParams

  PluginInspectParams = DockerEngine::Models::PluginInspectParams

  PluginListParams = DockerEngine::Models::PluginListParams

  PluginPrivilegesParams = DockerEngine::Models::PluginPrivilegesParams

  PluginPullParams = DockerEngine::Models::PluginPullParams

  PluginPushParams = DockerEngine::Models::PluginPushParams

  PluginSetParams = DockerEngine::Models::PluginSetParams

  PluginUpgradeParams = DockerEngine::Models::PluginUpgradeParams

  Privilege = DockerEngine::Models::Privilege

  Secret = DockerEngine::Models::Secret

  SecretCreateParams = DockerEngine::Models::SecretCreateParams

  SecretDeleteParams = DockerEngine::Models::SecretDeleteParams

  SecretInspectParams = DockerEngine::Models::SecretInspectParams

  SecretListParams = DockerEngine::Models::SecretListParams

  SecretUpdateParams = DockerEngine::Models::SecretUpdateParams

  Service = DockerEngine::Models::Service

  ServiceCreateParams = DockerEngine::Models::ServiceCreateParams

  ServiceDeleteParams = DockerEngine::Models::ServiceDeleteParams

  ServiceInspectParams = DockerEngine::Models::ServiceInspectParams

  ServiceListParams = DockerEngine::Models::ServiceListParams

  ServiceLogsParams = DockerEngine::Models::ServiceLogsParams

  ServiceUpdateParams = DockerEngine::Models::ServiceUpdateParams

  Spec = DockerEngine::Models::Spec

  StatsResponse = DockerEngine::Models::StatsResponse

  Summary = DockerEngine::Models::Summary

  SwarmAPI = DockerEngine::Models::SwarmAPI

  SwarmInitParams = DockerEngine::Models::SwarmInitParams

  SwarmInspectParams = DockerEngine::Models::SwarmInspectParams

  SwarmJoinParams = DockerEngine::Models::SwarmJoinParams

  SwarmLeaveParams = DockerEngine::Models::SwarmLeaveParams

  SwarmUnlockKeyParams = DockerEngine::Models::SwarmUnlockKeyParams

  SwarmUnlockParams = DockerEngine::Models::SwarmUnlockParams

  SwarmUpdateParams = DockerEngine::Models::SwarmUpdateParams

  SystemDataUsageParams = DockerEngine::Models::SystemDataUsageParams

  SystemEventsParams = DockerEngine::Models::SystemEventsParams

  SystemInfoParams = DockerEngine::Models::SystemInfoParams

  SystemPingParams = DockerEngine::Models::SystemPingParams

  SystemVersionParams = DockerEngine::Models::SystemVersionParams

  Task = DockerEngine::Models::Task

  TaskInspectParams = DockerEngine::Models::TaskInspectParams

  TaskListParams = DockerEngine::Models::TaskListParams

  TaskLogsParams = DockerEngine::Models::TaskLogsParams

  TopResponse = DockerEngine::Models::TopResponse

  UpdateResponse = DockerEngine::Models::UpdateResponse

  Version = DockerEngine::Models::Version

  Volume = DockerEngine::Models::Volume

  VolumeCreateParams = DockerEngine::Models::VolumeCreateParams

  VolumeDeleteParams = DockerEngine::Models::VolumeDeleteParams

  VolumeInspectParams = DockerEngine::Models::VolumeInspectParams

  VolumeListParams = DockerEngine::Models::VolumeListParams

  VolumePruneParams = DockerEngine::Models::VolumePruneParams

  VolumeUpdateParams = DockerEngine::Models::VolumeUpdateParams

  WaitResponse = DockerEngine::Models::WaitResponse
end
