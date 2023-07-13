local create_autocmd = vim.api.nvim_create_autocmd

-- terminal
create_autocmd({"TermOpen"}, { pattern = "*", command = "startinsert" })
create_autocmd({"TermClose"}, { pattern = "*", command = "bd!" })
