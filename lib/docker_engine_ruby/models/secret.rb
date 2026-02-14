# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Secrets#inspect_
    class Secret < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :CreatedAt

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::Spec, nil]
      optional :spec, -> { DockerEngineRuby::Spec }, api_name: :Spec

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :UpdatedAt

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
      #   @return [DockerEngineRuby::Models::Secret::Version, nil]
      optional :version, -> { DockerEngineRuby::Secret::Version }, api_name: :Version

      # @!method initialize(created_at: nil, id: nil, spec: nil, updated_at: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Secret} for more details.
      #
      #   @param created_at [Time]
      #
      #   @param id [String]
      #
      #   @param spec [DockerEngineRuby::Models::Spec]
      #
      #   @param updated_at [Time]
      #
      #   @param version [DockerEngineRuby::Models::Secret::Version] The version number of the object such as node, service, etc. This is needed

      # @see DockerEngineRuby::Models::Secret#version
      class Version < DockerEngineRuby::Internal::Type::BaseModel
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
