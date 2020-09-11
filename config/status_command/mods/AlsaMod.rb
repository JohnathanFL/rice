# TODO: At this point, let's just write our own alsa control library
# For now, we depend on the vol ruby script
class AlsaMod < StatusMod
  # TODO
  # require "ffi"
  # module AlsaLib
  #   extend FFI::Library
  #   ffi_lib 'asound'
  # end
  load File.expand_path(File.dirname(__FILE__) + '/vol')
  def render
    return getVol :pretty
  end
end
