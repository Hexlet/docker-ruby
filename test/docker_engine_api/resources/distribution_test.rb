# frozen_string_literal: true

require_relative "../test_helper"

class DockerEngineAPI::Test::Resources::DistributionTest < DockerEngineAPI::Test::ResourceTest
  def test_inspect_
    skip("Prism tests are disabled")

    response = @docker.distribution.inspect_("name")

    assert_pattern do
      response => DockerEngineAPI::Inspect
    end

    assert_pattern do
      response => {
        descriptor: DockerEngineAPI::Inspect::Descriptor,
        platforms: ^(DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Inspect::Platform, nil?: true])
      }
    end
  end
end
