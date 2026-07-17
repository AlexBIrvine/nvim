-- mappings.lua
-- Single source of truth for all keybindings.

local function map(m, k, v, desc)
	vim.keymap.set(m, k, v, { noremap = true, silent = true, desc = desc })
end

-- ---------------------------------------------------------
--                      Leader
-- ---------------------------------------------------------
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ---------------------------------------------------------
--                      Buffers
-- ---------------------------------------------------------
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Previous buffer")
map("n", "<leader>q", ":q<CR>", "Quit")
map("n", "<leader>Q", ":BufferClose!<CR>", "Force close buffer")
map("n", "<leader>U", ":bufdo bd<CR>", "Close all buffers")

-- ---------------------------------------------------------
--                   Buffer Position / Reorder
-- ---------------------------------------------------------
map("n", "<A-h>", "<Cmd>BufferMovePrevious<CR>", "Move buffer left")
map("n", "<A-l>", "<Cmd>BufferMoveNext<CR>", "Move buffer right")
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", "Buffer 1")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", "Buffer 2")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", "Buffer 3")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", "Buffer 4")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", "Buffer 5")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", "Buffer 6")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", "Buffer 7")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", "Buffer 8")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", "Buffer 9")
map("n", "<A-0>", "<Cmd>BufferLast<CR>", "Last buffer")
map("n", "<A-p>", "<Cmd>BufferPin<CR>", "Pin buffer")

-- ---------------------------------------------------------
--                    Neotest  (<leader>n)
-- ---------------------------------------------------------
map("n", "<leader>nn", "<cmd>lua require('neotest').run.run()<CR>", "Run nearest test")
map("n", "<leader>nf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run file tests")
map("n", "<leader>ns", "<cmd>lua require('neotest').run.stop()<CR>", "Stop tests")
map("n", "<leader>no", "<cmd>lua require('neotest').output.open()<CR>", "Open output")
map("n", "<leader>nS", "<cmd>lua require('neotest').summary.toggle()<CR>", "Toggle summary")
map("n", "<leader>nj", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", "Next failed test")
map("n", "<leader>nk", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", "Previous failed test")
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")
map("n", "<C-l>", "<C-w>l", "Window right")
map("n", "<F5>", ":resize +2<CR>", "Increase height")
map("n", "<F6>", ":resize -2<CR>", "Decrease height")
map("n", "<F7>", ":vertical resize +2<CR>", "Increase width")
map("n", "<F8>", ":vertical resize -2<CR>", "Decrease width")

-- ---------------------------------------------------------
--                    LSP  (<leader>l)
-- ---------------------------------------------------------
map("n", "<leader>ld", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", "Definition")
map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration")
map("n", "<leader>lr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", "References")
map("n", "<leader>li", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", "Implementation")
map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover docs")
map("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
map("n", "<leader>la", "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>", "Code actions")
map("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic float")
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic")
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic")

-- ---------------------------------------------------------
--                   Fuzzy / Grep  (<leader>f / <leader>g)
-- ---------------------------------------------------------
map("n", "<leader>f", ":lua require('fzf-lua').files()<CR>", "Find files (cwd)")
map("n", "<leader>Fh", ":lua require('fzf-lua').files({ cwd = '~/' })<CR>", "Find files (home)")
map("n", "<leader>Fc", ":lua require('fzf-lua').files({ cwd = '~/.config' })<CR>", "Find files (.config)")
map("n", "<leader>Fl", ":lua require('fzf-lua').files({ cwd = '~/.local/src' })<CR>", "Find files (.local/src)")
map("n", "<leader>Ff", ":lua require('fzf-lua').files({ cwd = '..' })<CR>", "Find files (above)")
map("n", "<leader>Fr", ":lua require('fzf-lua').resume()<CR>", "Resume last search")
map("n", "<leader>g", ":lua require('fzf-lua').grep()<CR>", "Grep")
map("n", "<leader>G", ":lua require('fzf-lua').grep_cword()<CR>", "Grep word under cursor")

-- ---------------------------------------------------------
--                    CodeCompanion  (<leader>a)
-- ---------------------------------------------------------
map("n", "<leader>ac", ":CodeCompanionChat<CR>", "Open chat")
map("n", "<leader>aa", ":CodeCompanionChat Add<CR>", "Add buffer to chat")
map("v", "<leader>aa", ":CodeCompanionChat Add<CR>", "Add selection to chat")
map("n", "<leader>ai", ":CodeCompanion<CR>", "Inline assist")
map("v", "<leader>ai", ":CodeCompanion<CR>", "Inline assist selection")

-- ---------------------------------------------------------
--                    Neotest  (<leader>n)
-- ---------------------------------------------------------
map("n", "<leader>nn", "<cmd>lua require('neotest').run.run()<CR>", "Run nearest test")
map("n", "<leader>nf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run file tests")
map("n", "<leader>ns", "<cmd>lua require('neotest').run.stop()<CR>", "Stop tests")
map("n", "<leader>no", "<cmd>lua require('neotest').output.open()<CR>", "Open output")
map("n", "<leader>nS", "<cmd>lua require('neotest').summary.toggle()<CR>", "Toggle summary")
map("n", "<leader>nj", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", "Next failed test")
map("n", "<leader>nk", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", "Previous failed test")

-- ---------------------------------------------------------
--            Build & Test  (Go / Zig, <leader>r)
--    (per-filetype, sent to the betterTerm terminal)
-- ---------------------------------------------------------
local build_commands = {
	go = "go build ./...",
	zig = "zig build",
}

local test_commands = {
	go = "go test ./...",
	zig = "zig build test",
}

local function run_in_term(commands)
	return function()
		local ft = vim.bo.filetype
		local cmd = commands[ft]
		if not cmd then
			vim.notify("No command configured for filetype: " .. ft, vim.log.levels.WARN)
			return
		end
		require("betterTerm").send(cmd)
	end
end

map("n", "<leader>rb", run_in_term(build_commands), "Build/compile")
map("n", "<leader>rt", run_in_term(test_commands), "Run tests (terminal)")

-- ---------------------------------------------------------
--                      Misc
-- ---------------------------------------------------------
map("n", "<leader>t", ":NvimTreeToggle<CR>", "File explorer")
map("n", "<leader>P", ":PlugInstall<CR>", "Plugin install")
map("n", "<leader>z", ":lua require('FTerm').open()<CR>", "Floating terminal")
map("t", "<Esc>", "<C-\\><C-n><CMD>lua require('FTerm').close()<CR>", "Close terminal")
map("n", "<leader>s", ":w<CR>", "Save")
map("n", "<leader>R", ":so %<CR>", "Reload config")
map("v", "<leader>i", "=gv", "Auto indent")
map("i", "jk", "<Esc>", "Escape")
map("t", "jk", "<Esc>", "Escape")
map("n", "<leader>rc", ":RunCode<CR>", "Run code")
map("n", "<leader>T", ":lua require('betterTerm').open()<CR>", "Better terminal")
