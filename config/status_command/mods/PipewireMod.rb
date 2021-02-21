class PipewireMod < StatusMod
  def render
    return `pamixer --get-volume-human`.strip!
  end
end
