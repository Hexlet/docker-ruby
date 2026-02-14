# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::NodesTest < DockerEngine::Test::ResourceTest
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
      response => ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Node])
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
      response => DockerEngine::Node
    end

    assert_pattern do
      response => {
        created_at: String | nil,
        description: DockerEngine::Node::Description | nil,
        id: String | nil,
        manager_status: DockerEngine::Node::ManagerStatus | nil,
        spec: DockerEngine::Spec | nil,
        status: DockerEngine::Node::Status | nil,
        updated_at: String | nil,
        version: DockerEngine::Node::Version | nil
      }
    end
  end
end
