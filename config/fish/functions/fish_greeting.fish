function fish_greeting --description "Greeting that runs whenever a new shell is started"
  #set_monokai_colors
  #set_wayland on
  #fortune | cowsay
  source ("/usr/bin/starship" init fish --print-full-init | psub)
end
