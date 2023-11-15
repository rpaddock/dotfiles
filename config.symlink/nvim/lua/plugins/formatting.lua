return {
    'mhartington/formatter.nvim',
    keys = {
        { '<leader>f', ':Format<CR>', desc = 'Format'},
        { '<leader>F', ':FormatWrite<CR>', desc = 'Format Write'},
    },
    config = function()
        require('formatter').setup({
            logging = false,
            filetype = {
                javascript = {
                    -- prettierd
                    function()
                        return {
                            exe = "prettierd",
                            args = {vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                },
                typescript = {
                    -- prettierd
                    function()
                        return {
                            exe = "prettierd",
                            args = {vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                },
                json = {
                    -- prettierd
                    function()
                        return {
                            exe = "prettierd",
                            args = {vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                },
                rust = {function() return {exe = "rustfmt", stdin = true} end},
                sql = {
                    -- prettierd
                    function()
                        return {
                            exe = "sql-formatter",
                            args = {vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                }
            }
        })
    end
}
