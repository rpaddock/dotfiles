return {
    { -- UI for messages, cmdline, popupmenu
        'folke/noice.nvim',
        event = 'VimEnter',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function ()
            local status_ok, noice = pcall(require, 'noice')

            if not status_ok then
                return
            end

            noice.setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                        ['vim.lsp.util.stylize_markdown'] = true,
                        ['cmp.entry.get_documentation'] = true,
                    },
                    signature = {
                        enabled = false
                    },
                    hover = {
                        enabled = false
                    }
                },
                -- you can enable a preset for easier configuration
                presets = {
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                    bottom_search = false,
                    command_palette = false
                },
                messages = {
                    enabled = false
                },
                -- popupmenu = {
                --     enabled = false
                -- }
            })

            require('notify').setup({
                background_color = '#ff0000',
            })
        end
    },
    { -- UI for other vim builtins
        'stevearc/dressing.nvim',
        event = 'VimEnter',
        opts = {},
    },
    { -- Show git status on sidebar
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
    { -- Status bar
      'nvim-lualine/lualine.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function ()
          local status_ok, lualine = pcall(require, 'lualine')
          if not status_ok then
              return
          end

          lualine.setup({
              options = {
                  icons_enabled = true,
                  theme = 'auto',
              },
              sections = {
                  lualine_a = {
                      {
                          'filename',
                          path = 1,
                      },
                  },
              },
          })
      end
    },
    { -- Buffer bar
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            map('n', 'gj', '<Cmd>BufferPrev<CR>', opts)
            map('n', 'gk', '<Cmd>BufferNext<CR>', opts)
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
            map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
            map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
            map('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
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
    },
    { -- Zen mode
        'folke/zen-mode.nvim',
        event = 'VeryLazy',
        opts = {
            tmux = { enabled = true }, -- disables the tmux statusline
            kitty = {
                enabled = true,
                font = '+4', -- font size increment
            },
        },
        keys = {
            { '<leader>z', function() require('zen-mode').toggle() end, desc = 'Toggle Zen Mode' },
        }
    }
}
