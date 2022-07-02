require "user.options"
require "user.keymaps"
require "user.plugins"
local nvim_lsp = require('lspconfig')
require("rust-tools").setup({})
require "user.indent_blankline"
require "user.lualine"
require 'user.lsp'
require 'colorizer'.setup()
require 'user.treesitter'
require 'user.coq'
require 'user.autopairs'

-- nvim_lsp.rust_analyzer.setup {
--   settings = {
--     ["rust-analyzer"] = {
--       workspace = {
--         symbol = {
--           search = {
--             kind = "all_symbols"
--           }
--         }
--       }
--     },
--   }
-- }

-- vim.g.coq_settings={
-- --     ["limits.completion_auto_timeout"] = 1,
--     ["auto_start"] = "shut-up"
-- }

vim.opt.listchars:append("eol:↴")
