# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngine::Test::Resources::DistributionTest < DockerEngine::Test::ResourceTest
  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.distribution.inspect_("name")

    assert_pattern do
      response => DockerEngine::Inspect
    end

    assert_pattern do
      response => {
        descriptor: DockerEngine::Inspect::Descriptor,
        platforms: ^(DockerEngine::Internal::Type::ArrayOf[DockerEngine::Inspect::Platform, nil?: true])
      }
    end
  end
end
