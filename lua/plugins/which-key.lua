local wk = require("which-key")

wk.setup({
	preset = "modern",
	delay = 300,
})

wk.add({
	-- ---------------------------------------------------------
	--                      Groups
	-- ---------------------------------------------------------
	{ "<leader>l", group = "LSP" },
	{ "<leader>f", group = "Find" },
	{ "<leader>F", group = "Find (location)" },
	{ "<leader>g", group = "Grep" },

	-- ---------------------------------------------------------
	--                      LSP
	-- ---------------------------------------------------------
	{ "<leader>ld", desc = "Definition" },
	{ "<leader>lD", desc = "Declaration" },
	{ "<leader>lr", desc = "References" },
	{ "<leader>li", desc = "Implementation" },
	{ "<leader>lh", desc = "Hover docs" },
	{ "<leader>ln", desc = "Rename" },
	{ "<leader>la", desc = "Code actions" },
	{ "<leader>le", desc = "Diagnostic float" },
	{ "<leader>lk", desc = "Previous diagnostic" },
	{ "<leader>lj", desc = "Next diagnostic" },

	-- ---------------------------------------------------------
	--                   Fuzzy / Grep
	-- ---------------------------------------------------------
	{ "<leader>f", desc = "Find files (cwd)" },
	{ "<leader>Fh", desc = "Find files (home)" },
	{ "<leader>Fc", desc = "Find files (.config)" },
	{ "<leader>Fl", desc = "Find files (.local/src)" },
	{ "<leader>Ff", desc = "Find files (above)" },
	{ "<leader>Fr", desc = "Resume last search" },
	{ "<leader>g", desc = "Grep" },
	{ "<leader>G", desc = "Grep word under cursor" },

	-- ---------------------------------------------------------
	--                      Buffers
	-- ---------------------------------------------------------
	{ "<leader>q", desc = "Quit" },
	{ "<leader>Q", desc = "Force close buffer" },
	{ "<leader>U", desc = "Close all buffers" },

	-- ---------------------------------------------------------
	--                  Code Companion
	-- ---------------------------------------------------------
	{ "<leader>a", group = "AI" },
	{ "<leader>ac", desc = "Open chat" },
	{ "<leader>aa", desc = "Add buffer to chat" },
	{ "<leader>ai", desc = "Inline assist" },
	-- ---------------------------------------------------------
	--                      Misc
	-- ---------------------------------------------------------
	{ "<leader>t", desc = "File explorer" },
	{ "<leader>P", desc = "Plugin install" },
	{ "<leader>z", desc = "Floating terminal" },
	{ "<leader>T", desc = "Better terminal" },
	{ "<leader>s", desc = "Save" },
	{ "<leader>R", desc = "Reload config" },
	{ "<leader>rc", desc = "Run code" },
})
