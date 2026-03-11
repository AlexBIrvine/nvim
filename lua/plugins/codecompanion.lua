require("codecompanion").setup({
	adapters = {
		anthropic = function()
			return require("codecompanion.adapters").extend("anthropic", {
				env = {
					api_key = "cmd:echo $ANTHROPIC_API_KEY",
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "anthropic",
		},
		inline = {
			adapter = "anthropic",
		},
	},
	opts = {
		system_prompt = function()
			local project_file = vim.fn.getcwd() .. "/PROJECT"
			local f = io.open(project_file, "r")
			if f then
				local content = f:read("*all")
				f:close()
				return "You are a coding assistant. Here is the PROJECT file describing the current project goals and progress:\n\n"
					.. content
			end
			return "You are a coding assistant."
		end,
	},
})
