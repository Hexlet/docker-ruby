# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::PluginsTest < DockerEngineAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.plugins.create(name: "name", body: Pathname(__FILE__))

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @docker.plugins.list

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Plugin])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @docker.plugins.delete("name")

    assert_pattern do
      response => DockerEngineAPI::Plugin
    end

    assert_pattern do
      response => {
        config: DockerEngineAPI::Plugin::Config,
        enabled: DockerEngineAPI::Internal::Type::Boolean,
        name: String,
        settings: DockerEngineAPI::Plugin::Settings,
        id: String | nil,
        plugin_reference: String | nil
      }
    end
  end

  def test_disable
    skip("Prism tests are disabled")

    response = @docker.plugins.disable("name")

    assert_pattern do
      response => nil
    end
  end

  def test_enable
    skip("Prism tests are disabled")

    response = @docker.plugins.enable("name")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.plugins.inspect_("name")

    assert_pattern do
      response => DockerEngineAPI::Plugin
    end

    assert_pattern do
      response => {
        config: DockerEngineAPI::Plugin::Config,
        enabled: DockerEngineAPI::Internal::Type::Boolean,
        name: String,
        settings: DockerEngineAPI::Plugin::Settings,
        id: String | nil,
        plugin_reference: String | nil
      }
    end
  end

  def test_privileges_required_params
    skip("Prism tests are disabled")

    response = @docker.plugins.privileges(remote: "remote")

    assert_pattern do
      response => ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Privilege])
    end
  end

  def test_pull_required_params
    skip("Prism tests are disabled")

    response = @docker.plugins.pull(remote: "remote")

    assert_pattern do
      response => nil
    end
  end

  def test_push
    skip("Prism tests are disabled")

    response = @docker.plugins.push("name")

    assert_pattern do
      response => nil
    end
  end

  def test_set
    skip("Prism tests are disabled")

    response = @docker.plugins.set("name")

    assert_pattern do
      response => nil
    end
  end

  def test_upgrade_required_params
    skip("Prism tests are disabled")

    response = @docker.plugins.upgrade("name", remote: "remote")

    assert_pattern do
      response => nil
    end
  end
end
