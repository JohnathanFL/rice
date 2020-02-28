# Migrated from xiong-chiamiov-plus in oh-my-zsh
# Git still WIP

function fish_prompt
  set stat $status
  set promptColor blue
  set userColor green
  set hostColor cyan
  set pathColor $fish_color_cwd
  set dateColor yellow
  set dollarColor magenta


  echo # Make sure we don't get rid of the old line
  echo -n (set_color $promptColor)'┌─['
  echo -n (set_color $userColor)$USER' '
  echo -n (set_color $hostColor)(prompt_hostname)
  echo -n (set_color $promptColor)']' '['
  echo -n (set_color $pathColor)(pwd)
  echo -n (set_color $promptColor)'] - ['
  echo -n (set_color $dateColor)(date)
  echo (set_color $promptColor)']'
  echo -n '└─['
  echo -n (set_color $dollarColor)'$'(set_color $promptColor)'] '
  echo -n (fish_git_prompt)' '
end
