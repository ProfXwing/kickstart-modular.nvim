return {
  'chomosuke/typst-preview.nvim',
  event = 'VeryLazy',
  lazy = true,
  version = '0.3.*',
  build = function()
    require('typst-preview').update()
  end,
}
