# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::NodesTest < DockerEngineRuby::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response = @docker.nodes.update("id", version: 0, spec: {})

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.nodes.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Node])
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
      response => DockerEngineRuby::Node
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        description: DockerEngineRuby::Node::Description | nil,
        id: String | nil,
        manager_status: DockerEngineRuby::Node::ManagerStatus | nil,
        spec: DockerEngineRuby::NodeSpec | nil,
        status: DockerEngineRuby::Node::Status | nil,
        updated_at: Time | nil,
        version: DockerEngineRuby::Node::Version | nil
      }
    end
  end
end
