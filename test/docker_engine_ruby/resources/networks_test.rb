# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::NetworksTest < DockerEngineRuby::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.create(name: "Name")

    assert_pattern do
      response => DockerEngineRuby::NetworkCreateResponse
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
      response => ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::NetworkSummary])
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

    response = @docker.networks.connect("id", container: "Container")

    assert_pattern do
      response => nil
    end
  end

  def test_disconnect_required_params
    skip("Prism tests are disabled")

    response = @docker.networks.disconnect("id", container: "Container")

    assert_pattern do
      response => nil
    end
  end

  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.networks.inspect_("id")

    assert_pattern do
      response => DockerEngineRuby::Models::NetworkInspectResponse
    end

    assert_pattern do
      response => {
        attachable: DockerEngineRuby::Internal::Type::Boolean | nil,
        config_from: DockerEngineRuby::Models::NetworkInspectResponse::ConfigFrom | nil,
        config_only: DockerEngineRuby::Internal::Type::Boolean | nil,
        created: Time | nil,
        driver: String | nil,
        enable_i_pv4: DockerEngineRuby::Internal::Type::Boolean | nil,
        enable_i_pv6: DockerEngineRuby::Internal::Type::Boolean | nil,
        id: String | nil,
        ingress: DockerEngineRuby::Internal::Type::Boolean | nil,
        internal: DockerEngineRuby::Internal::Type::Boolean | nil,
        ipam: DockerEngineRuby::Models::NetworkInspectResponse::Ipam | nil,
        labels: ^(DockerEngineRuby::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        options: ^(DockerEngineRuby::Internal::Type::HashOf[String]) | nil,
        peers: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Models::NetworkInspectResponse::Peer]) | nil,
        scope: String | nil
      }
    end
  end

  def test_prune
    skip("Prism tests are disabled")

    response = @docker.networks.prune

    assert_pattern do
      response => DockerEngineRuby::Models::NetworkPruneResponse
    end

    assert_pattern do
      response => {
        networks_deleted: ^(DockerEngineRuby::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
