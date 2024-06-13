-- I really like the idea of this plugin,
-- but lacking configurable plugin path means I won't use it.
-- Check back later to see if it's been updated.
--
-- TODO: Delete plugin if it remains unused
return {
  'roobert/activate.nvim',
  event = 'VeryLazy',
  enabled = false,
  keys = {
    {
      '<leader>pp',
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = '[P]lugins',
    },
  },
  dependencies = {
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
}
