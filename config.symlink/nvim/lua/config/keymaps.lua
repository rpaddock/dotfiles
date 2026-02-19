-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local global = vim.g
global.mapleader = " "

local function withDesc(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- make CTRL + C behave exactly the same as ESC
keymap.set("i", "<C-c>", "<ESC>", opts)

-- remap ^ and $ to H and L, respectively
keymap.set("n", "H", "^", opts)
keymap.set("n", "L", "$", opts)

-- buffer navigation
keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", withDesc("Increase Window Height"))
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", withDesc("Decrease Window Height"))
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", withDesc("Decrease Window Width"))
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", withDesc("Increase Window Width"))

-- replace current word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace" })

-- select entire file with CTRL + A
keymap.set("n", "<C-a>", "ggVG", opts)

-- copy into system clipboard with CTRL + C
keymap.set("v", "<C-c>", '"+y', opts)

-- copy into host system clipboard with <leader>y
keymap.set("v", "<leader>y", '"*y', withDesc("Copy to clipboard"))

-- Paste over visual selection, keeping paste register
keymap.set("x", "<leader>p", '"_dP', withDesc("Paste keep reg"))

-- splits
keymap.set("n", "<leader>%", ":vsplit<CR>", withDesc("Vertical split"))
keymap.set("n", '<leader>"', ":split<CR>", withDesc("Horizontal split"))
