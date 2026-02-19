return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {},
                rust_analyzer = {},
                lua_ls = {},
                jsonls = {},
                html = {},
                tailwindcss = {},
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    }
}
