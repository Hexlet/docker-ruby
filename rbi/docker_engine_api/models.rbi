# typed: strong

module DockerEngineAPI
  AuthLoginParams = DockerEngineAPI::Models::AuthLoginParams

  AuthResponse = DockerEngineAPI::Models::AuthResponse

  Config = DockerEngineAPI::Models::Config

  ConfigCreateParams = DockerEngineAPI::Models::ConfigCreateParams

  ConfigDeleteParams = DockerEngineAPI::Models::ConfigDeleteParams

  ConfigInspectParams = DockerEngineAPI::Models::ConfigInspectParams

  ConfigListParams = DockerEngineAPI::Models::ConfigListParams

  ConfigUpdateParams = DockerEngineAPI::Models::ConfigUpdateParams

  ConnectRequest = DockerEngineAPI::Models::ConnectRequest

  Container = DockerEngineAPI::Models::Container

  ContainerArchiveParams = DockerEngineAPI::Models::ContainerArchiveParams

  ContainerAttachParams = DockerEngineAPI::Models::ContainerAttachParams

  ContainerChangesParams = DockerEngineAPI::Models::ContainerChangesParams

  ContainerCreateParams = DockerEngineAPI::Models::ContainerCreateParams

  ContainerDeleteParams = DockerEngineAPI::Models::ContainerDeleteParams

  ContainerExecParams = DockerEngineAPI::Models::ContainerExecParams

  ContainerExportParams = DockerEngineAPI::Models::ContainerExportParams

  ContainerInspectParams = DockerEngineAPI::Models::ContainerInspectParams

  ContainerKillParams = DockerEngineAPI::Models::ContainerKillParams

  ContainerListParams = DockerEngineAPI::Models::ContainerListParams

  ContainerLogsParams = DockerEngineAPI::Models::ContainerLogsParams

  ContainerPauseParams = DockerEngineAPI::Models::ContainerPauseParams

  ContainerPruneParams = DockerEngineAPI::Models::ContainerPruneParams

  ContainerRenameParams = DockerEngineAPI::Models::ContainerRenameParams

  ContainerResizeParams = DockerEngineAPI::Models::ContainerResizeParams

  ContainerRestartParams = DockerEngineAPI::Models::ContainerRestartParams

  ContainerStartParams = DockerEngineAPI::Models::ContainerStartParams

  ContainerStatsParams = DockerEngineAPI::Models::ContainerStatsParams

  ContainerStopParams = DockerEngineAPI::Models::ContainerStopParams

  ContainerTopParams = DockerEngineAPI::Models::ContainerTopParams

  ContainerUnpauseParams = DockerEngineAPI::Models::ContainerUnpauseParams

  ContainerUpdateParams = DockerEngineAPI::Models::ContainerUpdateParams

  ContainerWaitParams = DockerEngineAPI::Models::ContainerWaitParams

  CreateRequest = DockerEngineAPI::Models::CreateRequest

  CreateResponse = DockerEngineAPI::Models::CreateResponse

  DeleteItem = DockerEngineAPI::Models::DeleteItem

  DisconnectRequest = DockerEngineAPI::Models::DisconnectRequest

  DistributionInspectParams = DockerEngineAPI::Models::DistributionInspectParams

  Error = DockerEngineAPI::Models::Error

  ExecInspectParams = DockerEngineAPI::Models::ExecInspectParams

  ExecResizeParams = DockerEngineAPI::Models::ExecResizeParams

  ExecStartParams = DockerEngineAPI::Models::ExecStartParams

  FilesystemChange = DockerEngineAPI::Models::FilesystemChange

  HistoryItem = DockerEngineAPI::Models::HistoryItem

  Image = DockerEngineAPI::Models::Image

  ImageBuildParams = DockerEngineAPI::Models::ImageBuildParams

  ImageBuildPruneParams = DockerEngineAPI::Models::ImageBuildPruneParams

  ImageCommitParams = DockerEngineAPI::Models::ImageCommitParams

  ImageDeleteParams = DockerEngineAPI::Models::ImageDeleteParams

  ImageGetAllParams = DockerEngineAPI::Models::ImageGetAllParams

  ImageGetParams = DockerEngineAPI::Models::ImageGetParams

  ImageHistoryParams = DockerEngineAPI::Models::ImageHistoryParams

  ImageInspectParams = DockerEngineAPI::Models::ImageInspectParams

  ImageListParams = DockerEngineAPI::Models::ImageListParams

  ImageLoadParams = DockerEngineAPI::Models::ImageLoadParams

  ImagePruneParams = DockerEngineAPI::Models::ImagePruneParams

  ImagePullParams = DockerEngineAPI::Models::ImagePullParams

  ImagePushParams = DockerEngineAPI::Models::ImagePushParams

  ImageSearchParams = DockerEngineAPI::Models::ImageSearchParams

  ImageTagParams = DockerEngineAPI::Models::ImageTagParams

  Info = DockerEngineAPI::Models::Info

  Inspect = DockerEngineAPI::Models::Inspect

  InspectResponse = DockerEngineAPI::Models::InspectResponse

  ListResponse = DockerEngineAPI::Models::ListResponse

  Network = DockerEngineAPI::Models::Network

  NetworkConnectParams = DockerEngineAPI::Models::NetworkConnectParams

  NetworkCreateParams = DockerEngineAPI::Models::NetworkCreateParams

  NetworkDeleteParams = DockerEngineAPI::Models::NetworkDeleteParams

  NetworkDisconnectParams = DockerEngineAPI::Models::NetworkDisconnectParams

  NetworkInspectParams = DockerEngineAPI::Models::NetworkInspectParams

  NetworkListParams = DockerEngineAPI::Models::NetworkListParams

  NetworkPruneParams = DockerEngineAPI::Models::NetworkPruneParams

  Node = DockerEngineAPI::Models::Node

  NodeDeleteParams = DockerEngineAPI::Models::NodeDeleteParams

  NodeInspectParams = DockerEngineAPI::Models::NodeInspectParams

  NodeListParams = DockerEngineAPI::Models::NodeListParams

  NodeUpdateParams = DockerEngineAPI::Models::NodeUpdateParams

  Plugin = DockerEngineAPI::Models::Plugin

  PluginCreateParams = DockerEngineAPI::Models::PluginCreateParams

  PluginDeleteParams = DockerEngineAPI::Models::PluginDeleteParams

  PluginDisableParams = DockerEngineAPI::Models::PluginDisableParams

  PluginEnableParams = DockerEngineAPI::Models::PluginEnableParams

  PluginInspectParams = DockerEngineAPI::Models::PluginInspectParams

  PluginListParams = DockerEngineAPI::Models::PluginListParams

  PluginPrivilegesParams = DockerEngineAPI::Models::PluginPrivilegesParams

  PluginPullParams = DockerEngineAPI::Models::PluginPullParams

  PluginPushParams = DockerEngineAPI::Models::PluginPushParams

  PluginSetParams = DockerEngineAPI::Models::PluginSetParams

  PluginUpgradeParams = DockerEngineAPI::Models::PluginUpgradeParams

  Privilege = DockerEngineAPI::Models::Privilege

  Secret = DockerEngineAPI::Models::Secret

  SecretCreateParams = DockerEngineAPI::Models::SecretCreateParams

  SecretDeleteParams = DockerEngineAPI::Models::SecretDeleteParams

  SecretInspectParams = DockerEngineAPI::Models::SecretInspectParams

  SecretListParams = DockerEngineAPI::Models::SecretListParams

  SecretUpdateParams = DockerEngineAPI::Models::SecretUpdateParams

  Service = DockerEngineAPI::Models::Service

  ServiceCreateParams = DockerEngineAPI::Models::ServiceCreateParams

  ServiceDeleteParams = DockerEngineAPI::Models::ServiceDeleteParams

  ServiceInspectParams = DockerEngineAPI::Models::ServiceInspectParams

  ServiceListParams = DockerEngineAPI::Models::ServiceListParams

  ServiceLogsParams = DockerEngineAPI::Models::ServiceLogsParams

  ServiceUpdateParams = DockerEngineAPI::Models::ServiceUpdateParams

  Spec = DockerEngineAPI::Models::Spec

  StatsResponse = DockerEngineAPI::Models::StatsResponse

  Summary = DockerEngineAPI::Models::Summary

  SwarmAPI = DockerEngineAPI::Models::SwarmAPI

  SwarmInitParams = DockerEngineAPI::Models::SwarmInitParams

  SwarmInspectParams = DockerEngineAPI::Models::SwarmInspectParams

  SwarmJoinParams = DockerEngineAPI::Models::SwarmJoinParams

  SwarmLeaveParams = DockerEngineAPI::Models::SwarmLeaveParams

  SwarmUnlockKeyParams = DockerEngineAPI::Models::SwarmUnlockKeyParams

  SwarmUnlockParams = DockerEngineAPI::Models::SwarmUnlockParams

  SwarmUpdateParams = DockerEngineAPI::Models::SwarmUpdateParams

  SystemDataUsageParams = DockerEngineAPI::Models::SystemDataUsageParams

  SystemEventsParams = DockerEngineAPI::Models::SystemEventsParams

  SystemInfoParams = DockerEngineAPI::Models::SystemInfoParams

  SystemPingParams = DockerEngineAPI::Models::SystemPingParams

  SystemVersionParams = DockerEngineAPI::Models::SystemVersionParams

  Task = DockerEngineAPI::Models::Task

  TaskInspectParams = DockerEngineAPI::Models::TaskInspectParams

  TaskListParams = DockerEngineAPI::Models::TaskListParams

  TaskLogsParams = DockerEngineAPI::Models::TaskLogsParams

  TopResponse = DockerEngineAPI::Models::TopResponse

  UpdateResponse = DockerEngineAPI::Models::UpdateResponse

  Version = DockerEngineAPI::Models::Version

  Volume = DockerEngineAPI::Models::Volume

  VolumeCreateParams = DockerEngineAPI::Models::VolumeCreateParams

  VolumeDeleteParams = DockerEngineAPI::Models::VolumeDeleteParams

  VolumeInspectParams = DockerEngineAPI::Models::VolumeInspectParams

  VolumeListParams = DockerEngineAPI::Models::VolumeListParams

  VolumePruneParams = DockerEngineAPI::Models::VolumePruneParams

  VolumeUpdateParams = DockerEngineAPI::Models::VolumeUpdateParams

  WaitResponse = DockerEngineAPI::Models::WaitResponse
end
