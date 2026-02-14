# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::NetworksTest < DockerEngine::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.create(name: "my_network")

    assert_pattern do
      response => DockerEngine::CreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        warning: String
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.networks.list

    assert_pattern do
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.networks.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_connect_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.connect("id", container: "3613f73ba0e4")

    assert_pattern do
      response => nil
    end
  end

  def test_disconnect_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.disconnect("id", container: "3613f73ba0e4")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.networks.inspect_("id")

    assert_pattern do
      response => DockerEngine::Models::NetworkInspectResponse
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.networks.prune

    assert_pattern do
      response => DockerEngine::Models::NetworkPruneResponse
    end

    assert_pattern do
      response => {
        networks_deleted: ^(DockerEngine::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
