# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # Идентификатор или дайджест образа.
    class ImageID < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!method initialize(id: nil)
      #   @param id [String]
    end
  end
end
