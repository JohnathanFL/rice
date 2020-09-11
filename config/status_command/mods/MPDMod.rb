class MPDMod < StatusMod
  require "ruby-mpd"
  def initialize
    @mpd = MPD.new 'localhost', 6600, {callbacks: true}
    @mpd.connect
    @mpd.on :state do
      update
    end
    # Note: on :song will be a constant stream of events, I'm guessing because of pointer
    # comparisons?
    @mpd.on :songid do
      update
    end
    # Not terribly elegant, but it handles restarting the connection
    @mpd.on :connection do |conn|
      if !conn
        while true
          begin
            sleep 1
            # puts "HERE"
            @mpd.reconnect
            update
            break
          rescue
            retry
          end
        end
      end
    end
  end
  def cleanup
    @mpd.disconnect
  end
  def render
    status = @mpd.status
    case status[:state]
      when :stop
        return "⏹"
      when :play, :pause
        cur = @mpd.current_song
        icon = case status[:state]
          when :play
            "▶"
          when :pause
            "⏸"
        end
        return "#{icon} #{cur.artist} - #{cur.title}"
    end
  end
end
