local terminal_keys = {
  { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = '[T]oggle Terminal' },
  { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', desc = 'Toggle [F]loating Terminal' },
  { '<leader>thh', '<cmd>ToggleTerm direction=horizontal size=12<CR>', desc = 'Toggle Horizontal Terminal' },
  { '<leader>tvv', '<cmd>ToggleTerm direction=vertical size=40<CR>', desc = 'Toggle Vertical Terminal' },
  { '<leader>tnn', '<cmd>ToggleTerm direction=tab<CR>', desc = 'Toggle Terminal in New Tab' },
}

for i = 0, 9 do
  -- Add 10 options for horizontal terminals
  table.insert(terminal_keys, { '<leader>th' .. i, '<cmd>ToggleTerm ' .. i .. ' direction=horizontal size=12<CR>', desc = 'Toggle Horizontal Terminal ' .. i })

  -- Add 10 options for vertical terminals
  table.insert(terminal_keys, { '<leader>tv' .. i, '<cmd>ToggleTerm ' .. i .. ' direction=vertical size=40<CR>', desc = 'Toggle Vertical Terminal ' .. i })

  -- Add 10 options for tab terminals
  table.insert(terminal_keys, { '<leader>tn' .. i, '<cmd>ToggleTerm ' .. i .. ' direction=tab<CR>', desc = 'Toggle Terminal in Tab ' .. i })
end

return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  version = '*',
  config = true,
  keys = terminal_keys,
}
