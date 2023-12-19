return {
    { -- Refactoring
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('refactoring').setup()
            vim.keymap.set('x', '<leader>re', ':Refactor extract ')
            vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ')
            vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ')
            vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var')
            vim.keymap.set( 'n', '<leader>rI', ':Refactor inline_func')
            vim.keymap.set('n', '<leader>rb', ':Refactor extract_block')
            vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file')
            vim.keymap.set({'n', 'x'}, '<leader>rr', function() require('refactoring').select_refactor() end)
        end,
    },
    { -- Multi-curosr
        'mg979/vim-visual-multi',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    { -- Additional text objects for operations
        'wellle/targets.vim'
    },
    { -- Line number toggling
        'jeffkreeftmeijer/vim-numbertoggle'
    },
    { -- Auto-pairs
        'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = function()
            local npairs_status_ok, npairs = pcall(require, 'nvim-autopairs')
            local rule_status_ok, rule = pcall(require, 'nvim-autopairs.rule')
            local cond_status_ok, cond = pcall(require, 'nvim-autopairs.conds')
            if not npairs_status_ok then
                return
            end
            if not rule_status_ok then
                return
            end
            if not cond_status_ok then
                return
            end
            npairs.setup({
                check_ts = true,
                fast_wrap = {
                    map = '<M-q>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    manual_position = false,
                    highlight = 'PmenuSel',
                    highlight_grey='LineNr'
                },
            })
            npairs.add_rules({
                rule("'", "'", 'python'):with_pair(cond.before_text('f')),
                rule('{', '}', 'python'):with_pair(cond.is_inside_quote()),
            })
        end
    },
    { -- Surround
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        opts = {},
    },
    { -- Context aware comments
        'JoosepAlviste/nvim-ts-context-commentstring',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require('ts_context_commentstring').setup {
               enable_autocmd = false,
            }
        end
    },
    { -- Comment
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function ()
            local status_ok, comment = pcall(require, 'Comment')

            if not status_ok then
                return
            end

            comment.setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    },
}
