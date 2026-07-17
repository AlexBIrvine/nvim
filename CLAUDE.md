# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, based on "bread's neovim config" (see README.md for the original author's philosophy on structuring a config). Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).

## Commands

- `:PlugInstall` — install plugins declared in `init.lua` (also bound to `<leader>P`)
- `:PlugClean` — remove plugins no longer declared in `init.lua`
- `:PlugUpdate` — update all plugins
- `:so %` / `<leader>R` — reload the current file / re-source `init.lua`
- `stylua <file>` — format a Lua file (installed via `mason-tool-installer`; also runs automatically on save, see below)

There is no separate build step, test suite, or lint command for the config itself — "testing" a change means reloading (`<leader>R`) or restarting Neovim and exercising the affected mapping/plugin.

## Architecture

### Load order (`init.lua`)

`init.lua` is the single entry point and does three things in order:
1. Bootstraps vim-plug if missing, then declares every plugin via `Plug(...)` between `plug#begin`/`plug#end`.
2. Requires the core config modules: `config.mappings`, `config.options`, `config.autocmd`.
3. Requires each per-plugin setup module from `lua/plugins/`.
4. Sets `colorscheme nightfox` at the very end.

**Adding a plugin** requires two edits to `init.lua`: a `Plug("author/repo")` line in the plugin list, and a `require("plugins.name")` line in the require block, plus a new `lua/plugins/name.lua` containing that plugin's `require(...).setup{...}` call. Plugin configs are not lazy-loaded — everything loads at startup (mitigated by `vim.loader.enable()`).

### `lua/config/` — core editor config, not plugin-specific

- `options.lua` — all `vim.opt` values, set via a single table loop; also disables diagnostic signs (virtual text is configured per-LSP instead).
- `mappings.lua` — **single source of truth for all keybindings** (per its own header comment). Leader is `<Space>`. Non-plugin mappings (window nav, save, terminal escape) live directly here; plugin-specific mappings are grouped by leader prefix (`<leader>l` LSP, `<leader>f`/`<leader>g` fzf-lua, `<leader>a` CodeCompanion, `<leader>n` neotest).
- `autocmd.lua` — all autocommands: format-on-save (LSP `vim.lsp.buf.format`, excluding markdown/lua), stylua-on-save for `*.lua`, lint-on-save (`require("lint").try_lint()`), autosave on `InsertLeave`, markdown-specific buffer settings (spell, Obsidian-style list auto-continuation on `<CR>`), relative-number toggling based on focus/mode, and closing nvim-tree when it's the last buffer.
- `theme.lua` / `saved_theme` — a hand-rolled theme-switcher (`_G.switch_theme`) that persists the chosen colorscheme to a file. **Currently not `require`d from `init.lua`** and references `catppuccin`/`gruvbox`/`pywal16` colorschemes that aren't in the `Plug()` list — treat as dormant/legacy unless re-wired.

### `lua/plugins/` — one file per plugin

Each file is self-contained: it just calls that plugin's `setup()`/config function. There's no shared abstraction layer between them; when changing plugin behavior, edit the corresponding file directly rather than looking for a central config object. Treesitter-based mappings (text objects, incremental selection) are defined inside `treesitter.lua` itself rather than `mappings.lua`, because they must be registered through the treesitter setup call — see the comments in that file.

Notable plugin wiring to be aware of:
- **LSP (`lsp.lua`)** uses the newer native `vim.lsp.config()` / `vim.lsp.enable()` API directly (not `nvim-lspconfig`'s old setup-table style), with capabilities sourced from `blink.cmp`. Servers enabled: `gopls`, `ts_ls`, `pyright`, `zls`, `clangd`, `ols`, `lua_ls`. `zls` is configured with an explicit `cmd` since it isn't installed via Mason.
- **`mason.lua`** auto-installs LSP servers (a subset of the above — `zls`/`ols` handling differs) and `stylua` via `mason-tool-installer`.
- **`nvim-lint.lua`** maps filetypes to external linter binaries (`ruff`, `cppcheck`, `clippy`, `stylelint`, `htmlhint`, etc.) that must be separately installed on the system; linting runs on `BufWritePost` via the autocmd in `autocmd.lua`.
- **`neotest.lua`** wires adapters for Go, Python (pytest), Jest (`bun test`), and Busted; test runner mappings live under `<leader>n` in `mappings.lua`.
- **`codecompanion.lua`** configures the Anthropic adapter for AI chat/inline-assist. The API key is read from the `ANTHROPIC_API_KEY` environment variable (via CodeCompanion's `cmd:` env syntax) — never hardcode a key here.
- **`code_runner.lua`** runs code via `betterTerm` per-filetype (`<leader>rc`).
- **`which-key.lua`** is purely descriptive — it registers group labels/descriptions for leader-prefixed mappings defined elsewhere; it does not create the mappings itself.

## Conventions

- Indentation in Lua files is tabs (stylua-enforced on save).
- New keybindings: add the `map(...)` call in `mappings.lua`, then add a matching `wk.add({...})` entry in `which-key.lua` if it should show a description/group in the which-key popup.
- New filetype support usually touches three places: `treesitter.lua` (`ensure_installed`), `lsp.lua`/`mason.lua` (server), and optionally `nvim-lint.lua` (linter).
