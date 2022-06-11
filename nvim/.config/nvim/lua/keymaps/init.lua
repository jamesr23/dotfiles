vim.g.mapleader = ' '

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", "gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":Lex 40<cr>", { noremap = true })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<a-k>", ":m .-2<cr>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<a-j>", ":m .+1<cr>==", { noremap = true })
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true })

vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<a-j>", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<a-k>", ":move '<-2<CR>gv-gv", { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true});
