-- Preferences <leader>p

-- print to make sure the file is being sourced
-- print 'Preferences loaded'

-- toggle line wrapping
vim.keymap.set('n', '<leader>pw', '<cmd>set wrap!<CR>', { desc = 'Toggle Line [W]rapping' })

-- toggle relative line numbers
vim.keymap.set('n', '<leader>pn', '<cmd>set relativenumber!<CR>', { desc = 'Toggle [N]umbering' })

-- toggle line numbers
vim.keymap.set('n', '<leader>pl', '<cmd>set number!<CR>', { desc = 'Toggle [L]ine Numbers' })
