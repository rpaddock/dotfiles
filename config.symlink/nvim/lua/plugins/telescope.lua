return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim', -- telescope ui selection. not currently using
        'nvim-lua/plenary.nvim',
        'ahmedkhalf/project.nvim', -- controls cwd when opening file explorer
    },
    config = function ()
        local status_ok, telescope = pcall(require, 'telescope')

        if not status_ok then
            return
        end

        telescope.setup {
            defaults = {
                vimgrep_arguments = {
                  'rg',
                  '--color=never',
                  '--no-heading',
                  '--with-filename',
                  '--line-number',
                  '--column',
                  '--smart-case',
                  '--hidden',
                },
            },
        }

        require('project_nvim').setup {
            detection_methods = { 'lsp', 'pattern' }
        }

        telescope.load_extension 'file_browser'
        telescope.load_extension 'projects'

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', ';f',
            function()
                builtin.find_files({
                    no_ignore = false,
                    hidden = true,
                })
            end,
            { noremap = true, desc = 'Find in files' })
        vim.keymap.set('n', ';r', builtin.oldfiles, { noremap = true, desc = 'Recent files' })
        vim.keymap.set('n', ';g', builtin.live_grep, { noremap = true, desc = 'Live grep' })
        vim.keymap.set('n', ';h', builtin.help_tags, { noremap = true, desc = 'Help tags' })
        vim.keymap.set('n', ';e', builtin.diagnostics, { noremap = true, desc = 'Dianostics' })
        vim.keymap.set('n', ';;', ':Telescope file_browser<CR>', { noremap = true, desc = 'File browser' })
        vim.keymap.set('n', ';\'', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true, desc = 'File browser from buffer' })
    end
}
