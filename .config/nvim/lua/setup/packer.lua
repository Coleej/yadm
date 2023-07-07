-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
	
	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("hiphish/nvim-ts-rainbow2")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- misc
	use "chrisbra/csv.vim"

	-- color schemes
	use "marko-cerovac/material.nvim"

	-- nvim-tree
	use "nvim-tree/nvim-tree.lua"
	use "nvim-tree/nvim-web-devicons"

	-- LSP
	use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
  	}
	}	

end)
