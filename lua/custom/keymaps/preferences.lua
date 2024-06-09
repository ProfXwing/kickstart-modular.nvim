-- Preferences <leader>p

-- print to make sure the file is being sourced
-- print 'Preferences loaded'

-- toggle line wrapping
vim.keymap.set('n', '<leader>plw', '<cmd>set wrap!<CR>', { desc = 'Toggle Line [W]rapping' })

-- toggle relative line numbers
vim.keymap.set('n', '<leader>plr', '<cmd>set relativenumber!<CR>', { desc = 'Toggle [R]elative Numbering' })

-- toggle line numbers
vim.keymap.set('n', '<leader>pln', '<cmd>set number!<CR>', { desc = 'Toggle Line [N]umbers' })

-- toggle whitespace characters
vim.keymap.set('n', '<leader>pw', '<cmd>set list!<CR>', { desc = 'Toggle [W]hitespace Characters' })
