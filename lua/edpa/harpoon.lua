local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, expr = false }

keymap('n', '<leader>h', ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap('n', '<leader>m', ":Telescope harpoon marks<CR>", opts)
keymap('n', '<leader>mm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
