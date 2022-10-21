alias e $EDITOR

set -x CGO_ENABLED 1

source ~/.asdf/asdf.fish
source ~/.asdf/completions/asdf.fish

# bun
set -Ux BUN_INSTALL "/home/drako/.bun"
fish_add_path "/home/drako/.bun/bin"

