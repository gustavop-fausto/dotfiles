return {
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
				terminal_colors = true,
			})

			vim.cmd("colorscheme monokai-pro")

			vim.api.nvim_set_hl(0, "@variable", { fg = "#d4d4d4" })
			vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#9cdcfe" })
			vim.api.nvim_set_hl(0, "@variable.member", { fg = "#d4d4d4" })
			vim.api.nvim_set_hl(0, "@string", { fg = "#ce9178" })
			vim.api.nvim_set_hl(0, "@number", { fg = "#b5cea8" })
			vim.api.nvim_set_hl(0, "@comment", { fg = "#6a9955", italic = true })
		end,
	},
}
