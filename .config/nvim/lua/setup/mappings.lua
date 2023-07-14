local set = vim.keymap.set
local _nmap = { noremap = true }
local _nmap_silent = { noremap = true, silent = true }
local _silent = { silent = true }


-- leaders
vim.g.mapleader = ";"
vim.g.localleader = "\'"


-- editting
set({ "i", "v" }, ";;", "<Esc>", _nmap)
set({ "i", "v" }, "<Esc>", "<nop>", _nmap)
set("", "<Left>", "<nop>", _nmap)
set("", "<Right>", "<nop>", _nmap)
set("", "<Down>", "<nop>", _nmap)
set("", "<Up>", "<nop>", _nmap)
set("", "H", "0", _nmap)
set("", "L", "$", _nmap)
set("", "<C-d>", "<C-d>zz", _nmap)
set("", "<C-u>", "<C-u>zz", _nmap)


-- buffers
set("n", "[b", ":bprevious<CR>", _nmap_silent)
set("n", "]b", ":bnext<CR>", _nmap_silent)
set("n", "[B", ":bfirst<CR>", _nmap_silent)
set("n", "]B", ":blast<CR>", _nmap_silent)


-- tabs
set("n", "[g", ":tabp<CR>", _nmap_silent)
set("n", "]g", ":tabn<CR>", _nmap_silent)
set("n", "[G", ":tabl<CR>", _nmap_silent)
set("n", "]G", ":tabfir<CR>", _nmap_silent)


-- windows
set("n", "<C-h>", ":wincmd h<CR>", _silent)
set("n", "<C-k>", ":wincmd k<CR>", _silent)
set("n", "<C-j>", ":wincmd j<CR>", _silent)
set("n", "<C-l>", ":wincmd l<CR>", _silent)
set("i", "<C-l>", "<C-\\><C-N><C-w>l", _nmap)
set("i", "<C-h>", "<C-\\><C-N><C-w>h", _nmap)
set("i", "<C-k>", "<C-\\><C-N><C-w>k", _nmap)
set("i", "<C-j>", "<C-\\><C-N><C-w>j", _nmap)

set("n", "<leader>hw", "<C-w>t>C-w>K", _silent)
set("n", "<leader>vw", "<C-w>t>C-w>H", _silent)


-- terminal
set("n", "<leader>t", ":execute 'bel 15split term://fish'<CR>", _nmap_silent)
set("n", "<leader>vt", ":execute 'vsplit term://fish'<CR>", _nmap_silent)
set("t", "]g", "<C-\\><C-N>:tabn<CR>", _nmap)
set("t", "[g", "<C-\\><C-N>:tabp<CR>", _nmap)
set("t", "]b", "<C-\\><C-N>:bnext<CR>", _nmap)
set("t", "[b", "<C-\\><C-N>:bprev<CR>", _nmap)
set("t", "<C-l>l", "<C-\\><C-N><C-w>l", _nmap)
set("t", "<C-h>", "<C-\\><C-N><C-w>h", _nmap)
set("t", "<C-k>", "<C-\\><C-N><C-w>k", _nmap)
set("t", "<C-j>", "<C-\\><C-N><C-w>j", _nmap)


-- command
set("c", "<C-p>", "<Up>", _nmap)
set("c", "<C-n>", "<Down>", _nmap)


-- move
set("v", "J", ":m '>+1<CR>gv=gv", _nmap_silent)
set("v", "K", ":m '<-2<CR>gv=gv", _nmap_silent)


-- search
set("n", "n", "nzzzv", _silent)
set("n", "N", "NzzzN", _silent)
