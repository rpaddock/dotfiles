return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Goto buffer in position...
        map('n', 'g1', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', 'g2', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', 'g3', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', 'g4', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', 'g5', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', 'g6', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', 'g7', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', 'g8', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', 'g9', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', 'g0', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
        -- Close buffer
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands
        --                 :BufferCloseAllButCurrent
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight
        -- Sort automatically by...
        -- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        -- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        -- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
            -- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

        -- Other:
        -- :BarbarEnable - enables barbar (enabled by default)
        -- :BarbarDisable - very bad command, should never be used
    end,
    version = '^1.0.0',
}
