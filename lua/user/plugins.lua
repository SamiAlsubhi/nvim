local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  -- File Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    -- cmd = "NvimTreeToggle",
    config = "require('user.plugins-config.nvim-tree')",
  })

  -- home screen
  use({ "goolord/alpha-nvim", config = "require('user.plugins-config.alpha')" })

  -- colorscheme
  -- WARNING: needs to load tokyonight before onedark in order for onedark to work properly on html attributes
  -- use({ "folke/tokyonight.nvim", config = "vim.cmd('colorscheme tokyonight')" })
  -- use({ "navarasu/onedark.nvim", config = "vim.cmd('colorscheme onedark')" }) -- colorscheme
  use({ "olimorris/onedarkpro.nvim", 
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
      end
  }) 
  -- Packer
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  -- Syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('user.plugins-config.treesitter')",
  })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" })
  use({ "numToStr/Comment.nvim", config = "require('user.plugins-config.comment')" })
  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    config = "require('user.plugins-config.telescope')",
  })

  --LSP
  use({
    "neovim/nvim-lspconfig",
    config = "require('user.plugins-config.lsp')",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
      -- "tamago324/nlsp-settings.nvim",
    },
  })
  -- use({ "tami5/lspsaga.nvim",commit="3101712", config = "require('user.plugins-config.lspsaga')" })
  use({ "nvimdev/lspsaga.nvim", config = "require('user.plugins-config.lspsaga')" })
  use({
    "hrsh7th/nvim-cmp",
    config = "require('user.plugins-config.cmp')",
    requires = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-cmdline",
    },
  })

  -- Utils
  use({ "windwp/nvim-autopairs", config = "require('user.plugins-config.autopairs')", after = "nvim-cmp" })

  use({ "akinsho/toggleterm.nvim", tag = "v2.*", config = "require('user.plugins-config.toggleterm')" })
  use({ "folke/which-key.nvim", event = "BufWinEnter", config = "require('user.plugins-config.whichkey')" })

  -- buffer management and status line
  use({
    "akinsho/bufferline.nvim",
    tag = "*",--"v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    -- event = "BufWinEnter",
    config = "require('user.plugins-config.bufferline')",
  })
  use({ "nvim-lualine/lualine.nvim", config = "require('user.plugins-config.lualine')" })
  -- Visual Plugins

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({ current_line_blame = true })
    end,
  })
  use({ "lukas-reineke/indent-blankline.nvim", config = "require('user.plugins-config.indentline')" })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    event = "BufRead",
  })

  --check this
  use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time.
  use("kdheepak/lazygit.nvim")
  use("github/copilot.vim")
  use("L3MON4D3/LuaSnip")             --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
