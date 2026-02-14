# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::SecretsTest < DockerEngineAPI::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @docker.secrets.create

    assert_pattern do
      response => DockerEngineAPI::Models::SecretCreateResponse
    end

    assert_pattern do
      response => {
        id: String
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.secrets.update("id", version: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.secrets.list

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Secret])
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
      response => DockerEngineAPI::Secret
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        id: String | nil,
        spec: DockerEngineAPI::Spec | nil,
        updated_at: String | nil,
        version: DockerEngineAPI::Secret::Version | nil
      }
    end
  end
end
