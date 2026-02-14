# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::ImagesTest < DockerEngine::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.images.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.images.delete("name")

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Models::ImageDeleteResponseItem])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.images.inspect_("name")

    assert_pattern do
      response => DockerEngine::Image
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        author: String | nil,
        comment: String | nil,
        config: DockerEngine::Image::Config | nil,
        created: String | nil,
        descriptor: DockerEngine::Image::Descriptor | nil,
        graph_driver: DockerEngine::Image::GraphDriver | nil,
        id: String | nil,
        identity: DockerEngine::Image::Identity | nil,
        manifests: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Image::Manifest]) | nil,
        metadata: DockerEngine::Image::Metadata | nil,
        os: String | nil,
        os_version: String | nil,
        repo_digests: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        repo_tags: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil,
        root_fs: DockerEngine::Image::RootFs | nil,
        size: Integer | nil,
        variant: String | nil
      }
    end
  end

  def test_pull
    skip("Prism tests are disabled")

    response = @docker.images.pull

    assert_pattern do
      response => nil
    end
  end
end
