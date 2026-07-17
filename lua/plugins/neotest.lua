require("neotest").setup({
	adapters = {
		require("neotest-go"),
		require("neotest-python")({
			runner = "pytest",
		}),
		require("neotest-jest")({
			jestCommand = "bun test",
			jestConfigFile = "bunfig.toml",
		}),
		require("neotest-busted")({
			busted_command = "/usr/bin/busted",
			busted_args = { "--output", "json" },
		}),
	},
	output = {
		enabled = true,
		open_on_run = true,
	},
	status = {
		enabled = true,
		signs = true,
		virtual_text = false,
	},
	icons = {
		passed = "✓",
		failed = "✗",
		running = "↻",
		skipped = "↷",
		unknown = "?",
	},
})
