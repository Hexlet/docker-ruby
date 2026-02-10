# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::ImagesTest < Docker::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.images.list

    assert_pattern do
      response => ^(Docker::Internal::Type::ArrayOf[Docker::Summary])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.images.delete("name")

    assert_pattern do
      response => ^(Docker::Internal::Type::ArrayOf[Docker::Models::ImageDeleteResponseItem])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.images.inspect_("name")

    assert_pattern do
      response => Docker::Image
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        author: String | nil,
        comment: String | nil,
        config: Docker::Image::Config | nil,
        created: String | nil,
        descriptor: Docker::Image::Descriptor | nil,
        graph_driver: Docker::Image::GraphDriver | nil,
        id: String | nil,
        identity: Docker::Image::Identity | nil,
        manifests: ^(Docker::Internal::Type::ArrayOf[Docker::Image::Manifest]) | nil,
        metadata: Docker::Image::Metadata | nil,
        os: String | nil,
        os_version: String | nil,
        repo_digests: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        repo_tags: ^(Docker::Internal::Type::ArrayOf[String]) | nil,
        root_fs: Docker::Image::RootFs | nil,
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
