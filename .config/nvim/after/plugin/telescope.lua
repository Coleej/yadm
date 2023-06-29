local builtin = require('telescope.builtin')
local set = vim.keymap.set

set("n", "<leader>ff", builtin.find_files, {})
set("n", "<leader>fg", builtin.git_files, {})
set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
