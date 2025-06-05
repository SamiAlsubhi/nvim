local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Have lazy manage itself
  "folke/lazy.nvim",

  -- File Explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('user.plugins-config.nvim-tree')
    end,
  },

  -- Home screen
  {
    "goolord/alpha-nvim",
    config = function()
      require('user.plugins-config.alpha')
    end,
  },

  -- Colorscheme
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "italic",
          keywords = "bold,italic",
          constants = "NONE",
          functions = "italic",
          operators = "NONE",
          variables = "NONE",
          parameters = "NONE",
          conditionals = "italic",
          virtual_text = "NONE",
        }
      })
      vim.cmd("colorscheme onedark")
    end,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufWinEnter",
    config = function()
      require('user.plugins-config.treesitter')
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
  { "numToStr/Comment.nvim", config = function() require('user.plugins-config.comment') end },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require('user.plugins-config.telescope')
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('user.plugins-config.lsp')
    end,
    dependencies = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  { "nvimdev/lspsaga.nvim", config = function() require('user.plugins-config.lspsaga') end },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require('user.plugins-config.cmp')
    end,
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-cmdline",
    },
  },

  -- Utils
  { "windwp/nvim-autopairs", config = function() require('user.plugins-config.autopairs') end, after = "nvim-cmp" },
  { "akinsho/toggleterm.nvim", version = "*", config = function() require('user.plugins-config.toggleterm') end },
  { "folke/which-key.nvim", event = "BufWinEnter", config = function() require('user.plugins-config.whichkey') end },

  -- Buffer management and status line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('user.plugins-config.bufferline')
    end,
  },
  { "nvim-lualine/lualine.nvim", config = function() require('user.plugins-config.lualine') end },

  -- Visual Plugins
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({ current_line_blame = true })
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", config = function() require('user.plugins-config.indentline') end },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    event = "BufRead",
  },

  -- Speed up loading Lua modules
  "lewis6991/impatient.nvim",
  "kdheepak/lazygit.nvim",
  "github/copilot.vim",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
})

