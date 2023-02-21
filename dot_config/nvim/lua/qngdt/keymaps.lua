local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Horizontal navigation
keymap("n", "<S-b>", "^", opts)
keymap("n", "<S-e>", "$", opts)

-- Vertical navigation
keymap("n", "<S-j>", "<C-d>zz", opts)
keymap("n", "<S-k>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "<Leader>j", "J", opts) -- Update the default <S-j>

-- Delete without yanking
keymap("n", "<Leader>x", '"_x', opts)
keymap("n", "<Leader>d", '"_d', opts)
keymap("n", "<Leader>c", '"_c', opts)

-- Telescope
keymap("n", "<Leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<Leader>.", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<Leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })
keymap("n", "<Leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<Leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<Leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<Leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<Leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap("n", "<Leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "[F]iles" })

-- Buffer
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<Leader>w", ":bd<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
--
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Quick copy
keymap("v", "p", '"_dP', opts)

-- Horizontal navigation
keymap("v", "<S-b>", "^", opts)
keymap("v", "<S-e>", "$", opts)

-- Vertical navigation
keymap("v", "<S-j>", "<C-d>zz", opts)
keymap("v", "<S-k>", "<C-u>zz", opts)
keymap("v", "<C-d>", "<C-d>zz", opts)
keymap("v", "<C-u>", "<C-u>zz", opts)

-- Delete without yanking
keymap("v", "<Leader>x", '"_x', opts)
keymap("v", "<Leader>d", '"_d', opts)
keymap("v", "<Leader>c", '"_c', opts)

-- Toggle Terminal
keymap("n", "<C-t>", require("FTerm").toggle, { desc = "Toggle Terminal" })
keymap("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
