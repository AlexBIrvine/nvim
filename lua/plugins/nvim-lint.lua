-- zig fmt --check needs a real file on disk (no stdin support for --check),
-- and only reports "formatted or not", not line/col diagnostics.
require("lint").linters.zigfmt = {
	cmd = "zig",
	args = { "fmt", "--check" },
	stdin = false,
	append_fname = true,
	ignore_exitcode = true,
	parser = function(output)
		if output == nil or output == "" then
			return {}
		end
		return {
			{
				source = "zig fmt",
				lnum = 0,
				col = 0,
				severity = vim.diagnostic.severity.WARN,
				message = "File is not formatted with `zig fmt`",
			},
		}
	end,
}

require("lint").linters_by_ft = { --some of these need to be installed from package manager
	lua = { "luac" },
	python = { "ruff" },
	sh = { "bash" },
	c = { "cppcheck" },
	rust = { "clippy" },
	css = { "stylelint" },
	html = { "htmlhint" },
	go = { "golangcilint" },
	zig = { "zig", "zigfmt" }, -- 'zig' runs ast-check for syntax errors, 'zigfmt' flags formatting drift
}

-- Some linters require a file to be saved to disk, others support linting stdin input.
-- For such linters you could also define a more aggressive autocmd,
-- for example on the InsertLeave or TextChanged events.
-- To get the filetype of a buffer you can run := vim.bo.filetype.

-- lints on close, see autocmd
