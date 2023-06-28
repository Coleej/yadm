local set = vim.opt

set.shell = "/bin/bash"
set.belloff = "all"
set.smartcase = true
set.linebreak = true

set.ts = 2
set.sw = 2

set.diffopt:append({ "vertical", "indent-heuristic" })

set.foldmethod = "expr"
