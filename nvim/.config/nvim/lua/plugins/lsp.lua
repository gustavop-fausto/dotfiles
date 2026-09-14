-- lua/plugins/lsp.lua
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "pyright", "ts_ls", "bashls" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-lspconfig.nvim",
			"cmp-nvim-lsp",
		},
		config = function()
			-- capabilities estendidas pro cmp-nvim-lsp (antes não existia isso)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- removido o vim.defer_fn(..., 50) que atrasava o enable
			-- e fazia o LSP não anexar no primeiro buffer aberto
			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"ts_ls",
				"gopls",
				"bashls",
			})

			-- diagnostics explícitos em vez de depender só do default
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
