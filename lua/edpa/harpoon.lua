local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, expr = false }

keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>ht", ":Telescope harpoon marks<CR>", opts)
keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

keymap("n", "<leader>hj", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
keymap("n", "<leader>hl", ":lua require('harpoon.ui').nav_next()<CR>", opts)