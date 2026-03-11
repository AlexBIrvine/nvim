require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		-- ["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},
})
