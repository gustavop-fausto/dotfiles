return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	opts = {
		indent = {
			char = "│",
		},

		scope = {
			enabled = false,
		},
	},

	config = function(_, opts)
		require("ibl").setup(opts)

		vim.api.nvim_set_hl(0, "IblIndent", {
			fg = "#252526",
		})
	end,
}
