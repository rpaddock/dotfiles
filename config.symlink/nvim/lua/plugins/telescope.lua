return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function ()
        local status_ok, telescope = pcall(require, 'telescope')

        if not status_ok then
            return
        end

        telescope.setup()
        telescope.load_extension 'file_browser'
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', ';f', builtin.find_files, {})
        vim.keymap.set('n', ';r', builtin.oldfiles, {})
        vim.keymap.set('n', ';g', builtin.live_grep, {})
        vim.keymap.set('n', ';h', builtin.help_tags, {})
        vim.keymap.set('n', ';;', ':Telescope file_browser<CR>', { noremap = true })
    end
}
