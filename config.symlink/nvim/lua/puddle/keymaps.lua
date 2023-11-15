local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local global = vim.g
global.mapleader = ' '
global.maplocalleader = ' '

-- jj to exit insert mode
keymap.set('i', 'jj', '<Esc>')

-- make CTRL + C behave exactly the same as ESC
keymap.set('i', '<C-c>', '<ESC>', opts)

-- remap ^ and $ to H and L, respectively
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', '$', opts)

-- quickly switch between buffers
keymap.set('n', '>', ':bp<CR>', opts)
keymap.set('n', '<', ':bn<CR>', opts)

-- write to all buffers
keymap.set('n', '<leader>w', ':wa<CR>', opts)

-- quit all buffers
keymap.set('n', '<leader>q', ':qa<CR>', opts)

-- force quit all buffers
keymap.set('n', '<leader>fq', ':qa!<CR>', opts)

-- clear search term when centering the cursor
keymap.set('n', 'zz', 'zz:noh<CR>', opts)

-- replace current word
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Rename' })

-- select entire file with CTRL + A
keymap.set('n', '<C-a>', 'ggVG', opts)

-- indent and outdent lines quickly
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)

-- copy into system clipboard with CTRL + C
keymap.set('v', '<C-c>', '"+y', opts)

-- copy into host system clipboard with <leader>y
keymap.set('v', '<leader>y', '"*y', opts)

-- indent and outdent lines in visual mode
keymap.set('v', '<TAB>', '<S->>gv', opts)
keymap.set('v', '<S-TAB>', '<S-<>gv', opts)

-- greatest remap ever
keymap.set('x', '<leader>p', '"_dP', opts)
