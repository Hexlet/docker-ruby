# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#commit
    class ImageCommitResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute id
      #   The id of the newly created object.
      #
      #   @return [String]
      required :id, String, api_name: :Id

      # @!method initialize(id:)
      #   Response to an API call that returns just an Id
      #
      #   @param id [String] The id of the newly created object.
    end
  end
end
