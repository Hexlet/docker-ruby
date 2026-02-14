# typed: strong

module DockerEngineAPI
  module Models
    class StatsResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::StatsResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # ID of the container for which the stats were collected.
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # BlkioStats stores all IO service stats for data read and write.
      #
      # This type is Linux-specific and holds many fields that are specific to cgroups
      # v1. On a cgroup v2 host, all fields other than `io_service_bytes_recursive` are
      # omitted or `null`.
      #
      # This type is only populated on Linux and omitted for Windows containers.
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::BlkioStats)) }
      attr_reader :blkio_stats

      sig do
        params(
          blkio_stats:
            T.nilable(DockerEngineAPI::StatsResponse::BlkioStats::OrHash)
        ).void
      end
      attr_writer :blkio_stats

      # CPU related info of the container
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::CPUStats)) }
      attr_reader :cpu_stats

      sig do
        params(
          cpu_stats: T.nilable(DockerEngineAPI::StatsResponse::CPUStats::OrHash)
        ).void
      end
      attr_writer :cpu_stats

      # Aggregates all memory stats since container inception on Linux. Windows returns
      # stats for commit and private working set only.
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::MemoryStats)) }
      attr_reader :memory_stats

      sig do
        params(
          memory_stats: DockerEngineAPI::StatsResponse::MemoryStats::OrHash
        ).void
      end
      attr_writer :memory_stats

      # Name of the container for which the stats were collected.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Network statistics for the container per interface.
      #
      # This field is omitted if the container has no networking enabled.
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :networks

      # The number of processors on the system.
      #
      # This field is Windows-specific and always zero for Linux containers.
      sig { returns(T.nilable(Integer)) }
      attr_reader :num_procs

      sig { params(num_procs: Integer).void }
      attr_writer :num_procs

      # OSType is the OS of the container ("linux" or "windows") to allow
      # platform-specific handling of stats.
      sig { returns(T.nilable(String)) }
      attr_accessor :os_type

      # PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
      #
      # This type is Linux-specific and omitted for Windows containers.
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::PidsStats)) }
      attr_reader :pids_stats

      sig do
        params(
          pids_stats:
            T.nilable(DockerEngineAPI::StatsResponse::PidsStats::OrHash)
        ).void
      end
      attr_writer :pids_stats

      # CPU related info of the container
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::PrecpuStats)) }
      attr_reader :precpu_stats

      sig do
        params(
          precpu_stats:
            T.nilable(DockerEngineAPI::StatsResponse::PrecpuStats::OrHash)
        ).void
      end
      attr_writer :precpu_stats

      # Date and time at which this first sample was collected. This field is not
      # propagated if the "one-shot" option is set. If the "one-shot" option is set,
      # this field may be omitted, empty, or set to a default date
      # (`0001-01-01T00:00:00Z`).
      #
      # The value is formatted as [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with
      # nano-seconds.
      sig { returns(T.nilable(Time)) }
      attr_reader :preread

      sig { params(preread: Time).void }
      attr_writer :preread

      # Date and time at which this sample was collected. The value is formatted as
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with nano-seconds.
      sig { returns(T.nilable(Time)) }
      attr_reader :read

      sig { params(read: Time).void }
      attr_writer :read

      # StorageStats is the disk I/O stats for read/write on Windows.
      #
      # This type is Windows-specific and omitted for Linux containers.
      sig { returns(T.nilable(DockerEngineAPI::StatsResponse::StorageStats)) }
      attr_reader :storage_stats

      sig do
        params(
          storage_stats:
            T.nilable(DockerEngineAPI::StatsResponse::StorageStats::OrHash)
        ).void
      end
      attr_writer :storage_stats

      # Statistics sample for a container.
      sig do
        params(
          id: T.nilable(String),
          blkio_stats:
            T.nilable(DockerEngineAPI::StatsResponse::BlkioStats::OrHash),
          cpu_stats:
            T.nilable(DockerEngineAPI::StatsResponse::CPUStats::OrHash),
          memory_stats: DockerEngineAPI::StatsResponse::MemoryStats::OrHash,
          name: T.nilable(String),
          networks: T.nilable(T.anything),
          num_procs: Integer,
          os_type: T.nilable(String),
          pids_stats:
            T.nilable(DockerEngineAPI::StatsResponse::PidsStats::OrHash),
          precpu_stats:
            T.nilable(DockerEngineAPI::StatsResponse::PrecpuStats::OrHash),
          preread: Time,
          read: Time,
          storage_stats:
            T.nilable(DockerEngineAPI::StatsResponse::StorageStats::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the container for which the stats were collected.
        id: nil,
        # BlkioStats stores all IO service stats for data read and write.
        #
        # This type is Linux-specific and holds many fields that are specific to cgroups
        # v1. On a cgroup v2 host, all fields other than `io_service_bytes_recursive` are
        # omitted or `null`.
        #
        # This type is only populated on Linux and omitted for Windows containers.
        blkio_stats: nil,
        # CPU related info of the container
        cpu_stats: nil,
        # Aggregates all memory stats since container inception on Linux. Windows returns
        # stats for commit and private working set only.
        memory_stats: nil,
        # Name of the container for which the stats were collected.
        name: nil,
        # Network statistics for the container per interface.
        #
        # This field is omitted if the container has no networking enabled.
        networks: nil,
        # The number of processors on the system.
        #
        # This field is Windows-specific and always zero for Linux containers.
        num_procs: nil,
        # OSType is the OS of the container ("linux" or "windows") to allow
        # platform-specific handling of stats.
        os_type: nil,
        # PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
        #
        # This type is Linux-specific and omitted for Windows containers.
        pids_stats: nil,
        # CPU related info of the container
        precpu_stats: nil,
        # Date and time at which this first sample was collected. This field is not
        # propagated if the "one-shot" option is set. If the "one-shot" option is set,
        # this field may be omitted, empty, or set to a default date
        # (`0001-01-01T00:00:00Z`).
        #
        # The value is formatted as [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with
        # nano-seconds.
        preread: nil,
        # Date and time at which this sample was collected. The value is formatted as
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) with nano-seconds.
        read: nil,
        # StorageStats is the disk I/O stats for read/write on Windows.
        #
        # This type is Windows-specific and omitted for Linux containers.
        storage_stats: nil
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            blkio_stats: T.nilable(DockerEngineAPI::StatsResponse::BlkioStats),
            cpu_stats: T.nilable(DockerEngineAPI::StatsResponse::CPUStats),
            memory_stats: DockerEngineAPI::StatsResponse::MemoryStats,
            name: T.nilable(String),
            networks: T.nilable(T.anything),
            num_procs: Integer,
            os_type: T.nilable(String),
            pids_stats: T.nilable(DockerEngineAPI::StatsResponse::PidsStats),
            precpu_stats:
              T.nilable(DockerEngineAPI::StatsResponse::PrecpuStats),
            preread: Time,
            read: Time,
            storage_stats:
              T.nilable(DockerEngineAPI::StatsResponse::StorageStats)
          }
        )
      end
      def to_hash
      end

      class BlkioStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::BlkioStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoMergedRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_merged_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoQueueRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_queue_recursive

        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoServiceBytesRecursive
                )
              ]
            )
          )
        end
        attr_reader :io_service_bytes_recursive

        sig do
          params(
            io_service_bytes_recursive:
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoServiceBytesRecursive::OrHash
                )
              ]
          ).void
        end
        attr_writer :io_service_bytes_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoServiceTimeRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_service_time_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoServicedRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_serviced_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoTimeRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_time_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoWaitTimeRecursive
                )
              ]
            )
          )
        end
        attr_accessor :io_wait_time_recursive

        # This field is only available when using Linux containers with cgroups v1. It is
        # omitted or `null` when using cgroups v2.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::SectorsRecursive
                )
              ]
            )
          )
        end
        attr_accessor :sectors_recursive

        # BlkioStats stores all IO service stats for data read and write.
        #
        # This type is Linux-specific and holds many fields that are specific to cgroups
        # v1. On a cgroup v2 host, all fields other than `io_service_bytes_recursive` are
        # omitted or `null`.
        #
        # This type is only populated on Linux and omitted for Windows containers.
        sig do
          params(
            io_merged_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoMergedRecursive::OrHash
                  )
                ]
              ),
            io_queue_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoQueueRecursive::OrHash
                  )
                ]
              ),
            io_service_bytes_recursive:
              T::Array[
                T.nilable(
                  DockerEngineAPI::StatsResponse::BlkioStats::IoServiceBytesRecursive::OrHash
                )
              ],
            io_service_time_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoServiceTimeRecursive::OrHash
                  )
                ]
              ),
            io_serviced_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoServicedRecursive::OrHash
                  )
                ]
              ),
            io_time_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoTimeRecursive::OrHash
                  )
                ]
              ),
            io_wait_time_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoWaitTimeRecursive::OrHash
                  )
                ]
              ),
            sectors_recursive:
              T.nilable(
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::SectorsRecursive::OrHash
                  )
                ]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_merged_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_queue_recursive: nil,
          io_service_bytes_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_service_time_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_serviced_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_time_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          io_wait_time_recursive: nil,
          # This field is only available when using Linux containers with cgroups v1. It is
          # omitted or `null` when using cgroups v2.
          sectors_recursive: nil
        )
        end

        sig do
          override.returns(
            {
              io_merged_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoMergedRecursive
                    )
                  ]
                ),
              io_queue_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoQueueRecursive
                    )
                  ]
                ),
              io_service_bytes_recursive:
                T::Array[
                  T.nilable(
                    DockerEngineAPI::StatsResponse::BlkioStats::IoServiceBytesRecursive
                  )
                ],
              io_service_time_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoServiceTimeRecursive
                    )
                  ]
                ),
              io_serviced_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoServicedRecursive
                    )
                  ]
                ),
              io_time_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoTimeRecursive
                    )
                  ]
                ),
              io_wait_time_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::IoWaitTimeRecursive
                    )
                  ]
                ),
              sectors_recursive:
                T.nilable(
                  T::Array[
                    T.nilable(
                      DockerEngineAPI::StatsResponse::BlkioStats::SectorsRecursive
                    )
                  ]
                )
            }
          )
        end
        def to_hash
        end

        class IoMergedRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoMergedRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoQueueRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoQueueRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoServiceBytesRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoServiceBytesRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoServiceTimeRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoServiceTimeRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoServicedRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoServicedRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoTimeRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoTimeRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class IoWaitTimeRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::IoWaitTimeRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end

        class SectorsRecursive < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::BlkioStats::SectorsRecursive,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :major

          sig { params(major: Integer).void }
          attr_writer :major

          sig { returns(T.nilable(Integer)) }
          attr_reader :minor

          sig { params(minor: Integer).void }
          attr_writer :minor

          sig { returns(T.nilable(String)) }
          attr_reader :op

          sig { params(op: String).void }
          attr_writer :op

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          # Blkio stats entry.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              major: Integer,
              minor: Integer,
              op: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(major: nil, minor: nil, op: nil, value: nil)
          end

          sig do
            override.returns(
              { major: Integer, minor: Integer, op: String, value: Integer }
            )
          end
          def to_hash
          end
        end
      end

      class CPUStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::CPUStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # All CPU stats aggregated since container inception.
        sig do
          returns(T.nilable(DockerEngineAPI::StatsResponse::CPUStats::CPUUsage))
        end
        attr_reader :cpu_usage

        sig do
          params(
            cpu_usage:
              T.nilable(
                DockerEngineAPI::StatsResponse::CPUStats::CPUUsage::OrHash
              )
          ).void
        end
        attr_writer :cpu_usage

        # Number of online CPUs.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :online_cpus

        # System Usage.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :system_cpu_usage

        # CPU throttling stats of the container.
        #
        # This type is Linux-specific and omitted for Windows containers.
        sig do
          returns(
            T.nilable(DockerEngineAPI::StatsResponse::CPUStats::ThrottlingData)
          )
        end
        attr_reader :throttling_data

        sig do
          params(
            throttling_data:
              T.nilable(
                DockerEngineAPI::StatsResponse::CPUStats::ThrottlingData::OrHash
              )
          ).void
        end
        attr_writer :throttling_data

        # CPU related info of the container
        sig do
          params(
            cpu_usage:
              T.nilable(
                DockerEngineAPI::StatsResponse::CPUStats::CPUUsage::OrHash
              ),
            online_cpus: T.nilable(Integer),
            system_cpu_usage: T.nilable(Integer),
            throttling_data:
              T.nilable(
                DockerEngineAPI::StatsResponse::CPUStats::ThrottlingData::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # All CPU stats aggregated since container inception.
          cpu_usage: nil,
          # Number of online CPUs.
          #
          # This field is Linux-specific and omitted for Windows containers.
          online_cpus: nil,
          # System Usage.
          #
          # This field is Linux-specific and omitted for Windows containers.
          system_cpu_usage: nil,
          # CPU throttling stats of the container.
          #
          # This type is Linux-specific and omitted for Windows containers.
          throttling_data: nil
        )
        end

        sig do
          override.returns(
            {
              cpu_usage:
                T.nilable(DockerEngineAPI::StatsResponse::CPUStats::CPUUsage),
              online_cpus: T.nilable(Integer),
              system_cpu_usage: T.nilable(Integer),
              throttling_data:
                T.nilable(
                  DockerEngineAPI::StatsResponse::CPUStats::ThrottlingData
                )
            }
          )
        end
        def to_hash
        end

        class CPUUsage < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::CPUStats::CPUUsage,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          # This field is Linux-specific when using cgroups v1. It is omitted when using
          # cgroups v2 and Windows containers.
          sig { returns(T.nilable(T::Array[Integer])) }
          attr_accessor :percpu_usage

          # Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
          # (Windows).
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_usage

          sig { params(total_usage: Integer).void }
          attr_writer :total_usage

          # Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
          # time spent (in 100's of nanoseconds) by all container processes in kernel mode
          # (Windows).
          #
          # Not populated for Windows containers using Hyper-V isolation.
          sig { returns(T.nilable(Integer)) }
          attr_reader :usage_in_kernelmode

          sig { params(usage_in_kernelmode: Integer).void }
          attr_writer :usage_in_kernelmode

          # Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
          # spent (in 100's of nanoseconds) by all container processes in kernel mode
          # (Windows).
          #
          # Not populated for Windows containers using Hyper-V isolation.
          sig { returns(T.nilable(Integer)) }
          attr_reader :usage_in_usermode

          sig { params(usage_in_usermode: Integer).void }
          attr_writer :usage_in_usermode

          # All CPU stats aggregated since container inception.
          sig do
            params(
              percpu_usage: T.nilable(T::Array[Integer]),
              total_usage: Integer,
              usage_in_kernelmode: Integer,
              usage_in_usermode: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Total CPU time (in nanoseconds) consumed per core (Linux).
            #
            # This field is Linux-specific when using cgroups v1. It is omitted when using
            # cgroups v2 and Windows containers.
            percpu_usage: nil,
            # Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
            # (Windows).
            total_usage: nil,
            # Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
            # time spent (in 100's of nanoseconds) by all container processes in kernel mode
            # (Windows).
            #
            # Not populated for Windows containers using Hyper-V isolation.
            usage_in_kernelmode: nil,
            # Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
            # spent (in 100's of nanoseconds) by all container processes in kernel mode
            # (Windows).
            #
            # Not populated for Windows containers using Hyper-V isolation.
            usage_in_usermode: nil
          )
          end

          sig do
            override.returns(
              {
                percpu_usage: T.nilable(T::Array[Integer]),
                total_usage: Integer,
                usage_in_kernelmode: Integer,
                usage_in_usermode: Integer
              }
            )
          end
          def to_hash
          end
        end

        class ThrottlingData < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::CPUStats::ThrottlingData,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Number of periods with throttling active.
          sig { returns(T.nilable(Integer)) }
          attr_reader :periods

          sig { params(periods: Integer).void }
          attr_writer :periods

          # Number of periods when the container hit its throttling limit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :throttled_periods

          sig { params(throttled_periods: Integer).void }
          attr_writer :throttled_periods

          # Aggregated time (in nanoseconds) the container was throttled for.
          sig { returns(T.nilable(Integer)) }
          attr_reader :throttled_time

          sig { params(throttled_time: Integer).void }
          attr_writer :throttled_time

          # CPU throttling stats of the container.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              periods: Integer,
              throttled_periods: Integer,
              throttled_time: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of periods with throttling active.
            periods: nil,
            # Number of periods when the container hit its throttling limit.
            throttled_periods: nil,
            # Aggregated time (in nanoseconds) the container was throttled for.
            throttled_time: nil
          )
          end

          sig do
            override.returns(
              {
                periods: Integer,
                throttled_periods: Integer,
                throttled_time: Integer
              }
            )
          end
          def to_hash
          end
        end
      end

      class MemoryStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::MemoryStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Committed bytes.
        #
        # This field is Windows-specific and omitted for Linux containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :commitbytes

        # Peak committed bytes.
        #
        # This field is Windows-specific and omitted for Linux containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :commitpeakbytes

        # Number of times memory usage hits limits.
        #
        # This field is Linux-specific and only supported on cgroups v1. It is omitted
        # when using cgroups v2 and for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :failcnt

        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        # Maximum usage ever recorded.
        #
        # This field is Linux-specific and only supported on cgroups v1. It is omitted
        # when using cgroups v2 and for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_usage

        # Private working set.
        #
        # This field is Windows-specific and omitted for Linux containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :privateworkingset

        # All the stats exported via memory.stat.
        #
        # The fields in this object differ between cgroups v1 and v2. On cgroups v1,
        # fields such as `cache`, `rss`, `mapped_file` are available. On cgroups v2,
        # fields such as `file`, `anon`, `inactive_file` are available.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
        attr_reader :stats

        sig { params(stats: T::Hash[Symbol, Integer]).void }
        attr_writer :stats

        # Current `res_counter` usage for memory.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :usage

        # Aggregates all memory stats since container inception on Linux. Windows returns
        # stats for commit and private working set only.
        sig do
          params(
            commitbytes: T.nilable(Integer),
            commitpeakbytes: T.nilable(Integer),
            failcnt: T.nilable(Integer),
            limit: T.nilable(Integer),
            max_usage: T.nilable(Integer),
            privateworkingset: T.nilable(Integer),
            stats: T::Hash[Symbol, Integer],
            usage: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Committed bytes.
          #
          # This field is Windows-specific and omitted for Linux containers.
          commitbytes: nil,
          # Peak committed bytes.
          #
          # This field is Windows-specific and omitted for Linux containers.
          commitpeakbytes: nil,
          # Number of times memory usage hits limits.
          #
          # This field is Linux-specific and only supported on cgroups v1. It is omitted
          # when using cgroups v2 and for Windows containers.
          failcnt: nil,
          # This field is Linux-specific and omitted for Windows containers.
          limit: nil,
          # Maximum usage ever recorded.
          #
          # This field is Linux-specific and only supported on cgroups v1. It is omitted
          # when using cgroups v2 and for Windows containers.
          max_usage: nil,
          # Private working set.
          #
          # This field is Windows-specific and omitted for Linux containers.
          privateworkingset: nil,
          # All the stats exported via memory.stat.
          #
          # The fields in this object differ between cgroups v1 and v2. On cgroups v1,
          # fields such as `cache`, `rss`, `mapped_file` are available. On cgroups v2,
          # fields such as `file`, `anon`, `inactive_file` are available.
          #
          # This field is Linux-specific and omitted for Windows containers.
          stats: nil,
          # Current `res_counter` usage for memory.
          #
          # This field is Linux-specific and omitted for Windows containers.
          usage: nil
        )
        end

        sig do
          override.returns(
            {
              commitbytes: T.nilable(Integer),
              commitpeakbytes: T.nilable(Integer),
              failcnt: T.nilable(Integer),
              limit: T.nilable(Integer),
              max_usage: T.nilable(Integer),
              privateworkingset: T.nilable(Integer),
              stats: T::Hash[Symbol, Integer],
              usage: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class PidsStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::PidsStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Current is the number of PIDs in the cgroup.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :current

        # Limit is the hard limit on the number of pids in the cgroup. A "Limit" of 0
        # means that there is no limit.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        # PidsStats contains Linux-specific stats of a container's process-IDs (PIDs).
        #
        # This type is Linux-specific and omitted for Windows containers.
        sig do
          params(
            current: T.nilable(Integer),
            limit: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Current is the number of PIDs in the cgroup.
          current: nil,
          # Limit is the hard limit on the number of pids in the cgroup. A "Limit" of 0
          # means that there is no limit.
          limit: nil
        )
        end

        sig do
          override.returns(
            { current: T.nilable(Integer), limit: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end

      class PrecpuStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::PrecpuStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # All CPU stats aggregated since container inception.
        sig do
          returns(
            T.nilable(DockerEngineAPI::StatsResponse::PrecpuStats::CPUUsage)
          )
        end
        attr_reader :cpu_usage

        sig do
          params(
            cpu_usage:
              T.nilable(
                DockerEngineAPI::StatsResponse::PrecpuStats::CPUUsage::OrHash
              )
          ).void
        end
        attr_writer :cpu_usage

        # Number of online CPUs.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :online_cpus

        # System Usage.
        #
        # This field is Linux-specific and omitted for Windows containers.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :system_cpu_usage

        # CPU throttling stats of the container.
        #
        # This type is Linux-specific and omitted for Windows containers.
        sig do
          returns(
            T.nilable(
              DockerEngineAPI::StatsResponse::PrecpuStats::ThrottlingData
            )
          )
        end
        attr_reader :throttling_data

        sig do
          params(
            throttling_data:
              T.nilable(
                DockerEngineAPI::StatsResponse::PrecpuStats::ThrottlingData::OrHash
              )
          ).void
        end
        attr_writer :throttling_data

        # CPU related info of the container
        sig do
          params(
            cpu_usage:
              T.nilable(
                DockerEngineAPI::StatsResponse::PrecpuStats::CPUUsage::OrHash
              ),
            online_cpus: T.nilable(Integer),
            system_cpu_usage: T.nilable(Integer),
            throttling_data:
              T.nilable(
                DockerEngineAPI::StatsResponse::PrecpuStats::ThrottlingData::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # All CPU stats aggregated since container inception.
          cpu_usage: nil,
          # Number of online CPUs.
          #
          # This field is Linux-specific and omitted for Windows containers.
          online_cpus: nil,
          # System Usage.
          #
          # This field is Linux-specific and omitted for Windows containers.
          system_cpu_usage: nil,
          # CPU throttling stats of the container.
          #
          # This type is Linux-specific and omitted for Windows containers.
          throttling_data: nil
        )
        end

        sig do
          override.returns(
            {
              cpu_usage:
                T.nilable(
                  DockerEngineAPI::StatsResponse::PrecpuStats::CPUUsage
                ),
              online_cpus: T.nilable(Integer),
              system_cpu_usage: T.nilable(Integer),
              throttling_data:
                T.nilable(
                  DockerEngineAPI::StatsResponse::PrecpuStats::ThrottlingData
                )
            }
          )
        end
        def to_hash
        end

        class CPUUsage < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::PrecpuStats::CPUUsage,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Total CPU time (in nanoseconds) consumed per core (Linux).
          #
          # This field is Linux-specific when using cgroups v1. It is omitted when using
          # cgroups v2 and Windows containers.
          sig { returns(T.nilable(T::Array[Integer])) }
          attr_accessor :percpu_usage

          # Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
          # (Windows).
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_usage

          sig { params(total_usage: Integer).void }
          attr_writer :total_usage

          # Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
          # time spent (in 100's of nanoseconds) by all container processes in kernel mode
          # (Windows).
          #
          # Not populated for Windows containers using Hyper-V isolation.
          sig { returns(T.nilable(Integer)) }
          attr_reader :usage_in_kernelmode

          sig { params(usage_in_kernelmode: Integer).void }
          attr_writer :usage_in_kernelmode

          # Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
          # spent (in 100's of nanoseconds) by all container processes in kernel mode
          # (Windows).
          #
          # Not populated for Windows containers using Hyper-V isolation.
          sig { returns(T.nilable(Integer)) }
          attr_reader :usage_in_usermode

          sig { params(usage_in_usermode: Integer).void }
          attr_writer :usage_in_usermode

          # All CPU stats aggregated since container inception.
          sig do
            params(
              percpu_usage: T.nilable(T::Array[Integer]),
              total_usage: Integer,
              usage_in_kernelmode: Integer,
              usage_in_usermode: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Total CPU time (in nanoseconds) consumed per core (Linux).
            #
            # This field is Linux-specific when using cgroups v1. It is omitted when using
            # cgroups v2 and Windows containers.
            percpu_usage: nil,
            # Total CPU time consumed in nanoseconds (Linux) or 100's of nanoseconds
            # (Windows).
            total_usage: nil,
            # Time (in nanoseconds) spent by tasks of the cgroup in kernel mode (Linux), or
            # time spent (in 100's of nanoseconds) by all container processes in kernel mode
            # (Windows).
            #
            # Not populated for Windows containers using Hyper-V isolation.
            usage_in_kernelmode: nil,
            # Time (in nanoseconds) spent by tasks of the cgroup in user mode (Linux), or time
            # spent (in 100's of nanoseconds) by all container processes in kernel mode
            # (Windows).
            #
            # Not populated for Windows containers using Hyper-V isolation.
            usage_in_usermode: nil
          )
          end

          sig do
            override.returns(
              {
                percpu_usage: T.nilable(T::Array[Integer]),
                total_usage: Integer,
                usage_in_kernelmode: Integer,
                usage_in_usermode: Integer
              }
            )
          end
          def to_hash
          end
        end

        class ThrottlingData < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::StatsResponse::PrecpuStats::ThrottlingData,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Number of periods with throttling active.
          sig { returns(T.nilable(Integer)) }
          attr_reader :periods

          sig { params(periods: Integer).void }
          attr_writer :periods

          # Number of periods when the container hit its throttling limit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :throttled_periods

          sig { params(throttled_periods: Integer).void }
          attr_writer :throttled_periods

          # Aggregated time (in nanoseconds) the container was throttled for.
          sig { returns(T.nilable(Integer)) }
          attr_reader :throttled_time

          sig { params(throttled_time: Integer).void }
          attr_writer :throttled_time

          # CPU throttling stats of the container.
          #
          # This type is Linux-specific and omitted for Windows containers.
          sig do
            params(
              periods: Integer,
              throttled_periods: Integer,
              throttled_time: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of periods with throttling active.
            periods: nil,
            # Number of periods when the container hit its throttling limit.
            throttled_periods: nil,
            # Aggregated time (in nanoseconds) the container was throttled for.
            throttled_time: nil
          )
          end

          sig do
            override.returns(
              {
                periods: Integer,
                throttled_periods: Integer,
                throttled_time: Integer
              }
            )
          end
          def to_hash
          end
        end
      end

      class StorageStats < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::StatsResponse::StorageStats,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_accessor :read_count_normalized

        sig { returns(T.nilable(Integer)) }
        attr_accessor :read_size_bytes

        sig { returns(T.nilable(Integer)) }
        attr_accessor :write_count_normalized

        sig { returns(T.nilable(Integer)) }
        attr_accessor :write_size_bytes

        # StorageStats is the disk I/O stats for read/write on Windows.
        #
        # This type is Windows-specific and omitted for Linux containers.
        sig do
          params(
            read_count_normalized: T.nilable(Integer),
            read_size_bytes: T.nilable(Integer),
            write_count_normalized: T.nilable(Integer),
            write_size_bytes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          read_count_normalized: nil,
          read_size_bytes: nil,
          write_count_normalized: nil,
          write_size_bytes: nil
        )
        end

        sig do
          override.returns(
            {
              read_count_normalized: T.nilable(Integer),
              read_size_bytes: T.nilable(Integer),
              write_count_normalized: T.nilable(Integer),
              write_size_bytes: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
