-- render-markdown.nvim: Better markdown rendering in buffer
-- Renders markdown with proper formatting, code blocks, tables, etc.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ft = { 'markdown', 'Avante', 'codecompanion' },
  opts = {
    file_types = { 'markdown', 'Avante', 'codecompanion' },
    render_modes = { 'n', 'v', 'i', 'c' },
    heading = {
      enabled = true,
      sign = true,
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    code = {
      enabled = true,
      sign = true,
      style = 'full',
      position = 'left',
      width = 'full',
      left_pad = 2,
      right_pad = 2,
      border = 'thin',
      above = '▄',
      below = '▀',
      highlight = 'RenderMarkdownCode',
      highlight_inline = 'RenderMarkdownCodeInline',
    },
    bullet = {
      enabled = true,
      icons = { '●', '○', '◆', '◇' },
      highlight = 'RenderMarkdownBullet',
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = '󰄱 ', highlight = 'RenderMarkdownUnchecked' },
      checked = { icon = '󰱒 ', highlight = 'RenderMarkdownChecked' },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
      },
    },
    quote = {
      enabled = true,
      icon = '▋',
      repeat_linebreak = true,
      highlight = 'RenderMarkdownQuote',
    },
    pipe_table = {
      enabled = true,
      preset = 'round',
      style = 'full',
      cell = 'padded',
    },
    callout = {
      note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
      tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
      important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
      warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
      caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
    },
    link = {
      enabled = true,
      image = '󰥶 ',
      email = '󰀓 ',
      hyperlink = '󰌹 ',
      highlight = 'RenderMarkdownLink',
    },
    sign = {
      enabled = true,
      highlight = 'RenderMarkdownSign',
    },
    win_options = {
      conceallevel = { default = 0, rendered = 2 },
      concealcursor = { default = '', rendered = '' },
    },
  },
  keys = {
    { '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', desc = '[T]oggle [M]arkdown render' },
  },
}
