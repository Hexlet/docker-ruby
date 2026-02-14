# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class FilesystemChange < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute kind
      #   Kind of change
      #
      #   Can be one of:
      #
      #   - `0`: Modified ("C")
      #   - `1`: Added ("A")
      #   - `2`: Deleted ("D")
      #
      #   @return [Integer, DockerEngineRuby::Models::FilesystemChange::Kind]
      required :kind, enum: -> { DockerEngineRuby::FilesystemChange::Kind }, api_name: :Kind

      # @!attribute path
      #   Path to file or directory that has changed.
      #
      #   @return [String]
      required :path, String, api_name: :Path

      # @!method initialize(kind:, path:)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::FilesystemChange} for more details.
      #
      #   Change in the container's filesystem.
      #
      #   @param kind [Integer, DockerEngineRuby::Models::FilesystemChange::Kind] Kind of change
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
      # @see DockerEngineRuby::Models::FilesystemChange#kind
      module Kind
        extend DockerEngineRuby::Internal::Type::Enum

        KIND_0 = 0
        KIND_1 = 1
        KIND_2 = 2

        # @!method self.values
        #   @return [Array<Integer>]
      end
    end
  end
end
