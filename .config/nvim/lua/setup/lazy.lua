-- This file can be loaded by calling `lua require("plugins")` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Vimwiki [need to set options before loading plugin]
vim.g.vimwiki_folding = "syntax"
local wiki_root = { path = "~/Nextcloud/vimwiki", path_html = "~/Nextcloud/vimwiki/html" }
vim.g.vimwiki_list = { wiki_root }

-- don't know why. it was in a video
vim.g.mapleader = ";"

local plugins = {

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},

	"hiphish/nvim-ts-rainbow2",
	"nvim-treesitter/nvim-treesitter-context",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } }
	},

	-- misc
	"chrisbra/csv.vim",
	"vimwiki/vimwiki",

	-- color schemes
	"marko-cerovac/material.nvim",

	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",

	-- LSP
	"lukas-reineke/lsp-format.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{                         -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },      -- Required
			{ "hrsh7th/cmp-nvim-lsp" },  -- Required
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" }, -- optional
			{ "hrsh7th/cmp-buffer" },    -- optional
			{ "hrsh7th/cmp-path" },      -- optional
		}
	},

	"rafamadriz/friendly-snippets",
	"jose-elias-alvarez/null-ls.nvim",

	-- autopairs
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
	},

	-- tpope
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-unimpaired"

}

require("lazy").setup(plugins, {})
