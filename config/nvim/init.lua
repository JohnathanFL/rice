-- vim.cmd [[colorscheme nord]]
require "utils"
require "plugins"
require "setup-cmp"
require "keybinds"

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "query", "typescript", "tsx" },
  auto_install = true,

  autotag = {
    enable = true,
  }
}

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
vim.cmd [[
  let s:baleia = luaeval("require('baleia').setup { strip_ansi_codes = false }")
  command! BaleiaColorize call s:baleia.once(bufnr('%'))
]]

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
