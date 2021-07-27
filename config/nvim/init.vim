
call plug#begin('~/.vim/plugged')
  Plug 'hrsh7th/nvim-compe'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'tpope/vim-sensible'
  Plug 'b3nj5m1n/kommentary'

  Plug 'ziglang/zig.vim'

  Plug 'windwp/nvim-autopairs'

  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'akinsho/nvim-bufferline.lua'

  " Plug 'matbme/JABS.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'srcery-colors/srcery-vim'
call plug#end()

set completeopt=menuone,noselect
set expandtab
set tabstop=2
set shiftwidth=2
set nu
set inccommand=nosplit
set hidden
colorscheme srcery


lua <<EOF

vim.opt.termguicolors = true

require('nvim-autopairs').setup()

local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('completion').on_attach()
    end

local servers = {'zls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
    }
end

vim.o.completeopt = "menuone,noinsert,noselect";

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF
let g:completion_enable_auto_popup = 1

nnoremap q b
vnoremap q b
nnoremap b :JABSOpen <Return>
nnoremap gd :lua vim.lsp.buf.definition() <Return>

" ########################################################################### "
" BarBar stuff "
" ########################################################################### "
" Move to previous/next
nnoremap <silent>    <A-a> :BufferPrevious<CR>
nnoremap <silent>    <A-d> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-A> :BufferMovePrevious<CR>
nnoremap <silent>    <A-D> :BufferMoveNext<CR>
nnoremap <silent>    <A-Q> :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-b>    :BufferPick<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
