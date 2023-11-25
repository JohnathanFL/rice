

addVimBinds {
  {"n", "q", "b"},
  {"v", "q", "b"},
  {"n", "b", t":JABSOpen<CR>"},
  {"n", "#", t"<Plug>kommentary_line_default"},

  -- For BarBar
  --[[ {"n", "<A-a>", t":BufferPrevious<CR>"},
  {"n", "<A-d>", t":BufferNext<CR>"},
  {"n", "<A-A>", t":BufferMovePrevious<CR>"},
  {"n", "<A-D>", t":BufferMoveNext<CR>"},
  {"n", "<A-w>", t":BufferClose<CR>"},
  {"n", "<C-b>", t":BufferPick<CR>"}, ]]

  {"n", "<A-a>", t":bp<CR>"},
  {"n", "<A-d>", t":bn<CR>"},
  {"n", "<A-A>", t":tabMovePrev<CR>"},
  {"n", "<A-D>", t":tabMoveNext<CR>"},
  {"n", "<A-w>", t":bd<CR>"},
  {"n", "<C-b>", t":BufferLinePick<CR>"},
  {"n", "<A-f>", t":lua vim.lsp.buf.format()<CR>"},

  {"n", "bd", t":bd<CR>"},
  {"n", "go", t":SymbolsOutline<CR>"},
  {"n", "gd", t":lua vim.lsp.buf.definition()<CR>"},
  { "n", "<C-/>", '', {
    callback = function()
      require('telescope.builtin').builtin()
    end
  } },
  { "n", "<C-p>", '', {
    callback = function()
      require('telescope.builtin').fd({
        no_ignore = false,
        no_ignore_parent = false
      })
    end
  } },
  { "n", "<C-S-/>", '', {
    callback = function()
      require('telescope.builtin').live_grep({
        no_ignore = false,
        no_ignore_parent = false
      })
    end
  } },
  { "n", "<C-.>", '', {
    callback = function()
      require('telescope.builtin').quickfix()
    end
  } },
}

vim.cmd [[xmap ga <Plug>(EasyAlign)]]
