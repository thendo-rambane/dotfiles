local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<F3>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('i', '<F3>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end
local util = require 'lspconfig/util'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}


-- BASH
require'lspconfig'.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- CSS
require'lspconfig'.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Docker
require'lspconfig'.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- RUST
require'lspconfig'.rls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
require'lspconfig'.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- PYTHON
require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
-- JSON
require'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- JS/TS
require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- HTML

require'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'html', 'htmldjango'}
}

require'lspconfig'.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- SQL
require'lspconfig'.sqlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"sql-language-server", "up", "--method", "stdio"};
}


-- VIM
require'lspconfig'.vimls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- VUE
require'lspconfig'.vuels.setup{
  on_attach = function(client)
    --[[
      Internal Vetur formatting is not supported out of the box

      This line below is required if you:
        - want to format using Nvim's native `vim.lsp.buf.formatting**()`
        - want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
    --]]
    client.resolved_capabilities.document_formatting = true
    on_attach(client)
  end,
  capabilities = capabilities,
  settings = {
    vetur = {
      completion = {
        autoImport = true,
        useScaffoldSnippets = true
      },
      format = {
        defaultFormatter = {
          html = "prettier",
          js = "prettier",
          ts = "prettier",
        }
      },
      validation = {
        template = true,
        script = true,
        style = true,
        templateProps = true,
        interpolation = true
      },
      experimental = {
        templateInterpolationService = false
      }
    }
  },
  root_dir = util.root_pattern("header.php", "package.json", "style.css", 'webpack.config.js')
}

-- LUA
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
USER = vim.fn.expand('$USER')
LANG_SERV_DIR = "/home/"..USER.."/dotfiles/".."nvim".."/language-servers"
local sumneko_root_path = LANG_SERV_DIR.."/lua"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path.."/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
