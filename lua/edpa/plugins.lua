local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Base packages
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"

  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- Navigation bar
  use "kyazdani42/nvim-tree.lua"

  -- Tabs bar
  use "akinsho/bufferline.nvim"
  -- use "romgrk/barbar.nvim"

  -- Bottom bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  -- use "feline-nvim/feline.nvim",

  -- Better quickfix window in Neovim, polish old quickfix window.
  use { "kevinhwang91/nvim-bqf", ft = "qf" }

  -- Bookmarks
  use {
    "ThePrimeagen/harpoon",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  }

  use "goolord/alpha-nvim"

  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"

  -- Completition
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      -- snippets
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },
  }

  use "weilbith/nvim-code-action-menu"

  -- Easily comment stuff
  use "numToStr/Comment.nvim"

  -- snippets
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/nvim-lsp-installer", -- simple to use language server installer
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
    "ray-x/lsp_signature.nvim",
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use "vim-test/vim-test"

  -- Maximizes and restores the current window in Vim.
  use "szw/vim-maximizer"

  -- commentstring based on the cursor location in a file.
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- multicursor
  use "mg979/vim-visual-multi"

  -- Highlight words and lines on the cursor for Neovim
  use "nvim-cursorline"

  use {
    "wfxr/minimap.vim",
    run = "cargo install --locked code-minimap"
  }

  use "simrat39/symbols-outline.nvim"

  -- color highlighter
  use "norcalli/nvim-colorizer.lua"
  -- use "crivotz/nvim-colorizer.lua"

  -- Peek lines just when you intend
  use "nacro90/numb.nvim"

  -- 📔 The interactive scratchpad for hackers.
  use "metakirby5/codi.vim"

  -- Hlsearch Lens for Neovim
  use "kevinhwang91/nvim-hlslens"

  -- even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen
  use "andymass/vim-matchup"

  -- EditorConfig plugin for Vim
  use "editorconfig/editorconfig-vim"

  -- use "Pocco81/TrueZen.nvim"

  -- Smooth scrolling neovim plugin written in lua
  use 'karb94/neoscroll.nvim'

  -- Gain the power to move lines and blocks and auto-indent them!
  use 'fedepujol/move.nvim'

  use "github/copilot.vim"

  use "christoomey/vim-tmux-navigator"

  use "rcarriga/nvim-notify"

  -- use "numToStr/FTerm.nvim"

  -- ✅ Highlight, list and search todo comments in your projects
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
