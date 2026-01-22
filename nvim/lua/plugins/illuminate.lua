-- vim-illuminate - Automatically highlights other uses of the word under the cursor
-- Uses LSP, Treesitter, or regex to identify references

return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    delay = 200, -- Delay in milliseconds
    large_file_cutoff = 2000, -- Number of lines at which to use large_file_config
    large_file_overrides = {
      providers = { 'lsp' },
    },
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
    filetypes_denylist = {
      'dirvish',
      'fugitive',
      'alpha',
      'NvimTree',
      'neo-tree',
      'packer',
      'neogitstatus',
      'Trouble',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
      'DressingSelect',
      'TelescopePrompt',
      'lazy',
      'mason',
      'notify',
      'noice',
    },
    under_cursor = true, -- Whether to illuminate under the cursor
    min_count_to_highlight = 1, -- Minimum number of matches required to highlight
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    -- Set highlight colors to match Catppuccin theme
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })

    -- Keymaps for navigating between references
    local function map(key, dir, buffer)
      vim.keymap.set('n', key, function()
        require('illuminate')['goto_' .. dir .. '_reference'](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
    end

    map(']]', 'next')
    map('[[', 'prev')

    -- Also set up keymaps when attaching to a buffer
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map(']]', 'next', buffer)
        map('[[', 'prev', buffer)
      end,
    })
  end,
  keys = {
    { ']]', desc = 'Next Reference' },
    { '[[', desc = 'Prev Reference' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
