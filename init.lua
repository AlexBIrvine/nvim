-- Based on bread's neovim config

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath("data")
if vim.fn.empty(vim.fn.glob(data_dir .. "/site/autoload/plug.vim")) == 1 then
	vim.cmd(
		"silent !curl -fLo "
			.. data_dir
			.. "/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	)
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC")
end

local vim = vim
local Plug = vim.fn["plug#"]

vim.g.start_time = vim.fn.reltime()
vim.loader.enable() --  SPEEEEEEEEEEED 

vim.call("plug#begin")

Plug("nvim-lualine/lualine.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("folke/which-key.nvim")
Plug("romgrk/barbar.nvim")
Plug("goolord/alpha-nvim")
Plug("nvim-treesitter/nvim-treesitter")
Plug("mfussenegger/nvim-lint")
Plug("nvim-tree/nvim-tree.lua")
Plug("windwp/nvim-autopairs")
Plug("lewis6991/gitsigns.nvim")
Plug("numToStr/Comment.nvim")
Plug("norcalli/nvim-colorizer.lua")
Plug("ibhagwan/fzf-lua")
Plug("numToStr/FTerm.nvim")
Plug("ron-rs/ron.vim")
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("folke/twilight.nvim")
Plug("EdenEast/nightfox.nvim")
Plug("CRAG666/betterTerm.nvim")
Plug("CRAG666/code_runner.nvim")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")
Plug("WhoIsSethDaniel/mason-tool-installer.nvim")
Plug("saghen/blink.cmp", { tag = "v1.*" })
Plug("nvim-treesitter/nvim-treesitter-textobjects")
Plug("olimorris/codecompanion.nvim")
Plug("nvim-lua/plenary.nvim")

vim.call("plug#end")

-- move config and plugin config to alternate files
require("config.mappings")
require("config.options")
require("config.autocmd")

require("plugins.alpha")
require("plugins.autopairs")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.fterm")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.nvim-tree")
require("plugins.render-markdown")
require("plugins.treesitter")
require("plugins.twilight")
require("plugins.which-key")
require("plugins.betterterm")
require("plugins.code_runner")
require("plugins.mason")
require("plugins.blink")
require("plugins.lsp")
require("plugins.codecompanion")

vim.cmd("colorscheme nightfox")
