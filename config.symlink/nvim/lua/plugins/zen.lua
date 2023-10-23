return {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    opts = {
        tmux = { enabled = true }, -- disables the tmux statusline
        kitty = {
            enabled = true,
            font = "+4", -- font size increment
        },
    },
    keys = {
        { '<leader>z', function() require('zen-mode').toggle() end, desc = 'Toggle Zen Mode' },
    }
}
