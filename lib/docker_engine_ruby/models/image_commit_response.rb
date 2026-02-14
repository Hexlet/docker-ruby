# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#commit
    class ImageCommitResponse < DockerEngineRuby::Internal::Type::BaseModel
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
