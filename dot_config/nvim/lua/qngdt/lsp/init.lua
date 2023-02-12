require("qngdt.lsp.null-ls")

require("mason").setup({})

local mason_lspconfig = require("mason-lspconfig")
local servers = {
	"sumneko_lua",
	"rust_analyzer",
	"tsserver",
}

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lsp_handlers = require("qngdt.lsp.handlers")
lsp_handlers.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		local opts = {
			on_attach = lsp_handlers.on_attach,
			capabilities = lsp_handlers.capabilities,
		}

		local has_custom_opts, server_custom_opts = pcall(require, "qngdt.lsp.setting." .. server_name)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end

		require("lspconfig")[server_name].setup(opts)
	end,
})
