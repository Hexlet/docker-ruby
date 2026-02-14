# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::NodesTest < DockerEngineAPI::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.nodes.update("id", version: 0)

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.nodes.list

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Node])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.nodes.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.nodes.inspect_("id")

    assert_pattern do
      response => DockerEngineAPI::Node
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        description: DockerEngineAPI::Node::Description | nil,
        id: String | nil,
        manager_status: DockerEngineAPI::Node::ManagerStatus | nil,
        spec: DockerEngineAPI::Spec | nil,
        status: DockerEngineAPI::Node::Status | nil,
        updated_at: String | nil,
        version: DockerEngineAPI::Node::Version | nil
      }
    end
  end
end
