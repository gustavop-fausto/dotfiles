return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.config",
        opts = {
            ensure_installed = {
                "bash", "c", "diff", "html", "lua", "luadoc",
                "markdown", "markdown_inline", "vim", "vimdoc", "go", "java",
            },
            auto_install = true,
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
        },
    },
}

