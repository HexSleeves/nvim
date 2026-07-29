return {
	{
		"theamallalgi/zitchdog",
		lazy = true,
		event = "VeryLazy",
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
