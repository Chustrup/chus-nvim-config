local term = require("toggleterm")

term.setup({

	on_open = function()
		vim.cmd("startinsert!")
	end,
	on_close = function()
		vim.cmd("startinsert!")
	end,
	persist_mode = false,
})
