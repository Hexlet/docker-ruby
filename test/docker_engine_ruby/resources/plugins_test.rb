# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::PluginsTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @docker.plugins.create(name: "name", body: Pathname(__FILE__))

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @docker.plugins.list

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @docker.plugins.delete("name")

    assert_pattern do
      response => DockerEngineRuby::Plugin
    end

    assert_pattern do
      response => {
        config: DockerEngineRuby::Plugin::Config,
        enabled: DockerEngineRuby::Internal::Type::Boolean,
        name: String,
        settings: DockerEngineRuby::Plugin::Settings,
        id: String | nil,
        plugin_reference: String | nil
      }
    end
  end

  def test_disable
    skip("Mock server tests are disabled")

    response = @docker.plugins.disable("name")

    assert_pattern do
      response => nil
    end
  end

  def test_enable
    skip("Mock server tests are disabled")

    response = @docker.plugins.enable("name")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Mock server tests are disabled")

    response = @docker.plugins.inspect_("name")

    assert_pattern do
      response => DockerEngineRuby::Plugin
    end

    assert_pattern do
      response => {
        config: DockerEngineRuby::Plugin::Config,
        enabled: DockerEngineRuby::Internal::Type::Boolean,
        name: String,
        settings: DockerEngineRuby::Plugin::Settings,
        id: String | nil,
        plugin_reference: String | nil
      }
    end
  end

  def test_privileges_required_params
    skip("Mock server tests are disabled")

    response = @docker.plugins.privileges(remote: "remote")

    assert_pattern do
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege])
    end
  end

  def test_pull_required_params
    skip("Mock server tests are disabled")

    response = @docker.plugins.pull(remote: "remote", body: [{}])

    assert_pattern do
      response => nil
    end
  end

  def test_push
    skip("Mock server tests are disabled")

    response = @docker.plugins.push("name")

    assert_pattern do
      response => nil
    end
  end

  def test_set_required_params
    skip("Mock server tests are disabled")

    response = @docker.plugins.set("name", body: ["string"])

    assert_pattern do
      response => nil
    end
  end

  def test_upgrade_required_params
    skip("Mock server tests are disabled")

    response = @docker.plugins.upgrade("name", remote: "remote", body: [{}])

    assert_pattern do
      response => nil
    end
  end
end
