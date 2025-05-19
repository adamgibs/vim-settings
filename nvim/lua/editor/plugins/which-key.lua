return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "classic",
		loop = true,
		win = {
			padding = { 1, 1 },
			height = { min = 2, max = 80, },
		},
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "a", mode = { "n", "v" } },
			{ "<leader>", mode = { "n", "v" } },
		},
		layout = {
			width = { min = 1, max = 40, },
			spacing = 1,
		},
		expand = 2,
	},
	keys = {
		{
			"<leader>?",
			function()
			require("which-key").show({ global = false})
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
