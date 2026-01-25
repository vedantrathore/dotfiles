-- Auto-session: Automatic session management for Neovim
-- Saves and restores sessions per working directory
return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '/' },
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_use_git_branch = true, -- Separate sessions per git branch

    -- Session lens for searching sessions via Telescope
    session_lens = {
      buftypes_to_ignore = {},
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false,
    },
  },
  keys = {
    { '<leader>wr', '<cmd>SessionRestore<cr>', desc = '[W]orkspace [R]estore session' },
    { '<leader>ws', '<cmd>SessionSave<cr>', desc = '[W]orkspace [S]ave session' },
    { '<leader>wl', '<cmd>SessionSearch<cr>', desc = '[W]orkspace [L]ist sessions' },
    { '<leader>wd', '<cmd>SessionDelete<cr>', desc = '[W]orkspace [D]elete session' },
  },
}
