function fish_greeting --description "Greeting that runs whenever a new shell is started"
  set fish_pager_color_description red
  
  fortune | cowsay
end
