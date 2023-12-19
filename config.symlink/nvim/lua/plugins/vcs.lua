return {
    { -- Lazygit integration
        'kdheepak/lazygit.nvim',
        -- optional for floating window border decoration
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            {
                '<leader>gg',
                '<cmd>LazyGit<cr>',
                desc = 'Open lazygit'
            },
        },
    },
    { -- Git helpers
        'tpope/vim-fugitive',
        event = 'VimEnter',
    },
}
