return {
    'mhartington/formatter.nvim',
    keys = {
        { '<leader>f', ':Format<CR>', desc = 'Format' },
        { '<leader>F', ':FormatWrite<CR>', desc = 'Format Write' },
    },
    config = function()
        require('formatter').setup({
            logging = false,
            filetype = {
                lua = {
                    -- sytlua
                    function()
                        return {
                            exe = 'stylua',
                            args = {
                                '-',
                            },
                            stdin = true,
                        }
                    end,
                },
                javascript = {
                    -- prettierd
                    function()
                        return {
                            exe = 'prettierd',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
                javascriptreact = {
                    -- prettierd
                    function()
                        return {
                            exe = 'prettierd',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
                typescript = {
                    -- prettierd
                    function()
                        return {
                            exe = 'prettierd',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
                typescriptreact = {
                    -- prettierd
                    function()
                        return {
                            exe = 'prettierd',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
                json = {
                    -- prettierd
                    function()
                        return {
                            exe = 'prettierd',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
                rust = {
                    function()
                        return { exe = 'rustfmt', stdin = true }
                    end,
                },
                sql = {
                    -- prettierd
                    function()
                        return {
                            exe = 'sql-formatter',
                            args = { vim.api.nvim_buf_get_name(0) },
                            try_node_modules = true,
                            stdin = true,
                        }
                    end,
                },
            },
        })
    end,
}
