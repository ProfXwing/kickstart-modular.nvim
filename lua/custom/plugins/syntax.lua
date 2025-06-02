return {
  'syntax-nvim',
  dir = '~/src/profxwing/syntax-nvim',
  config = function()
    require('syntax-nvim').setup {
      keymap = '<leader>ha',
    }
  end,
}
