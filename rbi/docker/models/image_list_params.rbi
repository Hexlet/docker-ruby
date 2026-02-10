# typed: strong

module Docker
  module Models
    class ImageListParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ImageListParams, Docker::Internal::AnyHash)
        end

      # Show all images. Only images from a final layer (no children) are shown by
      # default.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all

      sig { params(all: T::Boolean).void }
      attr_writer :all

      # Show digest information as a `RepoDigests` field on each image.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :digests

      sig { params(digests: T::Boolean).void }
      attr_writer :digests

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # images list.
      #
      # Available filters:
      #
      # - `before`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
      # - `dangling=true`
      # - `label=key` or `label="key=value"` of an image label
      # - `reference`=(`<image-name>[:<tag>]`)
      # - `since`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
      # - `until=<timestamp>`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Include `Manifests` in the image summary.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :manifests

      sig { params(manifests: T::Boolean).void }
      attr_writer :manifests

      # Compute and show shared size as a `SharedSize` field on each image.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shared_size

      sig { params(shared_size: T::Boolean).void }
      attr_writer :shared_size

      sig do
        params(
          all: T::Boolean,
          digests: T::Boolean,
          filters: String,
          manifests: T::Boolean,
          shared_size: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Show all images. Only images from a final layer (no children) are shown by
        # default.
        all: nil,
        # Show digest information as a `RepoDigests` field on each image.
        digests: nil,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # images list.
        #
        # Available filters:
        #
        # - `before`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `dangling=true`
        # - `label=key` or `label="key=value"` of an image label
        # - `reference`=(`<image-name>[:<tag>]`)
        # - `since`=(`<image-name>[:<tag>]`, `<image id>` or `<image@digest>`)
        # - `until=<timestamp>`
        filters: nil,
        # Include `Manifests` in the image summary.
        manifests: nil,
        # Compute and show shared size as a `SharedSize` field on each image.
        shared_size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            digests: T::Boolean,
            filters: String,
            manifests: T::Boolean,
            shared_size: T::Boolean,
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
