local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("qngdt.lsp.lsp-installer")
require("qngdt.lsp.handlers").setup()
require("qngdt.lsp.null-ls")
