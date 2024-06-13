return {
  'stevearc/oil.nvim',
  opts = {},
  enabled = false,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- Keybindings
    { '<leader>wp', '<cmd>Oil<CR>', desc = 'Open filetree' },
  },
}
