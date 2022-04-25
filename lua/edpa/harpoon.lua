local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, expr = false }

keymap('n', '<leader>ss', require("harpoon.ui").toggle_quick_menu, opts)
keymap('n', '<leader>sa', require("harpoon.mark").add_file, opts)
keymap('n', '<leader><leader>1', function() require("harpoon.term").gotoTerminal(1) end, opts)
keymap('n', '<leader><leader>2', function() require("harpoon.term").gotoTerminal(2) end, opts)
keymap('n', '<leader><leader>3', function() require("harpoon.term").gotoTerminal(3) end, opts)

for i = 1, 5 do
  keymap('n', string.format("<leader>%s", i), function() require("harpoon.ui").nav_file(i) end, opts)
end
