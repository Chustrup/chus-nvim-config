local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig") -- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"ast_grep",
		"cmake",
		"ast_grep",
		"rome",
		"ltex",
		"grammarly",
		"glsl_analyzer",
		"lua_ls",
		"ts_ls",
		"pyright",
	},
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"eslint-lsp",
		"codelldb",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
