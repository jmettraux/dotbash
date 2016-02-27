
require 'stringio' # else Munemo complains...


class DotErrorFormatter

  RSpec::Core::Formatters.register self, :dump_failures

  def initialize(output)

    @output = output
  end

  def dump_failures(notification)

    notification.failure_notifications.each do |fn|
      m = fn.formatted_backtrace.first.match(/\A([^:]+:\d+):in /)
      @output << m[1] << "\n"
      #@output << "  +--> " << fn.description << "\n"
    end
  end
end

