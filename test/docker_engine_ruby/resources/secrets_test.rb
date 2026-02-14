# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::SecretsTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.secrets.create(spec: {})

    assert_pattern do
      response => DockerEngineRuby::Models::SecretCreateResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.secrets.update("id", version: 0, spec: {})

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.secrets.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Secret])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.secrets.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.secrets.inspect_("id")

    assert_pattern do
      response => DockerEngineRuby::Secret
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        id: String | nil,
        spec: DockerEngineRuby::SecretSpec | nil,
        updated_at: Time | nil,
        version: DockerEngineRuby::Secret::Version | nil
      }
    end
  end
end
