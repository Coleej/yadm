-- leaders --
vim.g.mapleader = ";"
vim.g.localleader = "\'"


-- editting --
vim.keymap.set({ "i", "v"}, ";;", "<Esc>", { noremap = true })
vim.keymap.set({ "i", "v"}, "<Esc>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Right>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("n", "H", "0", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true})
vim.keymap.set("n", "J", "<c-f>", { noremap = true })
vim.keymap.set("n", "K", "<c-b>", { noremap = true })


-- buffers --
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[B", ":bfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]B", ":blast<CR>", { noremap = true, silent = true })


-- tabs --
vim.keymap.set("n", "[g", ":tabp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]g", ":tabn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[G", ":tabl<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]G", ":tabfir<CR>", { noremap = true, silent = true })


-- windows --
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<leader>hw", "<C-w>t>C-w>K", { silent = true })
vim.keymap.set("n", "<leader>vw", "<C-w>t>C-w>H", { silent = true })
