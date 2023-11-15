return {
    'akinsho/toggleterm.nvim',
    version = '*',
    open_mapping = [[<c-\>]],
    keys = {
        {
            '<leader>tt',
            '<cmd>ToggleTerm direction=horizontal<cr>',
            desc = 'Open a horizontal terminal at the Desktop directory'
        },
        {
            '<leader>td',
            '<cmd>ToggleTerm dir=~/Desktop direction=horizontal<cr>',
            desc = 'Open a horizontal terminal at the Desktop directory'
        }

    },
    config = function ()
        local status_ok, toggleterm = pcall(require, 'toggleterm')
        if not status_ok then
          return
        end

        local opts = {noremap = true, silent = true}

        toggleterm.setup({
            open_mapping = [[<c-\>]],
            size = 10,
            hide_numbers = true,
            insert_mappings = true,
        })

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

        function _lazygit_toggle()
          lazygit:toggle()
        end

        vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = true})

        function _G.set_terminal_keymaps()
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end
        vim.api.nvim_create_autocmd('TermOpen', {
            pattern = [[term://*]],
            callback = set_terminal_keymaps
        })
    end
}
