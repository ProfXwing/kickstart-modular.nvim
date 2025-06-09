-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-n>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-e>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-u>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Close other windows using :only
vim.keymap.set('n', '<leader>wo', '<cmd>only<CR>', { desc = 'Close all other windows' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- TODO: add a check for macos with different keybinds in windows/linux

-- Delete words backward/forward
vim.keymap.set('i', '<A-BS>', '<C-w>', { noremap = true })
vim.keymap.set('i', '<A-Del>', '<C-o>dw', { noremap = true })

-- Move cursor one word backward/forward
vim.keymap.set({ 'n', 'v', 'i' }, '<A-Left>', '<C-o>b', { noremap = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<A-Right>', '<C-o>w', { noremap = true })

-- Shift + arrow keys start selection
vim.keymap.set({ 'n', 'i' }, '<S-Left>', '<Esc>vh', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<S-Right>', '<Esc>vl', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<S-Up>', '<Esc>vk', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<S-Down>', '<Esc>vj', { noremap = true })

-- Move forward/back a word in all modes with Alt Left/Right (changes due to iTerm)
vim.keymap.set({ 'n', 'v' }, '<A-f>', 'w', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<A-b>', 'b', { noremap = true })
vim.keymap.set({ 'i' }, '<A-f>', '<cmd>normal w<CR>', { noremap = true })
vim.keymap.set({ 'i' }, '<A-b>', '<cmd>normal b<CR>', { noremap = true })

-- Move lines up/down
vim.keymap.set('i', '<A-Up>', '<cmd>move -2<CR>', { noremap = true })
vim.keymap.set('i', '<A-Down>', '<cmd>move +1<CR>', { noremap = true })

-- Unindent line and move caret left by tab amount
vim.keymap.set('i', '<S-Tab>', '<C-d>', { noremap = true })

-- Move naturally through textwrapped lines
vim.api.nvim_set_keymap('n', '<Up>', 'v:count == 0 ? "g<Up>" : "<Up>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'v:count == 0 ? "g<Down>" : "<Down>"', { expr = true, noremap = true })

-- Move selected lines up/down
vim.api.nvim_set_keymap('x', '<A-Up>', ":move '<-2'<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<A-Down>', ":move '>+1'<CR>gv-gv", { noremap = true, silent = true })

-- Move prev/next in cursor history
vim.keymap.set('n', '<C-y>', '<C-i>')
vim.keymap.set('n', '<C-l>', '<C-o>')

-- Toggle line wrapping
vim.keymap.set('n', '<leader>plw', '<cmd>set wrap!<CR>', { desc = 'Toggle Line [W]rapping' })

-- Toggle relative line numbers
vim.keymap.set('n', '<leader>plr', '<cmd>set relativenumber!<CR>', { desc = 'Toggle [R]elative Numbering' })

-- Toggle line numbers
vim.keymap.set('n', '<leader>pln', '<cmd>set number!<CR>', { desc = 'Toggle Line [N]umbers' })

-- Toggle whitespace characters
vim.keymap.set('n', '<leader>pw', '<cmd>set list!<CR>', { desc = 'Toggle [W]hitespace Characters' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = false
  end
end, { desc = 'Disable autoformat-on-save', bang = true })

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Enable autoformat-on-save',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand '%:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
