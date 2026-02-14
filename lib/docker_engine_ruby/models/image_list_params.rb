# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#list
    class ImageListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute all
      #   Show all images. Only images from a final layer (no children) are shown by
      #   default.
      #
      #   @return [Boolean, nil]
      optional :all, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute digests
      #   Show digest information as a `RepoDigests` field on each image.
      #
      #   @return [Boolean, nil]
      optional :digests, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   images list.
      #
      #   Available filters:
      #
      #   - `before`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
      #   - `dangling=true`
      #   - `label=key` or `label="key=value"` of an image label
      #   - `reference`=(`<image-name>[:<tag>]`)
      #   - `since`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
      #   - `until=<timestamp>`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute manifests
      #   Include `Manifests` in the image summary.
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute shared_size
      #   Compute and show shared size as a `SharedSize` field on each image.
      #
      #   @return [Boolean, nil]
      optional :shared_size, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(all: nil, digests: nil, filters: nil, manifests: nil, shared_size: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImageListParams} for more details.
      #
      #   @param all [Boolean] Show all images. Only images from a final layer (no children) are shown by defau
      #
      #   @param digests [Boolean] Show digest information as a `RepoDigests` field on each image.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param manifests [Boolean] Include `Manifests` in the image summary.
      #
      #   @param shared_size [Boolean] Compute and show shared size as a `SharedSize` field on each image.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
