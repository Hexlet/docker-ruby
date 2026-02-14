# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#top
    class TopResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute processes
      #   Each process running in the container, where each process is an array of values
      #   corresponding to the titles.
      #
      #   @return [Array<Array<String>>, nil]
      optional :processes,
               DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::ArrayOf[String]],
               api_name: :Processes

      # @!attribute titles
      #   The ps column titles
      #
      #   @return [Array<String>, nil]
      optional :titles, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Titles

      # @!method initialize(processes: nil, titles: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::TopResponse} for more details.
      #
      #   Container "top" response.
      #
      #   @param processes [Array<Array<String>>] Each process running in the container, where each process
      #
      #   @param titles [Array<String>] The ps column titles
    end
  end
end
