-- autocmd.lua

-- ---------------------------------------------------------
--                   Close NvimTree if Last Buffer
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})

-- ---------------------------------------------------------
--                      Linting on Save
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})

-- ---------------------------------------------------------
--                     Format on Save
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    vim.fn.system({ "stylua", filepath })
    vim.cmd("silent! checktime")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local ft = vim.bo.filetype
    local exclude = { "markdown", "lua" }
    if not vim.tbl_contains(exclude, ft) then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- ---------------------------------------------------------
--                      Autosave on InsertLeave
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("write")
  end,
})

-- ---------------------------------------------------------
--                      Markdown Settings
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
    
    -- Auto-continue markdown lists (Obsidian-like behavior)
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      
      -- Match bullet points: -, *, +
      local bullet = line:match("^(%s*)[%-%*%+]%s")
      if bullet then
        -- Check if line has content after bullet
        if line:match("^%s*[%-%*%+]%s+%S") then
          return "<CR>" .. bullet .. line:match("^%s*([%-%*%+])") .. " "
        else
          -- Empty bullet line, remove it
          return "<C-u>"
        end
      end
      
      -- Match numbered lists: 1., 2., etc.
      local indent, num = line:match("^(%s*)(%d+)%.%s")
      if indent and num then
        -- Check if line has content after number
        if line:match("^%s*%d+%.%s+%S") then
          return "<CR>" .. indent .. (tonumber(num) + 1) .. ". "
        else
          -- Empty numbered line, remove it
          return "<C-u>"
        end
      end
      
      -- Default behavior
      return "<CR>"
    end, { buffer = true, expr = true })
  end,
})

-- ---------------------------------------------------------
--                 Disable Auto Comment on Newline
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- ---------------------------------------------------------
--                   Highlight Text on Yank
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

-- ---------------------------------------------------------
--                   Restore Cursor Position
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

-- ---------------------------------------------------------
--                   Startup Time Measurement
-- ---------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    vim.g.startup_time_ms = string.format("%.2f ms", startuptime * 1000)
  end,
})

-- ---------------------------------------------------------
--                   Alpha on Empty Buffer
-- ---------------------------------------------------------
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "BDeletePre *",
  group = "alpha_on_empty",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then
      vim.cmd([[:Alpha | bd#]])
    end
  end,
})

-- ---------------------------------------------------------
--                   Smart Line Numbers
-- ---------------------------------------------------------
local augroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
        vim.cmd("redraw")
      end
    end
  end,
})
