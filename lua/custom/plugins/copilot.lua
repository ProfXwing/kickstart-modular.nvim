return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  dependencies = {
    { 'svermeulen/vimpeccable' },
  },
  event = 'InsertEnter',
  enabled = false,
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
        keymap = {
          next = '<C-]>',
          prev = '<C-[>',
          dismiss = '<Esc>',
        },
      },
      filetypes = {
        go = false,
      },
    }

    vim.keymap.set('i', '<Tab>', function()
      if require('copilot.suggestion').is_visible() then
        require('copilot.suggestion').accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
      end
    end)
  end,
}
