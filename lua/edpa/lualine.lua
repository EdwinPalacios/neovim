local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local filesize = {
	"filesize",
	cond = conditions.buffer_not_empty,
}

--local filename = {
--	"filename",
--	cond = conditions.buffer_not_empty,
--}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic", "nvim_lsp" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	colored = false,
	update_in_insert = true,
	always_visible = true,
}

local lsp = {
	-- Lsp server name .
	function()
		local msg = "No active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
}

local lsp_status = require('lsp-status');

local conf_lsp_progress = {
	"lsp_progress",
	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
	separators = {
		component = " ",
		progress = " | ",
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "[", post = "]" },
		spinner = { pre = "", post = "" },
		message = { pre = "(", post = ")" },
	},
	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
	message = { commenced = 'In Progress', completed = 'Completed' },
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = "柳 ", removed = " " },
	cond = conditions.hide_in_width
}

local mode = {
	"mode",
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode, branch, diagnostics },
		lualine_b = { filesize, lsp_status.status, conf_lsp_progress, },
		lualine_c = {},
		lualine_x = { "encoding", diff, spaces, filetype },
		lualine_y = { location },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
