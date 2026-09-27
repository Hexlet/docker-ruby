# typed: strong

module DockerEngineRuby
  module Helpers
    module BuildkitStatus
      TRACE_ID = T.let("moby.buildkit.trace", String)

      class Vertex < Struct
        extend T::Generic

        Elem = type_member { { fixed: T.anything } }

        sig { returns(T.nilable(String)) }
        def digest; end

        sig { returns(T.nilable(String)) }
        def name; end

        sig { returns(T::Boolean) }
        def cached; end

        sig { returns(T::Boolean) }
        def started; end

        sig { returns(T::Boolean) }
        def completed; end

        sig { returns(T.nilable(String)) }
        def error; end
      end

      class Log < Struct
        extend T::Generic

        Elem = type_member { { fixed: T.anything } }

        sig { returns(T.nilable(String)) }
        def vertex; end

        sig { returns(Integer) }
        def stream; end

        sig { returns(String) }
        def msg; end
      end

      class Status < Struct
        extend T::Generic

        Elem = type_member { { fixed: T.anything } }

        sig { returns(T::Array[DockerEngineRuby::Helpers::BuildkitStatus::Vertex]) }
        def vertexes; end

        sig { returns(T::Array[DockerEngineRuby::Helpers::BuildkitStatus::Log]) }
        def logs; end
      end

      class << self
        sig { params(info: DockerEngineRuby::Models::BuildInfo).returns(T::Boolean) }
        def trace?(info); end

        sig { params(aux: String).returns(DockerEngineRuby::Helpers::BuildkitStatus::Status) }
        def decode(aux); end
      end

      class PlainPrinter
        sig { params(out: T.proc.params(line: String).void).void }
        def initialize(&out); end

        sig { params(status: DockerEngineRuby::Helpers::BuildkitStatus::Status).void }
        def print(status); end
      end
    end
  end
end
