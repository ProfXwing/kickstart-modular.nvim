return {
  'ggandor/leap.nvim',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    local leap = require 'leap'
    leap.add_default_mappings(true)
  end,
}
