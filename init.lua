local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

local core_modules = {
  "edpa.options",
  "edpa.keymaps",
  "edpa.plugins",
  "edpa.colorscheme",
  "edpa.cmp",
  "edpa.lsp",
  "edpa.telescope",
  "edpa.treesitter",
  "edpa.autopairs",
  "edpa.comment",
  "edpa.gitsigns",
  "edpa.nvim-tree",
  "edpa.bufferline",
  "edpa.lualine",
  "edpa.toggleterm",
  "edpa.project",
  "edpa.impatient",
  "edpa.indentline",
  "edpa.alpha",
  "edpa.whichkey",
  "edpa.autocommands"
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
