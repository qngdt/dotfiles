local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
local status_treesitter_context_ok, treesitter_context = pcall(require, "treesitter-context")
if not status_treesitter_context_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
treesitter_context.setup({})
