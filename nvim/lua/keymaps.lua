local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Horizontal navigation
keymap("n", "<S-b>", "^", opts)
keymap("n", "<S-e>", "$", opts)

-- Vertical navigation
keymap("n", "<S-j>", "5j", opts)
keymap("n", "<S-k>", "5k", opts)
keymap("n", "<Leader>j", "J", opts) -- Update the default <S-j>


-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual Mode --

-- Horizontal navigation
keymap("n", "<S-b>", "^", opts)
keymap("n", "<S-e>", "$", opts)

-- Vertical navigation
keymap("n", "<S-j>", "5j", opts)
keymap("n", "<S-k>", "5k", opts)

