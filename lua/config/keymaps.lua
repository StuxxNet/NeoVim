-- Defining the leader key
vim.g.mapleader = " "

-- Start the remapping of some of the shortcuts
vim.keymap.set('n', '<leader><leader>e', '$', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>b', '^', { noremap = true, silent = true })
