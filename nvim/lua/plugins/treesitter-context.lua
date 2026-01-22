-- nvim-treesitter-context - Shows sticky function headers while scrolling
-- Displays the current function/class/method context at the top of the screen

return {
  'nvim-treesitter/nvim-treesitter-context',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    enable = true,
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  },
  keys = {
    {
      '[c',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      desc = 'Go to context',
      silent = true,
    },
  },
  config = function(_, opts)
    require('treesitter-context').setup(opts)

    -- Set highlight colors to match Catppuccin theme
    vim.api.nvim_set_hl(0, 'TreesitterContext', { link = 'CursorLine' })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = 'LineNr' })
    vim.api.nvim_set_hl(0, 'TreesitterContextSeparator', { link = 'Comment' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
