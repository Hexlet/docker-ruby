# frozen_string_literal: true

require_relative "../test_helper"

class Docker::Test::Resources::AuthTest < Docker::Test::ResourceTest
  def test_login
    skip("Prism tests are disabled")

    response = @docker.auth.login

    assert_pattern do
      response => Docker::AuthResponse
    end

    assert_pattern do
      response => {
        status: String,
        identity_token: String | nil
      }
    end
  end
end
