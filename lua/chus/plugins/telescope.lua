require("telescope").setup({

	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		file_ignore_patterns = {
			"node_modules",
		},
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				-- ["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
local keymap = vim.keymap
keymap.set("n", "<leader>fz", ":Telescope frecency<CR>")
keymap.set("n", "<leader>fli", ":Telescope lsp_incoming_calls<CR>")
keymap.set("n", "<leader>flo", ":Telescope lsp_outcoming_calls<CR>")
keymap.set("n", "<leader>fld", ":Telescope diagnostics<CR>")
keymap.set("n", "<leader>fld", ":Telescope diagnostics<CR>")
keymap.set("n", "<leader>fx", ":Telescope lsp_document_symbols<CR>")
keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
