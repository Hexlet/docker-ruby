# frozen_string_literal: true

module DockerEngineAPI
  module Models
    class FilesystemChange < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute kind
      #   Kind of change
      #
      #   Can be one of:
      #
      #   - `0`: Modified ("C")
      #   - `1`: Added ("A")
      #   - `2`: Deleted ("D")
      #
      #   @return [Integer, DockerEngineAPI::Models::FilesystemChange::Kind]
      required :kind, enum: -> { DockerEngineAPI::FilesystemChange::Kind }, api_name: :Kind

      # @!attribute path
      #   Path to file or directory that has changed.
      #
      #   @return [String]
      required :path, String, api_name: :Path

      # @!method initialize(kind:, path:)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::FilesystemChange} for more details.
      #
      #   Change in the container's filesystem.
      #
      #   @param kind [Integer, DockerEngineAPI::Models::FilesystemChange::Kind] Kind of change
      #
      #   @param path [String] Path to file or directory that has changed.

      # Kind of change
      #
      # Can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      #
      # @see DockerEngineAPI::Models::FilesystemChange#kind
      module Kind
        extend DockerEngineAPI::Internal::Type::Enum

        KIND_0 = 0
        KIND_1 = 1
        KIND_2 = 2

        # @!method self.values
        #   @return [Array<Integer>]
      end
    end
  end
end
