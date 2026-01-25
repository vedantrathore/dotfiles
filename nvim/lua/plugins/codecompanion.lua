-- CodeCompanion: AI-powered coding assistant for Neovim
-- Supports multiple LLM providers (Anthropic, OpenAI, etc.)
return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
  },
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions', 'CodeCompanionToggle' },
  keys = {
    { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = '[A]I [A]ctions' },
    { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = '[A]I [C]hat toggle' },
    { '<leader>ae', '<cmd>CodeCompanion /explain<cr>', mode = 'v', desc = '[A]I [E]xplain selection' },
    { '<leader>af', '<cmd>CodeCompanion /fix<cr>', mode = 'v', desc = '[A]I [F]ix selection' },
    { '<leader>al', '<cmd>CodeCompanion /lsp<cr>', mode = { 'n', 'v' }, desc = '[A]I [L]SP diagnostics' },
    { '<leader>at', '<cmd>CodeCompanion /tests<cr>', mode = 'v', desc = '[A]I generate [T]ests' },
    { '<leader>ad', '<cmd>CodeCompanion /doc<cr>', mode = 'v', desc = '[A]I generate [D]ocs' },
    { 'ga', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'Add selection to AI chat' },
  },
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
        },
        agent = {
          adapter = 'anthropic',
        },
      },
      adapters = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = 'ANTHROPIC_API_KEY',
            },
            schema = {
              model = {
                default = 'claude-sonnet-4-20250514',
              },
            },
          })
        end,
      },
      display = {
        chat = {
          window = {
            layout = 'vertical',
            width = 0.4,
          },
          show_settings = true,
        },
        diff = {
          provider = 'mini_diff',
        },
      },
      opts = {
        log_level = 'ERROR',
        send_code = true,
        use_default_actions = true,
        use_default_prompt_library = true,
      },
    }
  end,
}
