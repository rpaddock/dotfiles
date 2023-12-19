return {
    {'Mofiqul/vscode.nvim'},
    {'marko-cerovac/material.nvim'},
    {'Mofiqul/vscode.nvim'},
    {'luisiacc/gruvbox-baby'},
    {'folke/tokyonight.nvim'},
    {'catppuccin/nvim'},
    {'savq/melange-nvim'},
    {'rebelot/kanagawa.nvim'},
    {
        'zaldih/themery.nvim',
        cmd = 'Themery',
        config = function()
            local status_ok, themery = pcall(require, 'themery')
            if not status_ok then
                return
            end

            themery.setup({
                themes = {
                    {
                        name = 'material',
                        colorscheme = 'material',
                        before = [[vim.g.material_style = 'darker']]
                    },
                    {
                        name = 'vscode',
                        colorscheme = 'vscode',
                    },
                    {
                        name = 'gruvbox',
                        colorscheme = 'gruvbox-baby',
                    },
                    {
                        name = 'catppuccin',
                        colorscheme = 'catppuccin',
                    },
                    {
                        name = 'tokyonight',
                        colorscheme = 'tokyonight'
                    },
                    {
                        name = 'melange',
                        colorscheme = 'melange'
                    },
                    {
                        name = 'kanagawa',
                        colorscheme = 'kanagawa'
                    },
                },
                themeConfigFile = '~/.config/nvim/lua/puddle/colorscheme.lua',
                livePreview = true,
            })
        end
    },
}
