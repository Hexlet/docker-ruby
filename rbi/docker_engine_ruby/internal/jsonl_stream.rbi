# typed: strong

module DockerEngineRuby
  module Internal
    class JSONLStream
      include Enumerable

      extend T::Generic

      Elem = type_member(:out)

      sig do
        params(
          model: T.anything,
          url: URI::Generic,
          status: Integer,
          headers: T::Hash[String, String],
          response: Net::HTTPResponse,
          unwrap: T.anything,
          stream: T::Enumerable[String]
        ).void
      end
      def initialize(
        model:,
        url:,
        status:,
        headers:,
        response:,
        unwrap:,
        stream:
      )
      end

      sig { override.params(blk: T.proc.params(message: Elem).void).void }
      def each(&blk)
      end
    end
  end
end
