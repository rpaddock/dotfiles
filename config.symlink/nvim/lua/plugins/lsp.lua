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
            { 'pmizio/typescript-tools.nvim' },

        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            local lspkind = require('lspkind')

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.ensure_installed({
                'pyright',
                'lua_ls',
                'rust_analyzer',
                'tailwindcss',
            })

            vim.api.nvim_create_autocmd('LspAttach', {
              desc = 'LSP actions',
              callback = function()
                local bufmap = function(mode, lhs, rhs)
                  local opts = {buffer = true}
                  vim.keymap.set(mode, lhs, rhs, opts)
                end

                bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
                bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
                bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
                bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
                bufmap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
              end
            })

            -- Rust
            local rust_tools = require('rust-tools')
            rust_tools.setup {
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set('n', '<leader>a', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                    end
                }
            }

            -- Typescript
            require('typescript-tools').setup {
                settings = {
                     -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
                    -- "remove_unused_imports"|"organize_imports") -- or string "all"
                    -- to include all supported code actions
                    -- specify commands exposed as code_actions
                    expose_as_code_action = {
                        'add_missing_imports'
                    },
                    tsserver_plugins = {
                        '@styled/typescript-styled-plugin',
                    },
                },
            }

            lsp.setup()

            -- Icons
            local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
            for type, icon in pairs(signs) do
              local hl = 'DiagnosticSign' .. type
              vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

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
