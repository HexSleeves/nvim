return {
	{
		"theamallalgi/zitchdog",
		lazy = false,
		priority = 1000,
		dependencies = { "folke/snacks.nvim" },
		opts = {
			variant = "grape",
		},
		config = function(_, opts)
			require("zitchdog").setup(opts)
			require("zitchdog").load()
		end,
	},
}
