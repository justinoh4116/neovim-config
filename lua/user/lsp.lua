-- require 'lspconfig'.intelephense.setup{}
-- require 'lspconfig'.html.setup{}
-- require 'lspconfig'.tsserver.setup{}
require("nvim-lsp-installer").setup {
    automatic_installation = true
}

local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.clangd.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.jsonls.setup {}
lspconfig.tsserver.setup {}
lspconfig.intelephense.setup {}
lspconfig.html.setup {}
