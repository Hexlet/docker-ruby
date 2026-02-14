# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::ConfigsTest < DockerEngine::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @docker.configs.create

    assert_pattern do
      response => DockerEngine::Models::ConfigCreateResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.configs.update("id", version: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.configs.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Config])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.configs.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.configs.inspect_("id")

    assert_pattern do
      response => DockerEngine::Config
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        id: String | nil,
        spec: DockerEngine::Spec | nil,
        updated_at: String | nil,
        version: DockerEngine::Config::Version | nil
      }
    end
  end
end
