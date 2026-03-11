require("nvim-treesitter").setup({

	ensure_installed = {
		"bash",
		"c",
		"css",
		"cpp",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"tsx",
		"typescript",
		"zig",
		"scheme",
		"ron",
	},

	-- ---------------------------------------------------------
	--                      Highlight
	-- ---------------------------------------------------------
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	-- ---------------------------------------------------------
	--                 Incremental Selection
	--          (must live here, not in mappings.lua)
	-- ---------------------------------------------------------
	incremental_selection = {
		enable = true,

		keymaps = {
			init_selection = "<leader>v",
			node_incremental = "<leader>v",
			scope_incremental = "<leader>V",
			node_decremental = "<bs>",
		},
	},

	-- ---------------------------------------------------------
	--                    Text Objects
	--          (must live here, not in mappings.lua)
	--
	--   Select:   af/if  function outer/inner
	--             ac/ic  class outer/inner
	--             aa/ia  argument outer/inner
	--             ab/ib  block outer/inner
	--
	--   Move:     ]f/[f  next/prev function start
	--             ]F/[F  next/prev function end
	--             ]c/[c  next/prev class start
	--             ]C/[C  next/prev class end
	--             ]a/[a  next/prev argument
	--             ]b/[b  next/prev block
	--
	--   Swap:     <leader>sa  swap argument with next
	--             <leader>sA  swap argument with previous
	-- ---------------------------------------------------------
	textobjects = {

		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				["af"] = { query = "@function.outer", desc = "Select outer function" },
				["if"] = { query = "@function.inner", desc = "Select inner function" },
				["ac"] = { query = "@class.outer", desc = "Select outer class" },
				["ic"] = { query = "@class.inner", desc = "Select inner class" },
				["aa"] = { query = "@parameter.outer", desc = "Select outer argument" },
				["ia"] = { query = "@parameter.inner", desc = "Select inner argument" },
				["ab"] = { query = "@block.outer", desc = "Select outer block" },
				["ib"] = { query = "@block.inner", desc = "Select inner block" },
			},
		},

		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["<S-j>"] = {
					query = { "@function.outer", "@class.outer", "@section.outer" },
					desc = "Next object start",
				},
				["]f"] = { query = "@function.outer", desc = "Next function start" },
				["]c"] = { query = "@class.outer", desc = "Next class start" },
				["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
				["]b"] = { query = "@block.outer", desc = "Next block start" },
			},
			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Next function end" },
				["]C"] = { query = "@class.outer", desc = "Next class end" },
			},
			goto_previous_start = {
				["<S-k>"] = {
					query = { "@function.outer", "@class.outer", "@section.outer" },
					desc = "Previous object start",
				},
				["[f"] = { query = "@function.outer", desc = "Previous function start" },
				["[c"] = { query = "@class.outer", desc = "Previous class start" },
				["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
				["[b"] = { query = "@block.outer", desc = "Previous block start" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous function end" },
				["[C"] = { query = "@class.outer", desc = "Previous class end" },
			},
		},
		swap = {
			enable = true,

			swap_next = {
				["<leader>sa"] = { query = "@parameter.inner", desc = "Swap argument with next" },
			},

			swap_previous = {
				["<leader>sA"] = { query = "@parameter.inner", desc = "Swap argument with previous" },
			},
		},
	},
})
