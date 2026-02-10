# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Services#create
    class ServiceCreateResponse < Docker::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the created service.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute warnings
      #   Optional warning message.
      #
      #   FIXME(thaJeztah): this should have "omitempty" in the generated type.
      #
      #   @return [Array<String>, nil]
      optional :warnings, Docker::Internal::Type::ArrayOf[String], api_name: :Warnings, nil?: true

      # @!method initialize(id: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ServiceCreateResponse} for more details.
      #
      #   contains the information returned to a client on the creation of a new service.
      #
      #   @param id [String] The ID of the created service.
      #
      #   @param warnings [Array<String>, nil] Optional warning message.
    end
  end
end
