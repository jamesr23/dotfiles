-- ~/.config/nvim/init.lua

--[[ vim object
    vim.g        global values
    vim.o        global options
    vim.opt?     oh no
    vim.wo       window options
    vim.bo       buffer options
    vim.fn       functions
    vim.api      collection of api functions
    vim.env      env variables
]]--

vim.o.binary = true -- bo?
vim.o.mouse = "a"
vim.o.tabstop = 4 -- bo?
vim.o.softtabstop = 4 -- bo?
vim.o.shiftwidth = 4 -- bo?
vim.o.expandtab = true -- bo?
vim.o.smartindent = true -- bo?
vim.o.exrc = true
vim.o.relativenumber = true --wo?
vim.o.number = true --wo?
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.wrap = false -- wo?
vim.o.swapfile = false -- bo?
vim.o.backup = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.cmdheight = 1
vim.o.updatetime = 50
vim.o.showmode = false
vim.o.completeopt="menuone,noinsert,noselect"
vim.o.clipboard = "unnamedplus"

vim.cmd("set shortmess +=c")
vim.cmd("syntax on")

require 'plugins'
require 'keymaps'
require 'colorscheme'
require 'lsp'
