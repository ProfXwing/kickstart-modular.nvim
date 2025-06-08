return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  enabled = true,
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      tab = {
        sync = {
          open = true,
          close = true,
          ignore = {},
        },
      },
      filters = {
        git_ignored = false,
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del('n', '<C-e>', { buffer = bufnr })
      end,
    }
  end,
  keys = {
    { '<leader>wt', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
  },
}
