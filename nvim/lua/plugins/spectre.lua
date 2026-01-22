-- Spectre for project-wide find and replace
return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>S',
      function()
        require('spectre').toggle()
      end,
      desc = '[S]pectre: Toggle search/replace',
    },
    {
      '<leader>sw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      desc = '[S]pectre: Search current [w]ord',
    },
    {
      '<leader>sw',
      function()
        require('spectre').open_visual()
      end,
      mode = 'v',
      desc = '[S]pectre: Search selection',
    },
    {
      '<leader>sp',
      function()
        require('spectre').open_file_search { select_word = true }
      end,
      desc = '[S]pectre: Search in current file',
    },
  },
  opts = {
    open_cmd = 'noswapfile vnew',
  },
}
