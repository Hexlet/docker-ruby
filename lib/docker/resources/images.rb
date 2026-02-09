# frozen_string_literal: true

module Docker
  module Resources
    class Images
      # Some parameter documentations has been truncated, see
      # {Docker::Models::ImageListParams} for more details.
      #
      # Returns a list of images on the server. Note that it uses a different, smaller
      # representation of an image than inspecting a single image.
      #
      # @overload list(all: nil, digests: nil, filters: nil, manifests: nil, shared_size: nil, request_options: {})
      #
      # @param all [Boolean] Show all images. Only images from a final layer (no children) are shown by defau
      #
      # @param digests [Boolean] Show digest information as a `RepoDigests` field on each image.
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param manifests [Boolean] Include `Manifests` in the image summary.
      #
      # @param shared_size [Boolean] Compute and show shared size as a `SharedSize` field on each image.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Docker::Models::Summary>]
      #
      # @see Docker::Models::ImageListParams
      def list(params = {})
        parsed, options = Docker::ImageListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "images/json",
          query: parsed.transform_keys(shared_size: "shared-size"),
          model: Docker::Internal::Type::ArrayOf[Docker::Summary],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ImageDeleteParams} for more details.
      #
      # Remove an image, along with any untagged parent images that were referenced by
      # that image.
      #
      # Images can't be removed if they have descendant images, are being used by a
      # running container or are being used by a build.
      #
      # @overload delete(name, force: nil, noprune: nil, platforms: nil, request_options: {})
      #
      # @param name [String] Image name or ID
      #
      # @param force [Boolean] Remove the image even if it is being used by stopped containers or has other tag
      #
      # @param noprune [Boolean] Do not delete untagged parent images
      #
      # @param platforms [Array<String>] Select platform-specific content to delete.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Docker::Models::ImageDeleteResponseItem>]
      #
      # @see Docker::Models::ImageDeleteParams
      def delete(name, params = {})
        parsed, options = Docker::ImageDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["images/%1$s", name],
          query: parsed,
          model: Docker::Internal::Type::ArrayOf[Docker::Models::ImageDeleteResponseItem],
          options: options
        )
      end

      # Return low-level information about an image.
      #
      # @overload inspect_(name, manifests: nil, request_options: {})
      #
      # @param name [String] Image name or id
      #
      # @param manifests [Boolean] Include Manifests in the image summary.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::Image]
      #
      # @see Docker::Models::ImageInspectParams
      def inspect_(name, params = {})
        parsed, options = Docker::ImageInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["images/%1$s/json", name],
          query: parsed,
          model: Docker::Image,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ImagePullParams} for more details.
      #
      # Pull or import an image.
      #
      # @overload pull(changes: nil, from_image: nil, from_src: nil, message: nil, platform: nil, repo: nil, tag: nil, body: nil, x_registry_auth: nil, request_options: {})
      #
      # @param changes [Array<String>] Query param: Apply `Dockerfile` instructions to the image that is created,
      #
      # @param from_image [String] Query param: Name of the image to pull. If the name includes a tag or digest, sp
      #
      # @param from_src [String] Query param: Source to import. The value may be a URL from which the image can b
      #
      # @param message [String] Query param: Set commit message for imported image.
      #
      # @param platform [String] Query param: Platform in the format os[/arch[/variant]].
      #
      # @param repo [String] Query param: Repository name given to an image when it is imported. The repo may
      #
      # @param tag [String] Query param: Tag or digest. If empty when pulling an image, this causes all tags
      #
      # @param body [String] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ImagePullParams
      def pull(params = {})
        parsed, options = Docker::ImagePullParams.dump_request(params)
        query_params = [:changes, :from_image, :from_src, :message, :platform, :repo, :tag]
        @client.request(
          method: :post,
          path: "images/create",
          query: parsed.slice(*query_params).transform_keys(from_image: "fromImage", from_src: "fromSrc"),
          headers: {
            "content-type" => "application/octet-stream",
            **parsed.except(:body, *query_params)
          }.transform_keys(
            x_registry_auth: "x-registry-auth"
          ),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Docker::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
