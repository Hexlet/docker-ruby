# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::ImagesTest < DockerEngineRuby::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @docker.images.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.images.delete("name")

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::DeleteItem])
    end
  end

  def test_build_required_params
    skip("Prism tests are disabled")

    response = @docker.images.build(body: Pathname(__FILE__))

    assert_pattern do
      response => nil
    end
  end

  def test_build_prune
    skip("Prism tests are disabled")

    response = @docker.images.build_prune

    assert_pattern do
      response => DockerEngineRuby::Models::ImageBuildPruneResponse
    end

    assert_pattern do
      response => {
        caches_deleted: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        space_reclaimed: Integer | nil
      }
    end
  end

  def test_commit
    skip("Prism tests are disabled")

    response = @docker.images.commit

    assert_pattern do
      response => DockerEngineRuby::Models::ImageCommitResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_get
    skip("Prism doesn't support application/x-tar responses")

    response = @docker.images.get("name")

    assert_pattern do
      response => StringIO
    end
  end

  def test_get_all
    skip("Prism doesn't support application/x-tar responses")

    response = @docker.images.get_all

    assert_pattern do
      response => StringIO
    end
  end

  def test_history
    skip("Prism tests are disabled")

    response = @docker.images.history("name")

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::HistoryItem])
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.images.inspect_("name")

    assert_pattern do
      response => DockerEngineRuby::Image
    end

    assert_pattern do
      response => {
        architecture: String | nil,
        author: String | nil,
        comment: String | nil,
        config: DockerEngineRuby::Image::Config | nil,
        created: String | nil,
        descriptor: DockerEngineRuby::Image::Descriptor | nil,
        graph_driver: DockerEngineRuby::Image::GraphDriver | nil,
        id: String | nil,
        identity: DockerEngineRuby::Image::Identity | nil,
        manifests: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Image::Manifest]) | nil,
        metadata: DockerEngineRuby::Image::Metadata | nil,
        os: String | nil,
        os_version: String | nil,
        repo_digests: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        repo_tags: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        root_fs: DockerEngineRuby::Image::RootFs | nil,
        size: Integer | nil,
        variant: String | nil
      }
    end
  end

  def test_load__required_params
    skip("Prism tests are disabled")

    response = @docker.images.load_(body: Pathname(__FILE__))

    assert_pattern do
      response => nil
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.images.prune

    assert_pattern do
      response => DockerEngineRuby::Models::ImagePruneResponse
    end

    assert_pattern do
      response => {
        images_deleted: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::DeleteItem]) | nil,
        space_reclaimed: Integer | nil
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

  def test_push_required_params
    skip("Prism tests are disabled")

    response = @docker.images.push("name", x_registry_auth: "X-Registry-Auth")

    assert_pattern do
      response => nil
    end
  end

  def test_search_required_params
    skip("Prism tests are disabled")

    response = @docker.images.search(term: "term")

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Models::ImageSearchResponseItem])
    end
  end

  def test_tag
    skip("Prism tests are disabled")

    response = @docker.images.tag("name")

    assert_pattern do
      response => nil
    end
  end
end
