local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
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

	use("williamboman/mason-lspconfig.nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use({

		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use("jose-elias-alvarez/typescript.nvim")

	use("onsails/lspkind.nvim")

	use("nvimtools/none-ls.nvim") -- configure formatters & linters
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use("mfussenegger/nvim-lint")
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
	use({
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	})
	use("mfussenegger/nvim-dap-python")
	use({
		"m4xshen/hardtime.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	use("muniftanjim/eslint.nvim")
	use("esmuellert/nvim-eslint")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({
		"luckasranarison/tailwind-tools.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
	})
	use("Civitasv/cmake-tools.nvim")
	use("lewis6991/hover.nvim")
	use({
		"nvim-telescope/telescope-frecency.nvim",
		-- install any compatible version of 0.9.x
		version = "^0.9.0",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})

	use("easymotion/vim-easymotion")
	use("karb94/neoscroll.nvim")
	use({

		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("tpope/vim-surround")
	use("haya14busa/vim-easyoperator-line")
	use("eandrju/cellular-automaton.nvim")
	use("akinsho/toggleterm.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
