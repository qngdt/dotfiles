-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
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
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.cursorlineopt = "screenline"

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
--  See `:help vim.keymap.set()`

-- Better save
vim.api.nvim_create_user_command("W", "w", {})
-- Because I type too fast some times
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

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
-- See :help vim.diagnostic.Opts
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
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@module "snacks"
		---@type snacks.Config
		opts = {
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
		},
		keys = {
			{
				"<leader>so",
				function()
					Snacks.picker.buffers({
						layout = { preset = "vscode" },
					})
				end,
				desc = "[S]earch [O]pened Buffers",
			},
			{
				"<leader>sf",
				function()
					Snacks.picker.files({
						layout = { preset = "vscode" },
					})
				end,
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "[S]earch [D]iagnostic",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "[S]earch [H]elp",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "[S]earch [K]keymaps",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "[S]earch [G]rep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "[S]earch [W]ord",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "[G]it [S]tatus",
			},
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "[G]oto [D]efinition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "[G]oto [D]eclaration",
			},
			{
				"grr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "[G]oto [R]eferences",
				nowait = true,
			},
			{
				"gri",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "[G]oto [I]mplementation",
			},
			{
				"gT",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto [T]ype Definition",
			},
			{
				"<leader>ef",
				function()
					Snacks.explorer()
				end,
				desc = "[E]xplore [F]iles",
			},
			{
				"<leader>w",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete buffer",
			},
			{
				"<leader>gw",
				function()
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
						layout = {
							preset = "vscode",
						},
						format = function(item)
							local current = item.path == vim.fn.getcwd()
							return {
								{ current and "* " or "  ", current and "DiagnosticOk" or "Comment" },
								{ item.branch, current and "DiagnosticOk" or "Title" },
							}
						end,
						confirm = function(picker, item)
							picker:close()
							-- Close all buffers before switching worktrees
							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
									vim.api.nvim_buf_delete(buf, { force = true })
								end
							end
							vim.fn.chdir(item.path)
						end,
					})
				end,
				{ desc = "Git Worktrees" },
			},
		},
		init = function()
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
		end,
	},

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
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

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
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
				ruby_lsp = {
					cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv("GLOBAL_GEMFILE") },
					root_dir = function()
						return vim.loop.cwd()
					end,
				},
			}

			local formatters = {
				"stylua",
				"gofumpt",
				"goimports",
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, formatters)

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				automatic_enable = true,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>ff",
				function()
					require("conform").format()
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			default_format_opts = {
				lsp_format = "fallback",
				async = true,
			},
			format_after_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					lsp_format = "fallback",
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				go = { "gofumpt" },
			},
		},
		init = function()
			vim.g.disable_autoformat = true
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
				vim.api.nvim_echo({ { "Auto Format Disabled" } }, true, {})
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
				vim.api.nvim_echo({ { "Auto Format Enabled" } }, true, {})
			end, {
				desc = "Enable autoformat-on-save",
			})
		end,
	},

	{
		"saghen/blink.cmp",
		version = "*",
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			signature = { enabled = true },
			keymap = {
				preset = "enter",
			},
			completion = {
				list = {
					selection = {
						preselect = false,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
		},
	},

	{ -- Theme
		"sainnhe/gruvbox-material",
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = true
			vim.o.background = "light"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{ -- Collection of various small independent plugins/modules
		"nvim-mini/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.icons").setup()
			require("mini.comment").setup()
			require("mini.notify").setup()
			require("mini.trailspace").setup()
			require("mini.surround").setup()
			require("mini.tabline").setup()
			require("mini.bufremove").setup()

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

			vim.keymap.set(
				"n",
				"<leader>go",
				MiniDiff.toggle_overlay,
				{ noremap = true, desc = "Toggle [G]it [O]verlay" }
			)

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
				mappings = {
					close = "<C-c>",
				},
				options = {
					use_as_default_explorer = false,
				},
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
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"diff",
				"git_rebase",
				"gitcommit",
				"html",
				"lua",
				"markdown",
				"markdown_inline",
				"vim",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>a",
					node_incremental = "<leader>a",
					node_decremental = "<bs>",
					scope_incremental = false,
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		opts = {
			file_types = { "markdown" },
		},
		ft = { "markdown" },
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
})
