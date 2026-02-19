return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'windwp/nvim-ts-autotag',
        },
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = { 'TSInstallInfo', 'TSInstall' },
        config = function()
            local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
            if not status_ok then
                return
            end
            treesitter.setup({
                ensure_installed = {
                    'lua',
                    'vim',
                    'python',
                    'markdown_inline',
                    'rust',
                    'javascript',
                    'typescript',
                    'tsx',
                    'yaml',
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = {
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}