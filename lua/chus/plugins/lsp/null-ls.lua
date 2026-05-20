-- import null-ls plugin safely
local null_ls = require("null-ls")
local eslint = require("eslint")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.clang_format, -- lua formatter
		diagnostics.eslint,
		-- diagnostics.eslint_d.with({ -- js/ts linter
		-- 	-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
		-- 	condition = function(utils)
		-- 		return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		-- 	end,
		-- }),
	},
	-- configure format on save
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format()
		end)

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
-- if client and client.supports_method and client._request_name_to_capability and
--            client.supports_method("textDocument/formatting") then
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 buffer = bufnr,
--                 callback = function()
--                     vim.lsp.buf.format({ bufnr = bufnr })
--                 end,
--             })
--         end

eslint.setup({
	bin = "eslint", -- or `eslint_d`
	code_actions = {
		enable = true,
		apply_on_save = {
			enable = true,
			types = { "directive", "problem", "suggestion", "layout" },
		},
		disable_rule_comment = {
			enable = true,
			location = "separate_line", -- or `same_line`
		},
	},
	diagnostics = {
		enable = true,
		report_unused_disable_directives = false,
		run_on = "save", -- or `save`
	},
})
