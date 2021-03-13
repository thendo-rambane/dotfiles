-- BASH
require'lspconfig'.bashls.setup{}

-- CSS
require'lspconfig'.cssls.setup{}

-- Docker
require'lspconfig'.dockerls.setup{}

-- RUST
require'lspconfig'.rls.setup{}
require'lspconfig'.rust_analyzer.setup{}

-- PYTHON
require'lspconfig'.pyright.setup{}

-- JSON
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- JS/TS
require'lspconfig'.tsserver.setup{}

-- HTML
local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = htmlCapabilities,
}


require'lspconfig'.html.setup{}

-- General
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

-- VIM
require'lspconfig'.vimls.setup{}

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


