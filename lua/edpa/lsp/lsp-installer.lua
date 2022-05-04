local status_ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")

if not status_ok then
	return
end

local servers = {
	html = {},
	jsonls = require("edpa.lsp.settings.jsonls"),
	pyright = {},
	sumneko_lua = require("edpa.lsp.settings.sumneko_lua"),
	tsserver = { disable_formatting = true },
	jdtls = {}
}

local options = {
	on_attach = require("edpa.lsp.handlers").on_attach,
	capabilities = require("edpa.lsp.handlers").capabilities,
}

for server_name, _ in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(server_name)

	if server_available then
		server:on_ready(function()
			local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
			server:setup(opts)
		end)

		if not server:is_installed() then
			vim.notify("Installing " .. server.name, vim.log.levels.INFO, { title = "LSP" })
			server:install()
		end
	else
		vim.notify(server, vim.log.levels.ERROR, { title = "LSP" })
	end
end
