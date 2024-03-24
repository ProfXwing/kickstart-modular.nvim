return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-Enter>',
          next = '<C-]>',
          prev = '<C-[>',
          dismiss = '<Esc>',
        },
      },
    }
  end,
}
