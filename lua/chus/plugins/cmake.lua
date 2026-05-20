require("cmake-tools").setup({})

-- nvim.keymap.set("n", "<c-r>", ":CMakeRun<CR>")
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.schedule(function()
			vim.keymap.set("n", "<leader>rr", ":CMakeRun<CR>")
		end)
	end,
})
