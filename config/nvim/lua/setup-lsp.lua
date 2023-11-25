local lsp = require 'lspconfig'
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local langs = {
  rust_analyzer = {
    on_attach = on_attach,
    cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer', },
  },
  nimls = {
    on_attach = on_attach,
  },
  zls = {
    on_attach = on_attach,
  },
  crystalline = {
    on_attach = on_attach,
    cmd = { 'crystalline' },
  },
  fsautocomplete = {
    on_attach = on_attach,
  },
  elixirls = {
    on_attach = on_attach,
  },
  cssls = {
    on_attach = on_attach,
    cmd = { 'vscode-css-language-server', '--stdio' },
  },
  serve_d = {
    on_attach = on_attach,
  },
  ccls = {
    on_attach = on_attach,
  },
  yamlls = { on_attach = on_attach },
  jsonls = { on_attach = on_attach }, 
  solargraph = { on_attach = on_attach, },
  marksman = { on_attach = on_attach, },
  tsserver = {
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
          debug = false,
          disable_commands = false,
          enable_import_on_completion = true,
          import_on_completion_timeout = 5000,

          -- eslint
          eslint_enable_code_actions = true,
          eslint_bin = "eslint",
          eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
          eslint_enable_disable_comments = true,

          --xperimental settings!
          -- eslint diagnostics
          eslint_enable_diagnostics = true,
          eslint_diagnostics_debounce = 250,

          -- formatting
          enable_formatting = true,
          formatter = "prettier",
          formatter_args = {"--stdin-filepath", "$FILENAME"},
          format_on_save = true,
          no_save_after_format = false,

          -- parentheses completion
          complete_parens = true,
          signature_help_in_parens = true,

          -- update imports on file move
          update_imports_on_move = true,
          require_confirmation_on_move = true,
          watch_dir = "/src",
        }

        -- required to enable ESLint code actions and formatting
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
    end
}
  --[[ sqls = {
    on_attach = function(client, bufnr)
      require('sqls').on_attach(client, bufnr)
    end,
    setup = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=/tmp/c46-pg/ user=c4 dbname=c4'
        }
      },
    },
  }, ]]
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

for lang, opts in pairs(langs) do
  lsp[lang].setup(tableMerge(opts, { capabilities = capabilities }))
end
