local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Installed plugins
require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- LSP
	use("neovim/nvim-lspconfig", {
		requires = {
			{
				-- Automatically install LSPs to stdpath for neovim
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",

				-- Useful status updates for LSP
				"j-hui/fidget.nvim",

				-- Additional lua configuration, makes nvim stuff amazing
				"folke/neodev.nvim",
			},
		},
	})

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Theme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- CMP
	use("hrsh7th/nvim-cmp", {
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets"
		},
	})

	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires =  {
      "nvim-lua/plenary.nvim"
    },
	})

	-- Nvim-tree
	use("kyazdani42/nvim-tree.lua")

	-- Bufferline & Lualine
	use("akinsho/bufferline.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("moll/vim-bbye")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Misc
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs")

	-- Copilot
	use("github/copilot.vim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
