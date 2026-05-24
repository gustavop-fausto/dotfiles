return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.config",

		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"go",
				"java",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.config").setup(opts)

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "@variable", { link = "Identifier", force = true })
					vim.api.nvim_set_hl(0, "@variable.parameter", { link = "Identifier", force = true })
					vim.api.nvim_set_hl(0, "@variable.member", { link = "Identifier", force = true })

					vim.api.nvim_set_hl(0, "@type", { link = "Type", force = true })
					vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type", force = true })
					
					vim.api.nvim_set_hl(0, "@function", { link = "Function", force = true })
					vim.api.nvim_set_hl(0, "@function.call", { link = "Function", force = true })
					vim.api.nvim_set_hl(0, "@method", { link = "Function", force = true })
					vim.api.nvim_set_hl(0, "@method.call", { link = "Function", force = true })
				end,
			})
			vim.api.nvim_exec_autocmds("ColorScheme", {})
		end,
	},
}

