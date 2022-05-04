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

local function lsp_client()
	local buf_clients = vim.lsp.buf_get_clients()
	if next(buf_clients) == nil then
		return ""
	end
	local buf_client_names = {}
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end
	return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

local function lsp_progress(_, is_active)
	if not is_active then
		return
	end
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return ""
	end
	local status = {}
	for _, msg in pairs(messages) do
		local title = ""
		if msg.title then
			title = msg.title
		end
		table.insert(status, (msg.percentage or 0) .. "%% " .. title)
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, "  ") .. " " .. spinners[frame + 1]
end

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
		lualine_b = { filesize, { lsp_client, icon = " " } },
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
