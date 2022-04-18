local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "edpa.lsp.lsp-installer"
require("edpa.lsp.handlers").setup()
require "edpa.lsp.null-ls"
