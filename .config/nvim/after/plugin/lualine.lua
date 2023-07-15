local function split(input, delimiter)
	local arr = {}
	_ = string.gsub(input, '[^' .. delimiter .. ']+', function(w) table.insert(arr, w) end)
	return arr
end

local function get_venv()
	local venv = vim.env.VIRTUAL_ENV
	if venv then
		local params = split(venv, '/')
		return '(venv:' .. params[#params] .. ')'
	else
		return ''
	end
end

require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "everforest",
		component_separators = { left = "", right = "" }, -- 
		section_separators = { left = "", right = "" }, --   
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { get_venv, "filetype", "fileformat", "encoding" },
		lualine_y = { "progress" },
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "fugitive", "nvim-tree" }
}
