# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::ConfigsTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @docker.configs.create(spec: {})

    assert_pattern do
      response => DockerEngineRuby::Models::ConfigCreateResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @docker.configs.update("id", version: 0, spec: {})

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @docker.configs.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ConfigObject])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @docker.configs.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Mock server tests are disabled")

    response = @docker.configs.inspect_("id")

    assert_pattern do
      response => DockerEngineRuby::ConfigObject
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        id: String | nil,
        spec: DockerEngineRuby::ConfigSpec | nil,
        updated_at: Time | nil,
        version: DockerEngineRuby::ConfigObject::Version | nil
      }
    end
  end
end
