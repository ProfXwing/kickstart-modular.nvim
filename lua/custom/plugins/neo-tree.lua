return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = false,
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        hijack_netrw_behavior = 'open_current',
      },
    }
  end,
  keys = {
    { '<leader>wt', ':Neotree toggle<CR>', desc = 'Toggle Neotree' },
  },
}
