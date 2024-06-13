return {
  'klen/nvim-config-local',
  event = 'VeryLazy',
  config = function()
    require('config-local').setup {}
  end,
}
