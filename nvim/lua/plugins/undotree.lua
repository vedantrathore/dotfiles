-- Undotree for visual undo history
return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', vim.cmd.UndotreeToggle, desc = '[U]ndotree toggle' },
  },
}
