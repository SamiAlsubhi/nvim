--this is revised

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- vim.g.nvim_tree_width = 25
-- vim.g.nvim_tree_indent_markers = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

--nvim_tree.setup {auto_open = 1, auto_close = 1, gitignore = 1}

-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = "",
--     staged = "S",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "U",
--     ignored = "◌",
--   },
--   folder = {
--     default = "",
--     open = "",
--     empty = "",
--     empty_open = "",
--     symlink = "",
--   },
-- }

-- local status_ok, nvim_tree = pcall(require, "nvim-tree")
-- if not status_ok then
--   return
-- end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--   return
-- end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- nvim_tree.setup {
--   disable_netrw = true,
--   hijack_netrw = true,
--   open_on_setup = false,
--   ignore_ft_on_setup = {
--     "startify",
--     "dashboard",
--     "alpha",
--   },
--   open_on_tab = false,
--   hijack_cursor = false,
--   update_cwd = true,
--   update_to_buf_dir = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = true,
--     show_on_dirs=true,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     },
--   },
--   update_focused_file = {
--     enable = true,
--     update_cwd = true,
--     ignore_list = {},
--   },
--   system_open = {
--     cmd = nil,
--     args = {},
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 500,
--   },
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = "left",
--     auto_resize = true,
--     mappings = {
--       custom_only = false,
--       list = {
--         { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
--         { key = "h", cb = tree_cb "close_node" },
--         { key = "v", cb = tree_cb "vsplit" },
--       },
--     },
--     number = false,
--     relativenumber = false,
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true,
--   },
--   quit_on_open = 0,
--   git_hl = 1,
--   disable_window_picker = 0,
--   root_folder_modifier = ":t",
--   show_icons = {
--     git = 1,
--     folders = 1,
--     files = 1,
--     folder_arrows = 1,
--     tree_width = 30,
--   },
-- }


nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  -- ignore_buffer_on_setup = false,
  -- open_on_setup = false,
  -- open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    -- height = 30,
    -- hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    -- mappings = {
    --   custom_only = false,
    --   list = {
    --     -- user mappings go here
    --   },
    -- },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  -- ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
