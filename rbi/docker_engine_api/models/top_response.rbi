# typed: strong

module DockerEngineAPI
  module Models
    class TopResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::TopResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Each process running in the container, where each process is an array of values
      # corresponding to the titles.
      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      attr_reader :processes

      sig { params(processes: T::Array[T::Array[String]]).void }
      attr_writer :processes

      # The ps column titles
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :titles

      sig { params(titles: T::Array[String]).void }
      attr_writer :titles

      # Container "top" response.
      sig do
        params(
          processes: T::Array[T::Array[String]],
          titles: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Each process running in the container, where each process is an array of values
        # corresponding to the titles.
        processes: nil,
        # The ps column titles
        titles: nil
      )
      end

      sig do
        override.returns(
          { processes: T::Array[T::Array[String]], titles: T::Array[String] }
        )
      end
      def to_hash
      end
    end
  end
end
