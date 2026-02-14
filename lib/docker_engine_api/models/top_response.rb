# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#top
    class TopResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute processes
      #   Each process running in the container, where each process is an array of values
      #   corresponding to the titles.
      #
      #   @return [Array<Array<String>>, nil]
      optional :processes,
               DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Internal::Type::ArrayOf[String]],
               api_name: :Processes

      # @!attribute titles
      #   The ps column titles
      #
      #   @return [Array<String>, nil]
      optional :titles, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Titles

      # @!method initialize(processes: nil, titles: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::TopResponse} for more details.
      #
      #   Container "top" response.
      #
      #   @param processes [Array<Array<String>>] Each process running in the container, where each process
      #
      #   @param titles [Array<String>] The ps column titles
    end
  end
end
