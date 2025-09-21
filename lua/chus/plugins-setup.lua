local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	print(vim.fn.has("nvim-0.11"))
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("bluz71/vim-nightfly-guicolors")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-path")

	use("hrsh7th/cmp-buffer")
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use({
		"williamboman/mason.nvim",
	})

	use("neovim/nvim-lspconfig")

	use("williamboman/mason-lspconfig.nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use({

		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use("jose-elias-alvarez/typescript.nvim")

	use("onsails/lspkind.nvim")

	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("windwp/nvim-ts-autotag")
	use("mfussenegger/nvim-dap")
	use({
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use("puremourning/vimspector")
	use("mfussenegger/nvim-dap-python")
	use({
		"m4xshen/hardtime.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	use("MunifTanjim/eslint.nvim")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({
		"luckasRanarison/tailwind-tools.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
	})
	use("tailwind-tools.nvim")
	-- tailwind-tools.lua

	if packer_bootstrap then
		require("packer").sync()
	end
end)
