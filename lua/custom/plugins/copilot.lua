return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'VeryLazy',
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
      filetypes = {
        go = false,
      },
    }
  end,
}
