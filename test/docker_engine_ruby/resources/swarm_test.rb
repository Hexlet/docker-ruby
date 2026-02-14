# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::SwarmTest < DockerEngineRuby::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.swarm.update(version: 0, spec: {})

    assert_pattern do
      response => nil
    end
  end

  def test_init
    skip("Prism tests are disabled")

    response = @docker.swarm.init

    assert_pattern do
      response => String
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.swarm.inspect_

    assert_pattern do
      response => DockerEngineRuby::SwarmAPI
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        data_path_port: Integer | nil,
        default_addr_pool: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil,
        id: String | nil,
        join_tokens: DockerEngineRuby::SwarmAPI::JoinTokens | nil,
        root_rotation_in_progress: DockerEngineRuby::Internal::Type::Boolean | nil,
        spec: DockerEngineRuby::Spec | nil,
        subnet_size: Integer | nil,
        tls_info: DockerEngineRuby::SwarmAPI::TlsInfo | nil,
        updated_at: Time | nil,
        version: DockerEngineRuby::SwarmAPI::Version | nil
      }
    end
  end

  def test_join
    skip("Prism tests are disabled")

    response = @docker.swarm.join

    assert_pattern do
      response => nil
    end
  end

  def test_leave
    skip("Prism tests are disabled")

    response = @docker.swarm.leave

    assert_pattern do
      response => nil
    end
  end

  def test_unlock
    skip("Prism tests are disabled")

    response = @docker.swarm.unlock

    assert_pattern do
      response => nil
    end
  end

  def test_unlock_key
    skip("Prism tests are disabled")

    response = @docker.swarm.unlock_key

    assert_pattern do
      response => DockerEngineRuby::Models::SwarmUnlockKeyResponse
    end

    assert_pattern do
      response => {
        unlock_key: String | nil
      }
    end
  end
end
