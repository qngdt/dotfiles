-- Performance: enable Lua module caching (must be first)
vim.loader.enable()

-- Set <space> as the leader key (must be before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.cursorlineopt = "screenline"

-- Cursor
vim.opt.guicursor =
	"n-v-c:block-blinkon150-blinkoff150,i-ci-ve:ver50-blinkon150-blinkoff150,r-cr:hor20-blinkon150-blinkoff150,o:hor50"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Enable 24-bit colour
vim.opt.termguicolors = true

-- Indentation size
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.breakindent = true

-- Line wrap
vim.opt.wrap = true
vim.opt.linebreak = true

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- [[ Basic Keymaps ]]

-- Better save
vim.api.nvim_create_user_command("W", "w", {})
-- Because I type too fast some times
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

-- LspLog (removed from nvim-lspconfig on Neovim 0.12+)
vim.api.nvim_create_user_command("LspLog", function()
	vim.cmd.tabnew(vim.lsp.log.get_filename())
end, { desc = "Open LSP log file" })

-- Copy current buffer path to clipboard
vim.api.nvim_create_user_command(
	"CopyRelPath",
	"let @+ = expand('%:.')",
	{ desc = "Copy the relative path of the current buffer" }
)
vim.api.nvim_create_user_command(
	"CopyAbsPath",
	"let @+ = expand('%:p')",
	{ desc = "Copy the absolute path of the current buffer" }
)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Buffer keymaps
vim.keymap.set(
	"n",
	"<leader><leader>",
	":b#<CR>",
	{ desc = "Switch to the previous buffer", noremap = true, silent = true }
)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Diagnostic Config & Keymaps
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	virtual_text = true,
	virtual_lines = false,
	jump = { float = true },
})
vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror [M]essages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Tab navigation
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Move to the next tab", noremap = true, silent = true })
vim.keymap.set("n", "[t", ":tabprevious<CR>", { desc = "Move to the previous tab", noremap = true, silent = true })

-- Cursor navigation
vim.keymap.set("i", "jk", "<ESC>", { desc = "Press jk fast to exit insert mode" })
vim.keymap.set("v", "p", "P", { desc = "Quick copy in visual mode" })
vim.keymap.set({ "n", "v" }, "<leader>j", "J", { desc = "Join line" })
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", { desc = "Fast down" })
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", { desc = "Fast up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Fast down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Fast up" })
vim.keymap.set({ "n", "v", "o" }, "B", "^", { desc = "Go to the begining of the line" })
vim.keymap.set({ "n", "v", "o" }, "E", "$", { desc = "Go to the end of the line" })

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Shift left <<<" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift right >>>" })

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Plugins ]]

-- Hook: run TSUpdate after nvim-treesitter is updated (must be before vim.pack.add)
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- Lazy load: lazydev.nvim when editing Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
		require("lazydev").setup({
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
})

-- Lazy load: render-markdown.nvim when editing Markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
		require("render-markdown").setup({ file_types = { "markdown" } })
	end,
})

-- Load all eagerly-loaded plugins.
-- Dependencies are listed before the plugins that require them.
vim.pack.add({
	-- Completion (needed by nvim-lspconfig for capabilities)
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range(">=0") },
	-- Mason and helpers (needed by nvim-lspconfig)
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	-- Treesitter
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	-- Other plugins
	"https://github.com/folke/snacks.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/sphamba/smear-cursor.nvim",
})

-- Theme (configure first so colorscheme is set before other plugins render)
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = true
vim.o.background = "light"
vim.cmd.colorscheme("gruvbox-material")

-- snacks.nvim
require("snacks").setup({
	explorer = {},
	git = {},
	gitbrowse = {},
	indent = {},
	picker = {
		matcher = {
			frecency = true,
			history_bonus = true,
		},
		win = {
			input = {
				keys = {
					["<C-d>"] = { "bufdelete", mode = { "n", "i" } },
					["<C-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
					["<C-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
				},
			},
		},
	},
	statuscolumn = {},
})

-- snacks.nvim keymaps
vim.keymap.set("n", "<leader>so", function()
	Snacks.picker.buffers({ layout = { preset = "vscode" } })
end, { desc = "[S]earch [O]pened Buffers" })
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.files({ layout = { preset = "vscode" } })
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "[S]earch [D]iagnostic" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "[S]earch [K]keymaps" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "[S]earch [W]ord" })
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "grr", function()
	Snacks.picker.lsp_references()
end, { desc = "[G]oto [R]eferences", nowait = true })
vim.keymap.set("n", "gri", function()
	Snacks.picker.lsp_implementations()
end, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "gT", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto [T]ype Definition" })
vim.keymap.set("n", "<leader>ef", function()
	Snacks.explorer()
end, { desc = "[E]xplore [F]iles" })
vim.keymap.set("n", "<leader>w", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>gw", function()
	local lines = vim.fn.systemlist("git worktree list")
	if vim.v.shell_error ~= 0 then
		return vim.notify("Not in a git repository", vim.log.levels.ERROR)
	end

	local items = {}
	for idx, line in ipairs(lines) do
		local path, branch = line:match("^(%S+)%s+%S+%s+%[(.-)%]")
		if path then
			items[#items + 1] = { idx = idx, text = path, path = path, branch = branch }
		end
	end

	table.sort(items, function(a, b)
		if a.path == vim.fn.getcwd() then
			return true
		end
		if b.path == vim.fn.getcwd() then
			return false
		end
		return a.idx < b.idx
	end)

	Snacks.picker.pick({
		title = "Worktrees",
		items = items,
		layout = { preset = "vscode" },
		format = function(item)
			local current = item.path == vim.fn.getcwd()
			return {
				{ current and "* " or "  ", current and "DiagnosticOk" or "Comment" },
				{ item.branch, current and "DiagnosticOk" or "Title" },
			}
		end,
		confirm = function(picker, item)
			picker:close()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
					vim.api.nvim_buf_delete(buf, { force = true })
				end
			end
			vim.fn.chdir(item.path)
		end,
	})
end, { desc = "Git Worktrees" })

-- snacks.nvim user commands
vim.api.nvim_create_user_command("GitBlame", function()
	Snacks.git.blame_line()
end, { desc = "Git Blame" })
vim.api.nvim_create_user_command("GitCopy", function(opts)
	Snacks.gitbrowse.open({
		line_start = opts.line1,
		line_end = opts.line2,
	})
end, { desc = "Git Copy Remote URL", range = true, nargs = "?" })
vim.api.nvim_create_user_command("CloseOther", function()
	Snacks.bufdelete.other()
end, { desc = "Close all other buffers" })

-- blink.cmp
require("blink.cmp").setup({
	signature = { enabled = true },
	keymap = { preset = "enter" },
	completion = {
		list = {
			selection = { preselect = false },
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
		},
	},
	appearance = { nerd_font_variant = "mono" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			lua = { inherit_defaults = true, "lazydev" },
		},
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
})

-- mason.nvim
require("mason").setup()

-- nvim-lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		local imap = function(keys, func, desc)
			vim.keymap.set("i", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gh", vim.lsp.buf.hover, "Hover Documentation")
		imap("<C-k>", vim.lsp.buf.signature_help, "Hover Signature Help")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	lua_ls = {},
	bashls = {},
	sqlls = {},
	ts_ls = {},
	gopls = {},
	ruff = {},
	ruby_lsp = {},
}

for server_name, server_opts in pairs(servers) do
	local config = vim.tbl_deep_extend("force", {}, server_opts)
	config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
	vim.lsp.config(server_name, config)
end
vim.lsp.enable(vim.tbl_keys(servers))

local formatters = { "stylua", "gofumpt", "goimports" }

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, formatters)

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

-- conform.nvim
vim.g.disable_autoformat = true

require("conform").setup({
	notify_on_error = false,
	default_format_opts = {
		lsp_format = "fallback",
		async = true,
	},
	format_after_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { lsp_format = "fallback" }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome", "prettier" },
		typescript = { "biome", "prettier" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		go = { "gofumpt" },
	},
})

vim.keymap.set("", "<leader>ff", function()
	require("conform").format()
end, { desc = "[F]ormat buffer" })

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
	vim.notify("Auto Format Disabled", vim.log.levels.INFO)
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
	vim.notify("Auto Format Enabled", vim.log.levels.INFO)
end, { desc = "Enable autoformat-on-save" })

-- mini.nvim
require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.comment").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()

local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "+", change = "~", delete = "-" },
	},
	mappings = {
		goto_first = "[G",
		goto_prev = "[g",
		goto_next = "]g",
		goto_last = "]G",
	},
})

vim.keymap.set("n", "<leader>go", MiniDiff.toggle_overlay, { noremap = true, desc = "Toggle [G]it [O]verlay" })

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

require("mini.files").setup({
	mappings = { close = "<C-c>" },
	options = { use_as_default_explorer = false },
})

local minifiles_toggle = function()
	if not MiniFiles.close() then
		MiniFiles.open(vim.api.nvim_buf_get_name(0))
	end
end
vim.keymap.set("n", "<leader>fe", minifiles_toggle, { noremap = true, desc = "Toggle [F]ile [E]xplorer" })

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})

-- nvim-treesitter
require("nvim-treesitter").install({
	"bash",
	"diff",
	"git_rebase",
	"gitcommit",
	"html",
	"lua",
	"markdown",
	"markdown_inline",
	"vim",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buf, filetype = args.buf, args.match
		local language = vim.treesitter.language.get_lang(filetype)
		if not language then
			return
		end
		if not vim.treesitter.language.add(language) then
			return
		end
		vim.treesitter.start(buf, language)
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Incremental selection
vim.keymap.set("n", "<leader>a", function()
	local node = vim.treesitter.get_node()
	if node then
		local sr, sc, er, ec = node:range()
		vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
		vim.cmd("normal! v")
		vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
	end
end, { desc = "Init treesitter selection" })
vim.keymap.set("v", "<leader>a", function()
	local node = vim.treesitter.get_node()
	if node then
		local parent = node:parent()
		if parent then
			local sr, sc, er, ec = parent:range()
			vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
			vim.cmd("normal! o")
			vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
		end
	end
end, { desc = "Increment treesitter selection" })
vim.keymap.set("v", "<bs>", function()
	local node = vim.treesitter.get_node()
	if node then
		local child = node:child(0)
		if child then
			local sr, sc, er, ec = child:range()
			vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
			vim.cmd("normal! o")
			vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
		end
	end
end, { desc = "Decrement treesitter selection" })

-- nvim-treesitter-textobjects
require("nvim-treesitter-textobjects").setup({
	select = { lookahead = true },
	move = { set_jumps = true },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")

-- textobjects: select
vim.keymap.set({ "x", "o" }, "af", function()
	ts_select.select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	ts_select.select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aa", function()
	ts_select.select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
	ts_select.select_textobject("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	ts_select.select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	ts_select.select_textobject("@class.inner", "textobjects")
end)

-- textobjects: move
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	ts_move.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
	ts_move.goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]a", function()
	ts_move.goto_next_start("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]F", function()
	ts_move.goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]C", function()
	ts_move.goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]A", function()
	ts_move.goto_next_end("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[f", function()
	ts_move.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
	ts_move.goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[a", function()
	ts_move.goto_previous_start("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[F", function()
	ts_move.goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[C", function()
	ts_move.goto_previous_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[A", function()
	ts_move.goto_previous_end("@parameter.inner", "textobjects")
end)

-- vim-tmux-navigator keymaps (plugin is already loaded; define keys explicitly)
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

-- smear-cursor.nvim
require("smear_cursor").setup({})
