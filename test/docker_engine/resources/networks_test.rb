# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::NetworksTest < DockerEngine::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.create(name: "my_network")

    assert_pattern do
      response => DockerEngine::Models::NetworkCreateResponse
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

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.networks.inspect_("id")

    assert_pattern do
      response => DockerEngine::Models::NetworkInspectResponse
    end
  end
end
