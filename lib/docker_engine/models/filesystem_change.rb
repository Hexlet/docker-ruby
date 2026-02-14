# frozen_string_literal: true

module DockerEngine
  module Models
    class FilesystemChange < DockerEngine::Internal::Type::BaseModel
      # @!attribute kind
      #   Kind of change
      #
      #   Can be one of:
      #
      #   - `0`: Modified ("C")
      #   - `1`: Added ("A")
      #   - `2`: Deleted ("D")
      #
      #   @return [Integer, DockerEngine::Models::FilesystemChange::Kind]
      required :kind, enum: -> { DockerEngine::FilesystemChange::Kind }, api_name: :Kind

      # @!attribute path
      #   Path to file or directory that has changed.
      #
      #   @return [String]
      required :path, String, api_name: :Path

      # @!method initialize(kind:, path:)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::FilesystemChange} for more details.
      #
      #   Change in the container's filesystem.
      #
      #   @param kind [Integer, DockerEngine::Models::FilesystemChange::Kind] Kind of change
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
      # @see DockerEngine::Models::FilesystemChange#kind
      module Kind
        extend DockerEngine::Internal::Type::Enum

        KIND_0 = 0
        KIND_1 = 1
        KIND_2 = 2

        # @!method self.values
        #   @return [Array<Integer>]
      end
    end
  end
end
