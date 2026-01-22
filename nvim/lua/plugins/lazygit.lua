-- Lazygit integration for visual git workflow
return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
    { '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', desc = 'Lazy[G]it current [F]ile' },
  },
}
