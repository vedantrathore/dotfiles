-- Neotest: A framework for interacting with tests within Neovim
-- Supports Go, Python, JavaScript/TypeScript, Rust, and more
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Test adapters
    'nvim-neotest/neotest-go',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
    'rouge8/neotest-rust',
  },
  keys = {
    { '<leader>nr', function() require('neotest').run.run() end, desc = '[N]eotest [R]un nearest' },
    { '<leader>nf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[N]eotest run [F]ile' },
    { '<leader>nd', function() require('neotest').run.run { strategy = 'dap' } end, desc = '[N]eotest [D]ebug nearest' },
    { '<leader>ns', function() require('neotest').run.stop() end, desc = '[N]eotest [S]top' },
    { '<leader>na', function() require('neotest').run.attach() end, desc = '[N]eotest [A]ttach' },
    { '<leader>no', function() require('neotest').output.open { enter = true } end, desc = '[N]eotest [O]utput' },
    { '<leader>np', function() require('neotest').output_panel.toggle() end, desc = '[N]eotest output [P]anel' },
    { '<leader>nm', function() require('neotest').summary.toggle() end, desc = '[N]eotest su[M]mary' },
    { '<leader>nw', function() require('neotest').watch.toggle(vim.fn.expand '%') end, desc = '[N]eotest [W]atch file' },
    { '[n', function() require('neotest').jump.prev { status = 'failed' } end, desc = 'Prev failed test' },
    { ']n', function() require('neotest').jump.next { status = 'failed' } end, desc = 'Next failed test' },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-go' {
          experimental = {
            test_table = true,
          },
          args = { '-count=1', '-timeout=60s' },
        },
        require 'neotest-python' {
          dap = { justMyCode = false },
          args = { '--log-level', 'DEBUG' },
          runner = 'pytest',
        },
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'jest.config.js',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
        require 'neotest-vitest',
        require 'neotest-rust' {
          args = { '--no-capture' },
        },
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          vim.cmd 'copen'
        end,
      },
      icons = {
        running_animated = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
      },
    }
  end,
}
