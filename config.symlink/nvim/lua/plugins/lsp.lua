return {
    {
        'folke/neodev.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local neodev_status_ok, neodev = pcall(require, 'neodev')

            if not neodev_status_ok then
                return
            end

            neodev.setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = 'Mason',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            { 'williamboman/mason-lspconfig.nvim', },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'L3MON4D3/LuaSnip' },
            { 'SmiteshP/nvim-navic' },
            { 'onsails/lspkind.nvim' },
            { 'simrat39/rust-tools.nvim' },

        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            local navic = require('nvim-navic')
            local lspkind = require('lspkind')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end)

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.ensure_installed({
                'pyright',
                'lua_ls',
                'tsserver',
                'rust_analyzer'
            })

            local rust_tools = require('rust-tools')
            rust_tools.setup {
                server = {
                    on_attach = function(client, bufnr)
                        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                    end
                }
            }

            lsp.setup()

            local cmp = require('cmp')
            -- local cmp_action = require('lsp-zero').cmp_action()

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                preselect = cmp.PreselectMode.None,
                sources = {
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                      mode = 'symbol', -- show only symbol annotations
                      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                      -- The function below will be called before any actual modifications from lspkind
                      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                      -- before = function (entry, vim_item)
                      --   ...
                      --   return vim_item
                      -- end
                    })
                  },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                }
            })

        end
    },
    { 'saadparwaiz1/cmp_luasnip' },
}
