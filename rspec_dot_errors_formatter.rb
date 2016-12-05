
#require 'stringio' # else Munemo complains...


class DotErrorsFormatter

  RSpec::Core::Formatters.register self, :dump_failures

  def initialize(output)

    @output = output
  end

  def dump_failures(notification)

    notification.failure_notifications.each do |fn|

      fn.formatted_backtrace.each do |l|

        if m = l.match(/\A([^:]+_spec\.rb:\d+)/)
          @output << m[1] << "\n"
          break
        end
      end

      #@output << "  +--> " << fn.description << "\n"
    end
  end
end

