function watch-vrv
  mpv --ytdl-raw-options-append=n='' --ytdl-raw-options-append=format='bestvideo[format_id!*=hardsub]+bestaudio[format_id!*=hardsub]' $argv
end

function next-vrv
  watch-vrv (wl-paste)
end
