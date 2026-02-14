# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#wait
    class WaitResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute status_code
      #   Exit code of the container
      #
      #   @return [Integer]
      required :status_code, Integer, api_name: :StatusCode

      # @!attribute error
      #   container waiting error, if any
      #
      #   @return [DockerEngineAPI::Models::WaitResponse::Error, nil]
      optional :error, -> { DockerEngineAPI::WaitResponse::Error }, api_name: :Error

      # @!method initialize(status_code:, error: nil)
      #   OK response to ContainerWait operation
      #
      #   @param status_code [Integer] Exit code of the container
      #
      #   @param error [DockerEngineAPI::Models::WaitResponse::Error] container waiting error, if any

      # @see DockerEngineAPI::Models::WaitResponse#error
      class Error < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute message
        #   Details of an error
        #
        #   @return [String, nil]
        optional :message, String, api_name: :Message

        # @!method initialize(message: nil)
        #   container waiting error, if any
        #
        #   @param message [String] Details of an error
      end
    end
  end
end
