local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

lsp_installer.setup({
	ensure_installed = { "sumneko_lua", "jsonls", "rust_analyzer", "tsserver" },
	automatic_installation = true,
})

lsp_installer.setup_handlers({
	function(server_name)
		local opts = {
			on_attach = require("qngdt.lsp.handlers").on_attach,
			capabilities = require("qngdt.lsp.handlers").capabilities,
		}

		local has_custom_opts, server_custom_opts = pcall(require, "qngdt.lsp.setting." .. server_name)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end

		require("lspconfig")[server_name].setup(opts)
	end,
})
