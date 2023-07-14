-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use("hiphish/nvim-ts-rainbow2")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } }
	}

	-- misc
	use "chrisbra/csv.vim"

	-- color schemes
	use "marko-cerovac/material.nvim"

	-- nvim-tree
	use "nvim-tree/nvim-tree.lua"
	use "nvim-tree/nvim-web-devicons"

	-- LSP
	use "lukas-reineke/lsp-format.nvim"
	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{                         -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },      -- Required
			{ "hrsh7th/cmp-nvim-lsp" },  -- Required
			{ "L3MON4D3/LuaSnip" },      -- Required
			{ "saadparwaiz1/cmp_luasnip" }, -- optional
			{ "hrsh7th/cmp-buffer" },    -- optional
			{ "hrsh7th/cmp-path" },      -- optional
		}
	}

	-- autopairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true }
	}

	-- tpope
	use "tpope/vim-fugitive"
	use "tpope/vim-surround"
end)
