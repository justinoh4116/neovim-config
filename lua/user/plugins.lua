local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)



    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use {"ms-jpq/coq_nvim", branch = "coq"}
    use {"ms-jpq/coq.artifacts", branch = "artifacts"}

    use "lukas-reineke/indent-blankline.nvim"

    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    use {
        'NTBBloodbath/doom-one.nvim',
        config = function()
            require('doom-one').setup({
                cursor_coloring = false,
                terminal_colors = false,
                italic_comments = true,
                enable_treesitter = true,
                transparent_background = false,
                pumblend = {
                    enable = true,
                    transparency_amount = 20,
                },
                plugins_integrations = {
                    neorg = true,
                    barbar = true,
                    bufferline = false,
                    gitgutter = false,
                    gitsigns = true,
                    telescope = true,
                    neogit = true,
                    nvim_tree = true,

                    dashboard = true,
                    startify = true,
                    whichkey = true,
                    indent_blankline = true,
                    vim_illuminate = true,

                    lspsaga = false,
                },
            })
        end,
    }
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use "williamboman/nvim-lsp-installer"
    use "tamago324/nlsp-settings.nvim"
    use "simrat39/rust-tools.nvim"


    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- use "jiangmiao/auto-pairs"
    -- use 'goukiwi/vim-smartpairs'

    use "kyazdani42/nvim-web-devicons"

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
  

    use "lewis6991/gitsigns.nvim"
    use {
        "norcalli/nvim-colorizer.lua",
    }
    use 'sunjon/Shade.nvim' 

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'mattn/emmet-vim'

--     use 'kevinhwang91/promise-async'
--     use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.textDocument.foldingRange = {
--         dynamicRegistration = false,
--         lineFoldingOnly = true
--     }
--     local language_servers = {} -- like {'gopls', 'clangd'}
--     for _, ls in ipairs(language_servers) do
--         require('lspconfig')[ls].setup({
--             capabilities = capabilities
--         })
--       end
--       require('ufo').setup()








  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
