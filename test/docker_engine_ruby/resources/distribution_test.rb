# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineRuby::Test::Resources::DistributionTest < DockerEngineRuby::Test::ResourceTest
  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.distribution.inspect_("name")

    assert_pattern do
      response => DockerEngineRuby::Inspect
    end

    assert_pattern do
      response => {
        descriptor: DockerEngineRuby::Inspect::Descriptor,
        platforms: ^(DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Inspect::Platform])
      }
    end
  end
end
