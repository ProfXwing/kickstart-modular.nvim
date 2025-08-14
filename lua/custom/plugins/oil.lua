return {
  'stevearc/oil.nvim',
  event = 'VimEnter',
  opts = {
    delete_to_trash = true,
    default_file_explorer = true,
  },
  config = function(_, opts)
    require('oil').setup(opts)

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        -- Check if no files are opened and the current directory is a directory
        if vim.fn.argc() == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
          require('oil').open()
        end
      end,
    })
  end,
  enabled = true,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- Keybindings
    { '<leader>wp', '<cmd>Oil<CR>', desc = 'Open filetree' },
  },
}
