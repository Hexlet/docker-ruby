# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Secrets#inspect_
    class Secret < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute created_at
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :CreatedAt

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute spec
      #
      #   @return [DockerEngineAPI::Models::Spec, nil]
      optional :spec, -> { DockerEngineAPI::Spec }, api_name: :Spec

      # @!attribute updated_at
      #
      #   @return [String, nil]
      optional :updated_at, String, api_name: :UpdatedAt

      # @!attribute version
      #   The version number of the object such as node, service, etc. This is needed to
      #   avoid conflicting writes. The client must send the version number along with the
      #   modified specification when updating these objects.
      #
      #   This approach ensures safe concurrency and determinism in that the change on the
      #   object may not be applied if the version number has changed from the last read.
      #   In other words, if two update requests specify the same base version, only one
      #   of the requests can succeed. As a result, two separate update requests that
      #   happen at the same time will not unintentionally overwrite each other.
      #
      #   @return [DockerEngineAPI::Models::Secret::Version, nil]
      optional :version, -> { DockerEngineAPI::Secret::Version }, api_name: :Version

      # @!method initialize(created_at: nil, id: nil, spec: nil, updated_at: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::Secret} for more details.
      #
      #   @param created_at [String]
      #
      #   @param id [String]
      #
      #   @param spec [DockerEngineAPI::Models::Spec]
      #
      #   @param updated_at [String]
      #
      #   @param version [DockerEngineAPI::Models::Secret::Version] The version number of the object such as node, service, etc. This is needed

      # @see DockerEngineAPI::Models::Secret#version
      class Version < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute index
        #
        #   @return [Integer, nil]
        optional :index, Integer, api_name: :Index

        # @!method initialize(index: nil)
        #   The version number of the object such as node, service, etc. This is needed to
        #   avoid conflicting writes. The client must send the version number along with the
        #   modified specification when updating these objects.
        #
        #   This approach ensures safe concurrency and determinism in that the change on the
        #   object may not be applied if the version number has changed from the last read.
        #   In other words, if two update requests specify the same base version, only one
        #   of the requests can succeed. As a result, two separate update requests that
        #   happen at the same time will not unintentionally overwrite each other.
        #
        #   @param index [Integer]
      end
    end
  end
end
