vim.cmd [[packadd packer.nvim]]

local startup = require("packer").startup

return startup(function(use)
  use({ 'saimo/peek.nvim', run = 'deno task --quiet build:fast' })
  use 'nvim-treesitter/nvim-treesitter'

  use 'NoahTheDuke/vim-just'
  use 'lifepillar/pgsql.vim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'm00qek/baleia.nvim'
  use 'will133/vim-dirdiff'
  use 'vito-c/jq.vim'
  use 'twh2898/vim-mdbook'
  use 'lambdalisue/suda.vim'
  use 'khaveesh/vim-fish-syntax'
  use 'wbthomason/packer.nvim'
  use 'junegunn/vim-easy-align'
  -- use 'nanotee/sqls.nvim'
  use {
    'neovim/nvim-lspconfig',
    config = function() require 'setup-lsp' end,
  }
  -- use 'ionide/Ionide-vim'

  --[[ use { 'hrsh7th/nvim-cmp', after = 'nvim-lspconfig' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', config = function() require 'setup-cmp' end, } ]]

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
  })

  use 'tpope/vim-sensible'
  use 'b3nj5m1n/kommentary'

  use 'vim-crystal/vim-crystal'


  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'kyazdani42/nvim-web-devicons'
  use 'arcticicestudio/nord-vim'
  use 'simrat39/symbols-outline.nvim'

  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'ojroques/nvim-hardline',
    config = function()
      require('hardline').setup {
        bufferline = true,
        bufferline_settings = {
          show_index = true,
        }
      }
    end
  }

  use 'alaviss/nim.nvim'
  use 'ziglang/zig.vim'
end)
