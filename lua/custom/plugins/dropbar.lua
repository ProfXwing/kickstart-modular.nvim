return {
  'Bekaboo/dropbar.nvim',
  event = 'VeryLazy',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>wd', ":lua require('dropbar.api').pick()<CR>", { noremap = true, silent = true })
  end,
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },
}
