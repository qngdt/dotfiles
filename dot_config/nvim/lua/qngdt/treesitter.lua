require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"go",
		"html",
		"typescript",
		"javascript",
		"json",
		"latex",
		"lua",
		"python",
		"rust",
		"sql",
		"vim",
		"css",
		"scss",
	},
	highlight = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]m"] = "@function.outer",
			["]]"] = "@class.outer",
		},
		goto_next_end = {
			["]M"] = "@function.outer",
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},
})
