require("code_runner").setup({
	mode = "better_term",
	better_term = {
		number = 1,
	},
	filetype = {
		go = "cd $dir && go run $fileName",
		lua = "lua $fileName",
		python = "python3 $fileName",
		sh = "bash $fileName",
		zig = "zig run $fileName",
	},
})
