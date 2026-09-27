# frozen_string_literal: true

require_relative "../test_helper"
require_relative "buildkit_trace_fixture"

class DockerEngineRuby::Test::BuildkitStatusTest < Minitest::Test
  def test_plain_printer_renders_steps_logs_and_errors
    lines = []
    printer = DockerEngineRuby::Helpers::BuildkitStatus::PlainPrinter.new { lines << _1 }
    BUILDKIT_TRACE.each { printer.print(DockerEngineRuby::Helpers::BuildkitStatus.decode(_1)) }

    assert_includes(lines.join("\n"), "[2/3] RUN echo line-one && echo line-two")
    assert(lines.any? { _1.end_with?(" line-one") })
    assert(lines.any? { _1.end_with?(" line-two") })
    assert(
      lines.any? do
        _1.include?(%(ERROR: process "/bin/sh -c exit 3" did not complete successfully: exit code: 3))
      end
    )
  end
end
