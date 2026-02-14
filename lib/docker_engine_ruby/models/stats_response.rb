# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#stats
    class StatsResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the container for which the stats were collected.
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute blkio_stats
      #   BlkioStats stores all IO service stats for data read and write.
      #
      #   This type is Linux-specific and holds many fields that are specific to cgroups
      #   v1. On a cgroup v2 host, all fields other than `io_service_bytes_recursive` are
      #   omitted or `null`.
      #
      #   This type is only populated on Linux and omitted for Windows containers.
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::BlkioStats, nil]
      optional :blkio_stats, -> { DockerEngineRuby::StatsResponse::BlkioStats }, nil?: true

      # @!attribute cpu_stats
      #   CPU related info of the container
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::CPUStats, nil]
      optional :cpu_stats, -> { DockerEngineRuby::StatsResponse::CPUStats }, nil?: true

      # @!attribute memory_stats
      #   Aggregates all memory stats since container inception on Linux. Windows returns
      #   stats for commit and private working set only.
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::MemoryStats, nil]
      optional :memory_stats, -> { DockerEngineRuby::StatsResponse::MemoryStats }

      # @!attribute name
      #   Name of the container for which the stats were collected.
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute networks
      #   Network statistics for the container per interface.
      #
      #   This field is omitted if the container has no networking enabled.
      #
      #   @return [Object, nil]
      optional :networks, DockerEngineRuby::Internal::Type::Unknown, nil?: true

      # @!attribute num_procs
      #   The number of processors on the system.
      #
      #   This field is Windows-specific and always zero for Linux containers.
      #
      #   @return [Integer, nil]
      optional :num_procs, Integer

      # @!attribute os_type
      #   OSType is the OS of the container ("linux" or "windows") to allow
      #   platform-specific handling of stats.
      #
      #   @return [String, nil]
      optional :os_type, String, nil?: true

      # @!attribute pids_stats
      #   PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
      #
      #   This type is Linux-specific and omitted for Windows containers.
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::PidsStats, nil]
      optional :pids_stats, -> { DockerEngineRuby::StatsResponse::PidsStats }, nil?: true

      # @!attribute precpu_stats
      #   CPU related info of the container
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::PrecpuStats, nil]
      optional :precpu_stats, -> { DockerEngineRuby::StatsResponse::PrecpuStats }, nil?: true

      # @!attribute preread
      #   Date and time at which this first sample was collected. This field is not
      #   propagated if the "one-shot" option is set. If the "one-shot" option is set,
      #   this field may be omitted, empty, or set to a default date
      #   (`0001-01-01T00:00:00Z`).
      #
      #   The value is formatted as [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with
      #   nano-seconds.
      #
      #   @return [Time, nil]
      optional :preread, Time

      # @!attribute read
      #   Date and time at which this sample was collected. The value is formatted as
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with nano-seconds.
      #
      #   @return [Time, nil]
      optional :read, Time

      # @!attribute storage_stats
      #   StorageStats is the disk I/O stats for read/write on Windows.
      #
      #   This type is Windows-specific and omitted for Linux containers.
      #
      #   @return [DockerEngineRuby::Models::StatsResponse::StorageStats, nil]
      optional :storage_stats, -> { DockerEngineRuby::StatsResponse::StorageStats }, nil?: true

      # @!method initialize(id: nil, blkio_stats: nil, cpu_stats: nil, memory_stats: nil, name: nil, networks: nil, num_procs: nil, os_type: nil, pids_stats: nil, precpu_stats: nil, preread: nil, read: nil, storage_stats: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::StatsResponse} for more details.
      #
      #   Statistics sample for a container.
      #
      #   @param id [String, nil] ID of the container for which the stats were collected.
      #
      #   @param blkio_stats [DockerEngineRuby::Models::StatsResponse::BlkioStats, nil] BlkioStats stores all IO service stats for data read and write.
      #
      #   @param cpu_stats [DockerEngineRuby::Models::StatsResponse::CPUStats, nil] CPU related info of the container
      #
      #   @param memory_stats [DockerEngineRuby::Models::StatsResponse::MemoryStats] Aggregates all memory stats since container inception on Linux.
      #
      #   @param name [String, nil] Name of the container for which the stats were collected.
      #
      #   @param networks [Object, nil] Network statistics for the container per interface.
      #
      #   @param num_procs [Integer] The number of processors on the system.
      #
      #   @param os_type [String, nil] OSType is the OS of the container ("linux" or "windows") to allow
      #
      #   @param pids_stats [DockerEngineRuby::Models::StatsResponse::PidsStats, nil] PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
      #
      #   @param precpu_stats [DockerEngineRuby::Models::StatsResponse::PrecpuStats, nil] CPU related info of the container
      #
      #   @param preread [Time] Date and time at which this first sample was collected. This field
      #
      #   @param read [Time] Date and time at which this sample was collected.
      #
      #   @param storage_stats [DockerEngineRuby::Models::StatsResponse::StorageStats, nil] StorageStats is the disk I/O stats for read/write on Windows.

      # @see DockerEngineRuby::Models::StatsResponse#blkio_stats
      class BlkioStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute io_merged_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoMergedRecursive, nil>, nil]
        optional :io_merged_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoMergedRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute io_queue_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoQueueRecursive, nil>, nil]
        optional :io_queue_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoQueueRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute io_service_bytes_recursive
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServiceBytesRecursive, nil>, nil]
        optional :io_service_bytes_recursive,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoServiceBytesRecursive, nil?: true] }

        # @!attribute io_service_time_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServiceTimeRecursive, nil>, nil]
        optional :io_service_time_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoServiceTimeRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute io_serviced_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServicedRecursive, nil>, nil]
        optional :io_serviced_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoServicedRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute io_time_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoTimeRecursive, nil>, nil]
        optional :io_time_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoTimeRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute io_wait_time_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoWaitTimeRecursive, nil>, nil]
        optional :io_wait_time_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::IoWaitTimeRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!attribute sectors_recursive
        #   This field is only available when using Linux containers with cgroups v1. It is
        #   omitted or `null` when using cgroups v2.
        #
        #   @return [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::SectorsRecursive, nil>, nil]
        optional :sectors_recursive,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::StatsResponse::BlkioStats::SectorsRecursive,
                                                             nil?: true]
                 },
                 nil?: true

        # @!method initialize(io_merged_recursive: nil, io_queue_recursive: nil, io_service_bytes_recursive: nil, io_service_time_recursive: nil, io_serviced_recursive: nil, io_time_recursive: nil, io_wait_time_recursive: nil, sectors_recursive: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::StatsResponse::BlkioStats} for more details.
        #
        #   BlkioStats stores all IO service stats for data read and write.
        #
        #   This type is Linux-specific and holds many fields that are specific to cgroups
        #   v1. On a cgroup v2 host, all fields other than `io_service_bytes_recursive` are
        #   omitted or `null`.
        #
        #   This type is only populated on Linux and omitted for Windows containers.
        #
        #   @param io_merged_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoMergedRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param io_queue_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoQueueRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param io_service_bytes_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServiceBytesRecursive, nil>]
        #
        #   @param io_service_time_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServiceTimeRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param io_serviced_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoServicedRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param io_time_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoTimeRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param io_wait_time_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::IoWaitTimeRecursive, nil>, nil] This field is only available when using Linux containers with
        #
        #   @param sectors_recursive [Array<DockerEngineRuby::Models::StatsResponse::BlkioStats::SectorsRecursive, nil>, nil] This field is only available when using Linux containers with

        class IoMergedRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoQueueRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoServiceBytesRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoServiceTimeRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoServicedRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoTimeRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class IoWaitTimeRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end

        class SectorsRecursive < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute major
          #
          #   @return [Integer, nil]
          optional :major, Integer

          # @!attribute minor
          #
          #   @return [Integer, nil]
          optional :minor, Integer

          # @!attribute op
          #
          #   @return [String, nil]
          optional :op, String

          # @!attribute value
          #
          #   @return [Integer, nil]
          optional :value, Integer

          # @!method initialize(major: nil, minor: nil, op: nil, value: nil)
          #   Blkio stats entry.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param major [Integer]
          #   @param minor [Integer]
          #   @param op [String]
          #   @param value [Integer]
        end
      end

      # @see DockerEngineRuby::Models::StatsResponse#cpu_stats
      class CPUStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute cpu_usage
        #   All CPU stats aggregated since container inception.
        #
        #   @return [DockerEngineRuby::Models::StatsResponse::CPUStats::CPUUsage, nil]
        optional :cpu_usage, -> { DockerEngineRuby::StatsResponse::CPUStats::CPUUsage }, nil?: true

        # @!attribute online_cpus
        #   Number of online CPUs.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :online_cpus, Integer, nil?: true

        # @!attribute system_cpu_usage
        #   System Usage.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :system_cpu_usage, Integer, nil?: true

        # @!attribute throttling_data
        #   CPU throttling stats of the container.
        #
        #   This type is Linux-specific and omitted for Windows containers.
        #
        #   @return [DockerEngineRuby::Models::StatsResponse::CPUStats::ThrottlingData, nil]
        optional :throttling_data,
                 -> {
                   DockerEngineRuby::StatsResponse::CPUStats::ThrottlingData
                 },
                 nil?: true

        # @!method initialize(cpu_usage: nil, online_cpus: nil, system_cpu_usage: nil, throttling_data: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::StatsResponse::CPUStats} for more details.
        #
        #   CPU related info of the container
        #
        #   @param cpu_usage [DockerEngineRuby::Models::StatsResponse::CPUStats::CPUUsage, nil] All CPU stats aggregated since container inception.
        #
        #   @param online_cpus [Integer, nil] Number of online CPUs.
        #
        #   @param system_cpu_usage [Integer, nil] System Usage.
        #
        #   @param throttling_data [DockerEngineRuby::Models::StatsResponse::CPUStats::ThrottlingData, nil] CPU throttling stats of the container.

        # @see DockerEngineRuby::Models::StatsResponse::CPUStats#cpu_usage
        class CPUUsage < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute percpu_usage
          #   Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          #   This field is Linux-specific when using cgroups v1. It is omitted when using
          #   cgroups v2 and Windows containers.
          #
          #   @return [Array<Integer>, nil]
          optional :percpu_usage, DockerEngineRuby::Internal::Type::ArrayOf[Integer], nil?: true

          # @!attribute total_usage
          #   Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
          #   (Windows).
          #
          #   @return [Integer, nil]
          optional :total_usage, Integer

          # @!attribute usage_in_kernelmode
          #   Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
          #   time spent (in 100's of nanoseconds) by all container processes in kernel mode
          #   (Windows).
          #
          #   Not populated for Windows containers using Hyper-V isolation.
          #
          #   @return [Integer, nil]
          optional :usage_in_kernelmode, Integer

          # @!attribute usage_in_usermode
          #   Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
          #   spent (in 100's of nanoseconds) by all container processes in kernel mode
          #   (Windows).
          #
          #   Not populated for Windows containers using Hyper-V isolation.
          #
          #   @return [Integer, nil]
          optional :usage_in_usermode, Integer

          # @!method initialize(percpu_usage: nil, total_usage: nil, usage_in_kernelmode: nil, usage_in_usermode: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::StatsResponse::CPUStats::CPUUsage} for more details.
          #
          #   All CPU stats aggregated since container inception.
          #
          #   @param percpu_usage [Array<Integer>, nil] Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          #   @param total_usage [Integer] Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds (Windows)
          #
          #   @param usage_in_kernelmode [Integer] Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux),
          #
          #   @param usage_in_usermode [Integer] Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux),
        end

        # @see DockerEngineRuby::Models::StatsResponse::CPUStats#throttling_data
        class ThrottlingData < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute periods
          #   Number of periods with throttling active.
          #
          #   @return [Integer, nil]
          optional :periods, Integer

          # @!attribute throttled_periods
          #   Number of periods when the container hit its throttling limit.
          #
          #   @return [Integer, nil]
          optional :throttled_periods, Integer

          # @!attribute throttled_time
          #   Aggregated time (in nanoseconds) the container was throttled for.
          #
          #   @return [Integer, nil]
          optional :throttled_time, Integer

          # @!method initialize(periods: nil, throttled_periods: nil, throttled_time: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::StatsResponse::CPUStats::ThrottlingData} for more
          #   details.
          #
          #   CPU throttling stats of the container.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param periods [Integer] Number of periods with throttling active.
          #
          #   @param throttled_periods [Integer] Number of periods when the container hit its throttling limit.
          #
          #   @param throttled_time [Integer] Aggregated time (in nanoseconds) the container was throttled for.
        end
      end

      # @see DockerEngineRuby::Models::StatsResponse#memory_stats
      class MemoryStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute commitbytes
        #   Committed bytes.
        #
        #   This field is Windows-specific and omitted for Linux containers.
        #
        #   @return [Integer, nil]
        optional :commitbytes, Integer, nil?: true

        # @!attribute commitpeakbytes
        #   Peak committed bytes.
        #
        #   This field is Windows-specific and omitted for Linux containers.
        #
        #   @return [Integer, nil]
        optional :commitpeakbytes, Integer, nil?: true

        # @!attribute failcnt
        #   Number of times memory usage hits limits.
        #
        #   This field is Linux-specific and only supported on cgroups v1. It is omitted
        #   when using cgroups v2 and for Windows containers.
        #
        #   @return [Integer, nil]
        optional :failcnt, Integer, nil?: true

        # @!attribute limit
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :limit, Integer, nil?: true

        # @!attribute max_usage
        #   Maximum usage ever recorded.
        #
        #   This field is Linux-specific and only supported on cgroups v1. It is omitted
        #   when using cgroups v2 and for Windows containers.
        #
        #   @return [Integer, nil]
        optional :max_usage, Integer, nil?: true

        # @!attribute privateworkingset
        #   Private working set.
        #
        #   This field is Windows-specific and omitted for Linux containers.
        #
        #   @return [Integer, nil]
        optional :privateworkingset, Integer, nil?: true

        # @!attribute stats
        #   All the stats exported via memory.stat.
        #
        #   The fields in this object differ between cgroups v1 and v2. On cgroups v1,
        #   fields such as `cache`, `rss`, `mapped_file` are available. On cgroups v2,
        #   fields such as `file`, `anon`, `inactive_file` are available.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Hash{Symbol=>Integer}, nil]
        optional :stats, DockerEngineRuby::Internal::Type::HashOf[Integer]

        # @!attribute usage
        #   Current `res_counter` usage for memory.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :usage, Integer, nil?: true

        # @!method initialize(commitbytes: nil, commitpeakbytes: nil, failcnt: nil, limit: nil, max_usage: nil, privateworkingset: nil, stats: nil, usage: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::StatsResponse::MemoryStats} for more details.
        #
        #   Aggregates all memory stats since container inception on Linux. Windows returns
        #   stats for commit and private working set only.
        #
        #   @param commitbytes [Integer, nil] Committed bytes.
        #
        #   @param commitpeakbytes [Integer, nil] Peak committed bytes.
        #
        #   @param failcnt [Integer, nil] Number of times memory usage hits limits.
        #
        #   @param limit [Integer, nil] This field is Linux-specific and omitted for Windows containers.
        #
        #   @param max_usage [Integer, nil] Maximum usage ever recorded.
        #
        #   @param privateworkingset [Integer, nil] Private working set.
        #
        #   @param stats [Hash{Symbol=>Integer}] All the stats exported via memory.stat.
        #
        #   @param usage [Integer, nil] Current `res_counter` usage for memory.
      end

      # @see DockerEngineRuby::Models::StatsResponse#pids_stats
      class PidsStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute current
        #   Current is the number of PIDs in the cgroup.
        #
        #   @return [Integer, nil]
        optional :current, Integer, nil?: true

        # @!attribute limit
        #   Limit is the hard limit on the number of pids in the cgroup. A "Limit" of 0
        #   means that there is no limit.
        #
        #   @return [Integer, nil]
        optional :limit, Integer, nil?: true

        # @!method initialize(current: nil, limit: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::StatsResponse::PidsStats} for more details.
        #
        #   PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
        #
        #   This type is Linux-specific and omitted for Windows containers.
        #
        #   @param current [Integer, nil] Current is the number of PIDs in the cgroup.
        #
        #   @param limit [Integer, nil] Limit is the hard limit on the number of pids in the cgroup.
      end

      # @see DockerEngineRuby::Models::StatsResponse#precpu_stats
      class PrecpuStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute cpu_usage
        #   All CPU stats aggregated since container inception.
        #
        #   @return [DockerEngineRuby::Models::StatsResponse::PrecpuStats::CPUUsage, nil]
        optional :cpu_usage, -> { DockerEngineRuby::StatsResponse::PrecpuStats::CPUUsage }, nil?: true

        # @!attribute online_cpus
        #   Number of online CPUs.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :online_cpus, Integer, nil?: true

        # @!attribute system_cpu_usage
        #   System Usage.
        #
        #   This field is Linux-specific and omitted for Windows containers.
        #
        #   @return [Integer, nil]
        optional :system_cpu_usage, Integer, nil?: true

        # @!attribute throttling_data
        #   CPU throttling stats of the container.
        #
        #   This type is Linux-specific and omitted for Windows containers.
        #
        #   @return [DockerEngineRuby::Models::StatsResponse::PrecpuStats::ThrottlingData, nil]
        optional :throttling_data,
                 -> {
                   DockerEngineRuby::StatsResponse::PrecpuStats::ThrottlingData
                 },
                 nil?: true

        # @!method initialize(cpu_usage: nil, online_cpus: nil, system_cpu_usage: nil, throttling_data: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::StatsResponse::PrecpuStats} for more details.
        #
        #   CPU related info of the container
        #
        #   @param cpu_usage [DockerEngineRuby::Models::StatsResponse::PrecpuStats::CPUUsage, nil] All CPU stats aggregated since container inception.
        #
        #   @param online_cpus [Integer, nil] Number of online CPUs.
        #
        #   @param system_cpu_usage [Integer, nil] System Usage.
        #
        #   @param throttling_data [DockerEngineRuby::Models::StatsResponse::PrecpuStats::ThrottlingData, nil] CPU throttling stats of the container.

        # @see DockerEngineRuby::Models::StatsResponse::PrecpuStats#cpu_usage
        class CPUUsage < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute percpu_usage
          #   Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          #   This field is Linux-specific when using cgroups v1. It is omitted when using
          #   cgroups v2 and Windows containers.
          #
          #   @return [Array<Integer>, nil]
          optional :percpu_usage, DockerEngineRuby::Internal::Type::ArrayOf[Integer], nil?: true

          # @!attribute total_usage
          #   Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
          #   (Windows).
          #
          #   @return [Integer, nil]
          optional :total_usage, Integer

          # @!attribute usage_in_kernelmode
          #   Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
          #   time spent (in 100's of nanoseconds) by all container processes in kernel mode
          #   (Windows).
          #
          #   Not populated for Windows containers using Hyper-V isolation.
          #
          #   @return [Integer, nil]
          optional :usage_in_kernelmode, Integer

          # @!attribute usage_in_usermode
          #   Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
          #   spent (in 100's of nanoseconds) by all container processes in kernel mode
          #   (Windows).
          #
          #   Not populated for Windows containers using Hyper-V isolation.
          #
          #   @return [Integer, nil]
          optional :usage_in_usermode, Integer

          # @!method initialize(percpu_usage: nil, total_usage: nil, usage_in_kernelmode: nil, usage_in_usermode: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::StatsResponse::PrecpuStats::CPUUsage} for more
          #   details.
          #
          #   All CPU stats aggregated since container inception.
          #
          #   @param percpu_usage [Array<Integer>, nil] Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          #   @param total_usage [Integer] Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds (Windows)
          #
          #   @param usage_in_kernelmode [Integer] Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux),
          #
          #   @param usage_in_usermode [Integer] Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux),
        end

        # @see DockerEngineRuby::Models::StatsResponse::PrecpuStats#throttling_data
        class ThrottlingData < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute periods
          #   Number of periods with throttling active.
          #
          #   @return [Integer, nil]
          optional :periods, Integer

          # @!attribute throttled_periods
          #   Number of periods when the container hit its throttling limit.
          #
          #   @return [Integer, nil]
          optional :throttled_periods, Integer

          # @!attribute throttled_time
          #   Aggregated time (in nanoseconds) the container was throttled for.
          #
          #   @return [Integer, nil]
          optional :throttled_time, Integer

          # @!method initialize(periods: nil, throttled_periods: nil, throttled_time: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::StatsResponse::PrecpuStats::ThrottlingData} for more
          #   details.
          #
          #   CPU throttling stats of the container.
          #
          #   This type is Linux-specific and omitted for Windows containers.
          #
          #   @param periods [Integer] Number of periods with throttling active.
          #
          #   @param throttled_periods [Integer] Number of periods when the container hit its throttling limit.
          #
          #   @param throttled_time [Integer] Aggregated time (in nanoseconds) the container was throttled for.
        end
      end

      # @see DockerEngineRuby::Models::StatsResponse#storage_stats
      class StorageStats < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute read_count_normalized
        #
        #   @return [Integer, nil]
        optional :read_count_normalized, Integer, nil?: true

        # @!attribute read_size_bytes
        #
        #   @return [Integer, nil]
        optional :read_size_bytes, Integer, nil?: true

        # @!attribute write_count_normalized
        #
        #   @return [Integer, nil]
        optional :write_count_normalized, Integer, nil?: true

        # @!attribute write_size_bytes
        #
        #   @return [Integer, nil]
        optional :write_size_bytes, Integer, nil?: true

        # @!method initialize(read_count_normalized: nil, read_size_bytes: nil, write_count_normalized: nil, write_size_bytes: nil)
        #   StorageStats is the disk I/O stats for read/write on Windows.
        #
        #   This type is Windows-specific and omitted for Linux containers.
        #
        #   @param read_count_normalized [Integer, nil]
        #   @param read_size_bytes [Integer, nil]
        #   @param write_count_normalized [Integer, nil]
        #   @param write_size_bytes [Integer, nil]
      end
    end
  end
end
