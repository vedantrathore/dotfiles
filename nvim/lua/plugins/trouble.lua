-- trouble.nvim - A pretty diagnostics, references, telescope results, quickfix and location list
-- Better UI for viewing and navigating diagnostics, references, etc.

return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'Trouble', 'TroubleToggle' },
  opts = {
    position = 'bottom',
    height = 10,
    width = 50,
    icons = true,
    mode = 'workspace_diagnostics',
    severity = nil,
    fold_open = '',
    fold_closed = '',
    group = true,
    padding = true,
    cycle_results = true,
    action_keys = {
      close = 'q',
      cancel = '<esc>',
      refresh = 'r',
      jump = { '<cr>', '<tab>', '<2-leftmouse>' },
      open_split = { '<c-x>' },
      open_vsplit = { '<c-v>' },
      open_tab = { '<c-t>' },
      jump_close = { 'o' },
      toggle_mode = 'm',
      switch_severity = 's',
      toggle_preview = 'P',
      hover = 'K',
      preview = 'p',
      open_code_href = 'c',
      close_folds = { 'zM', 'zm' },
      open_folds = { 'zR', 'zr' },
      toggle_fold = { 'zA', 'za' },
      previous = 'k',
      next = 'j',
      help = '?',
    },
    multiline = true,
    indent_lines = true,
    win_config = { border = 'rounded' },
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { 'lsp_definitions' },
    include_declaration = { 'lsp_references', 'lsp_implementations', 'lsp_definitions' },
    signs = {
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '',
    },
    use_diagnostic_signs = false,
  },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
    { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous Trouble/Quickfix Item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next Trouble/Quickfix Item',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
