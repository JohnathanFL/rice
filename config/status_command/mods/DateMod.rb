class DateMod < StatusMod
  # require "process"
  def initialize
    # Make sure we wake up once a minute to update the clock
    @sleeper = Thread.new do
      while true
        # > 60 to make sure we're in the new minute
        remSecs = 61 - Time.new.sec
        sleep remSecs
        update
      end
    end
  end
  def render
    time = Time.new
    return time.strftime "%a %Y/%m/%d (w%W)  %H:%M"
  end
end
