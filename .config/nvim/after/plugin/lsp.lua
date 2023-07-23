local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = { set_sources = "recommended" }
})

-- autoformat (but disable python)
require("lsp-format").setup{
	python = {
		exclude = { "pylsp" }
	}
}

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	if client.supports_method("textDocument/formatting") then
		require("lsp-format").on_attach(client)
	end

	vim.keymap.set({ "n" }, "U", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
	vim.keymap.set({ "n", "x" }, "<F9>", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, { buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- html
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
	capabilities = capabilities,
}

lsp.setup()

-- custom cmp set up after lsp-zero
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" }
	},
	mapping = {
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	}
})

-- autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done()
)

-- formatting
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.djlint,
		null_ls.builtins.formatting.json_tool.with({
			command = "python3",
			args = { "-m", "json.tool", "--indent", "2" }
		}),
		null_ls.builtins.diagnostics.djlint
	}
})
