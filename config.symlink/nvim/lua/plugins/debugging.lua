return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            { 'rcarriga/nvim-dap-ui' },
            { 'theHamsta/nvim-dap-virtual-text' },
            { 'nvim-telescope/telescope-dap.nvim' },
            { 'mxsdev/nvim-dap-vscode-js' },
            {
                'microsoft/vscode-js-debug',
                build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            },
        },
        config = function()
            require('dap-vscode-js').setup({
                debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
                adapters = {
                    'pwa-node',
                    'pwa-chrome',
                    'pwa-msedge',
                    'node-terminal',
                    'pwa-extensionHost',
                },
                log_file_level = vim.log.levels.DEBUG,
                log_console_level = vim.log.levels.DEBUG,
            })

            require('nvim-dap-virtual-text').setup({
                commented = true,
            })

            local dap, dapui = require('dap'), require('dapui')

            dapui.setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end

            -- lua setup
            dap.configurations.lua = {
                {
                    type = 'nlua',
                    request = 'attach',
                    name = 'Attach to running Neovim instance',
                    host = function()
                        local value = vim.fn.input('Host [127.0.0.1]: ')
                        if value ~= '' then
                            return value
                        end
                        return '127.0.0.1'
                    end,
                    port = function()
                        local val = tonumber(vim.fn.input('Port: ', '8086'))
                        assert(val, 'Please provide a port number')
                        return val
                    end,
                },
            }

            for _, language in ipairs({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }) do
                dap.configurations[language] = {
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Launch file',
                        program = '${file}',
                        cwd = '${workspaceFolder}',
                        sourceMaps = true,
                    },
                    {
                        type = 'pwa-node',
                        request = 'attach',
                        name = 'Attach',
                        processId = require('dap.utils').pick_process,
                        cwd = '${workspaceFolder}',
                        sourceMaps = true,
                    },
                }
            end

            -- Set keymaps to control the debugger
            vim.keymap.set('n', '<leader>dk', dap.continue, { desc = 'Continue', silent = true })
            vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate', silent = true })
            vim.keymap.set('n', '<leader>dl', dap.step_over, { desc = 'Step Over', silent = true })
            vim.keymap.set('n', '<leader>dj', dap.step_into, { desc = 'Step Into', silent = true })
            vim.keymap.set('n', '<leader>dK', dap.step_out, { desc = 'Step Out', silent = true })
            vim.keymap.set('n', '<leader>dh', dap.step_back, { desc = 'Step Back', silent = true })
            vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open Repl', silent = true })
            vim.keymap.set('n', '<leader>dc', dap.run_to_cursor, { desc = 'Run to Cursor', silent = true })
            vim.keymap.set('n', '<leader>dL', dap.run_last, { desc = 'Run Last', silent = true })
            vim.keymap.set('n', '<leader>ui', dapui.toggle, { desc = 'Toggle Debug UI', silent = true })
            vim.keymap.set('n', '<leader>du', dap.up, { desc = 'Up', silent = true })
            vim.keymap.set('n', '<leader>dd', dap.down, { desc = 'Down', silent = true })
            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint', silent = true })
            vim.keymap.set('n', '<leader>dB', function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end, { desc = 'Toggle Conditional Breakpoint', silent = true })
            vim.keymap.set('n', '<leader>d<c-b>', dap.clear_breakpoints, { desc = 'Clear Breakpoints', silent = true })
        end,
    },
}
