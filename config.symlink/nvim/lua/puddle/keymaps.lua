local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local global = vim.g
global.mapleader = ' '
global.maplocalleader = ' '

local function withDesc(desc)
   return {
        noremap = true,
        silent = true,
        desc = desc,
    }
end

-- make CTRL + C behave exactly the same as ESC
keymap.set('i', '<C-c>', '<ESC>', opts)

-- remap ^ and $ to H and L, respectively
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', '$', opts)

-- write to all buffers
keymap.set('n', '<leader>w', ':wa<CR>', withDesc('Write all'))

-- quit all buffers
keymap.set('n', '<leader>q', ':qa<CR>', withDesc('Quit all'))

-- force quit all buffers
keymap.set('n', '<leader>fq', ':qa!<CR>', withDesc('Force quit'))

-- clear search term when centering the cursor
keymap.set('n', 'zz', 'zz:noh<CR>', opts)

-- replace current word
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace' })

-- select entire file with CTRL + A
keymap.set('n', '<C-a>', 'ggVG', opts)

-- indent and outdent lines quickly
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)

-- copy into system clipboard with CTRL + C
keymap.set('v', '<C-c>', '"+y', opts)

-- copy into host system clipboard with <leader>y
keymap.set('v', '<leader>y', '"*y', withDesc('Copy to clipboard'))

-- indent and outdent lines in visual mode
keymap.set('v', '<TAB>', '<S->>gv', opts)
keymap.set('v', '<S-TAB>', '<S-<>gv', opts)

-- Paste over visual selection, keeping paste register
keymap.set('x', '<leader>p', '"_dP', withDesc('Paste keep reg'))

-- splits
keymap.set('n', '<leader>%', ':vsplit<CR>', withDesc('Vertical split'))
keymap.set('n', '<leader>"', ':split<CR>', withDesc('Horizontal split'))

