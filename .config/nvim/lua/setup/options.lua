local set = vim.opt
local g = vim.g

set.shell = "/bin/bash"
set.belloff = "all"
set.smartcase = true
set.linebreak = true

set.ts = 2
set.sw = 2

set.diffopt:append({ "vertical", "indent-heuristic" })

set.foldmethod = "expr"

set.nu = true
set.relativenumber = true

set.hlsearch = false
set.incsearch = true

set.updatetime = 50

set.scrolloff = 8

g.python3_host_prog = "~/.config/virtualenvs/pynvim/bin/python3"
