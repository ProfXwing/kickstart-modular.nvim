return {
  'edluffy/hologram.nvim',
  event = 'VeryLazy',
  config = function()
    require('hologram').setup {}
  end,
}
