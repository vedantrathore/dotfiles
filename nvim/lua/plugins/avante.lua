-- Avante.nvim: Cursor-like AI experience in Neovim
-- Provides inline AI editing, chat sidebar, and code generation
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Use latest
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua', -- For copilot provider
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
        },
      },
    },
    'MeanderingProgrammer/render-markdown.nvim', -- Configured separately
  },
  keys = {
    { '<leader>ia', function() require('avante.api').ask() end, desc = 'Avante: Ask AI', mode = { 'n', 'v' } },
    { '<leader>ie', function() require('avante.api').edit() end, desc = 'Avante: Edit selection', mode = 'v' },
    { '<leader>ir', function() require('avante.api').refresh() end, desc = 'Avante: Refresh' },
    { '<leader>it', '<cmd>AvanteToggle<cr>', desc = 'Avante: Toggle sidebar' },
    { '<leader>if', '<cmd>AvanteFocus<cr>', desc = 'Avante: Focus sidebar' },
  },
  opts = {
    provider = 'claude', -- Use Claude as default
    auto_suggestions_provider = 'copilot', -- Use Copilot for suggestions
    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-sonnet-4-20250514',
      temperature = 0,
      max_tokens = 4096,
    },
    openai = {
      endpoint = 'https://api.openai.com/v1',
      model = 'gpt-4o',
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      auto_suggestions = false, -- Disable auto suggestions (use Copilot instead)
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },
    mappings = {
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
    hints = { enabled = true },
    windows = {
      position = 'right',
      wrap = true,
      width = 40,
      sidebar_header = {
        align = 'center',
        rounded = true,
      },
    },
    highlights = {
      diff = {
        current = 'DiffText',
        incoming = 'DiffAdd',
      },
    },
    diff = {
      autojump = true,
      list_opener = 'copen',
    },
  },
}
