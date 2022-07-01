local configs = require("nvim-treesitter.configs")
configs.setup {
    -- ensure_installed = "cpp, rust, php, html, css, javascript, java, lua, json, python, typescript",
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" }, -- list languages to disable higlighting
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
