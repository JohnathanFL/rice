-- vim.cmd [[colorscheme nord]]
require "utils"
require "plugins"
require "keybinds"

addVimOpts {
  o = {
    termguicolors = true,
    completeopt = 'menuone,noselect,preview',
    expandtab = true,
    tabstop = 2,
    shiftwidth = 2,
    nu = true,
    inccommand = 'nosplit',
    hidden = true,
    clipboard = 'unnamedplus',
  },
  g = {
    completion_enable_auto_popup = 1,
  }
}
vim.cmd [[ autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp ]]

