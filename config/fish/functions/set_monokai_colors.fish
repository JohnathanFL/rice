function set_monokai_colors -d "Set the colors for all fish stuff to a palette for monokai"
  # Normal text color
  set -U fish_color_normal white
  
  # the color for commands
  set -U fish_color_command green
  
  # the color for quoted blocks of text
  set -U fish_color_quote magenta
  
  # the color for IO redirections
  set -U fish_color_redirection white
  
  # the color for process separators like ';' and '&'
  set -U fish_color_end blue
  
  # the color used to highlight potential errors
  set -U fish_color_error red
  
  # the color for regular command parameters
  set -U fish_color_param white
  
  # the color used for code comments
  set -U fish_color_comment brblack
  
  # the color used to highlight matching parenthesis
  set -U fish_color_match blue

  # the color used when selecting text (in vi visual mode)
  set -U fish_color_selection brblack
  
  # used to highlight history search matches and the selected pager item (must be a background)
  set -U fish_color_search_match --background=49483E 
  
  # the color for parameter expansion operators like '*' and '~'
  set -U fish_color_operator magenta
  
  # the color used to highlight character escapes like '\n' and '\x70'
  set -U fish_color_escape red
  
  # the color used for the current working directory in the default prompt
  set -U fish_color_cwd red
  
  # the color used for autosuggestions
  set -U fish_color_autosuggestion brblack
  
  # the color used to print the current username in some of fish default prompts
  set -U fish_color_user brgreen
  
  # the color used to print the current host system in some of fish default prompts
  set -U fish_color_host brcyan
  
  # the color used to print the current host system in some of fish default prompts, if fish is running remotely (via ssh or similar)
  set -U fish_color_host_remote brred
  
  # the color for the '^C' indicator on a canceled command
  set -U fish_color_cancel -n


  
  # Additionally, the following variables are available to change the highlighting in the completion pager:


  # the color of the progress bar at the bottom left corner
  ##set -U fish_pager_color_progress blue
  
  # the background color of a line
  ##set -U fish_pager_color_background brblack
  
  # the color of the prefix string, i.e. the string that is to be completed
  ##set -U fish_pager_color_prefix white
  
  # the color of the completion itself
  ##set -U fish_pager_color_completion brwhite
  
  # the color of the completion description
  set -U fish_pager_color_description red
  
  # fish_pager_color_background of every second unselected completion.
  # Defaults to fish_pager_color_background
  ##set -U fish_pager_color_secondary_background 
  
  # fish_pager_color_prefix of every second unselected completion.
  # Defaults to fish_pager_color_prefix
  ##set -U fish_pager_color_secondary_prefix
  
  # fish_pager_color_completion of every second unselected completion.
  # Defaults to fish_pager_color_completion
  ##set -U fish_pager_color_secondary_completion
 
  # fish_pager_color_description of every second unselected completion.
  # Defaults to fish_pager_color_description
  ##set -U fish_pager_color_secondary_description
  
  # fish_pager_color_background of the selected completion.
  # Defaults to fish_color_search_match
  ##set -U fish_pager_color_selected_background blue -b green
  
  # fish_pager_color_prefix of the selected completion.
  # Defaults to fish_pager_color_prefix
  ##set -U fish_pager_color_selected_prefix
  
  # fish_pager_color_completion of the selected completion.
  # Defaults to fish_pager_color_completion
  ##set -U fish_pager_color_selected_completion
  
  # fish_pager_color_description of the selected completion.
  # Defaults to fish_pager_color_description
  ##set -U fish_pager_color_selected_description
end
