local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({

	{
		-- A collection of common configurations for Neovim's built-in language server client
		"neovim/nvim-lspconfig",
		config = function()
			require('plugins/lspconfig')
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
		config = function()
			require('plugins/mason')
		end,
	}

	, {
	-- vscode-like pictograms for neovim lsp completion items Topics
	"onsails/lspkind-nvim",
	config = function()
		require('plugins/lspkind')
	end,
}
, {
	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
		vim.cmd "colorscheme catppuccin"
	end
}

,
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			require('plugins/prettier')
		end
	},
	{
		-- A completion plugin for neovim coded in Lua.
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",             -- nvim-cmp source for neovim builtin LSP client
			"hrsh7th/cmp-nvim-lua",             -- nvim-cmp source for nvim lua
			"hrsh7th/cmp-buffer",               -- nvim-cmp source for buffer words.
			"hrsh7th/cmp-path",                 -- nvim-cmp source for filesystem paths.
			"hrsh7th/cmp-calc",                 -- nvim-cmp source for math calculation.
			"hrsh7th/cmp-nvim-lsp-signature-help", -- nvim-cmp signature help
			"saadparwaiz1/cmp_luasnip"          -- luasnip completion source for nvim-cmp
		},
		config = function()
			require('plugins/cmp')
		end,
	}
	, {
	"nvim-telescope/telescope-project.nvim"
}

, {
	"psliwka/vim-smoothie"
}
, {
	"nvim-telescope/telescope-fzf-native.nvim",
	build = "make"
}

, {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep"
	},
	config = function()
		require('plugins/telescope')
	end,
}

, {
	"nvim-telescope/telescope-bibtex.nvim",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" }
	},
	config = function()
		require "telescope".load_extension("bibtex")
	end
}

, {
	-- Snippet Engine for Neovim written in Lua.
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets" -- Snippets collection for a set of different programming languages for faster development.
	},
	config = function()
		require('plugins/luasnip')
	end,
}

, {
	-- Nvim Treesitter configurations and abstraction layer
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"p00f/nvim-ts-rainbow"
	},
	config = function()
		require('plugins/treesitter')
	end,
}

, {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require('plugins/blankline')
	end,
}

, {
	"terrortylor/nvim-comment",
}
, {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require('plugins/lualine')
	end,
}

, {
	'OmniSharp/omnisharp-vim'
}

, {
	"TimUntersberger/neogit",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require('plugins/neogit')
	end,
}

, {
	"kyazdani42/nvim-tree.lua",
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		require('plugins/nvim-tree')
	end,
}

, {
	"folke/trouble.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		require('plugins/trouble')
	end,
}

, {
	"folke/which-key.nvim",
	config = function()
		require('plugins/which-key')
	end,
}

, {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require('plugins/colorizer')
	end,
} })
