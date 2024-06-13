return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  keys = {
    { '<leader>lrf', '<Cmd>TSToolsRenameFile<CR>', desc = '[R]ename [F]ile' },
  },
}
