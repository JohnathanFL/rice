vim.cmd [[packadd packer.nvim]]

local startup = require("packer").startup

return startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'junegunn/vim-easy-align'
  use {
    'neovim/nvim-lspconfig',
    config = function() require 'setup-lsp' end,
  }
  -- use 'ionide/Ionide-vim'

  --[[ use { 'hrsh7th/nvim-cmp', after = 'nvim-lspconfig' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', config = function() require 'setup-cmp' end, } ]]

  use { 
    'hrsh7th/nvim-compe',
    after = 'nvim-lspconfig',
    config = function() require 'setup-compe' end,
  }

  use { 'ms-jpq/chadtree', branch = 'chad' }

  use 'tpope/vim-sensible'
  use 'b3nj5m1n/kommentary'

  use 'vim-crystal/vim-crystal'


  use 'windwp/nvim-autopairs'
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
