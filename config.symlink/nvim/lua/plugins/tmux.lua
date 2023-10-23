return {
    'alexghergh/nvim-tmux-navigation',
    event = 'VimEnter',
    config = function()
        require('nvim-tmux-navigation').setup {
            keybindings = {
                left = '<C-h>',
                down = '<C-j>',
                up = '<C-k>',
                right = '<C-l>',
            }
        }
    end
}