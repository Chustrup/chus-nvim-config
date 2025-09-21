vim.g.mapleader = " "
local ls = require("luasnip")

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<C-\\><C-n>")
keymap.set("t", "<ESC>", "<C-\\><C-n>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- windows

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>ss", "<C-w>s")

keymap.set("n", "<leader>se", "<C-w>=")

keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>sj", "<C-w>j")

keymap.set("n", "<leader>sk", "<C-w>k")

keymap.set("n", "<leader>sl", "<C-w>l")

keymap.set("n", "<leader>sh", "<C-w>h")

-- Tabs

keymap.set("n", "<leader>to", ":tabnew<CR>")

keymap.set("n", "<leader>tx", ":tabclose<CR>")

keymap.set("n", "<leader>tl", ":tabn<CR>")

keymap.set("n", "<leader>th", ":tabn<CR>")

-- Fuzzy Finder
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")

keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")

keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")

keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })

keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

-- Terminal Toggle

keymap.set("n", "<leader>h", ":ToggleTerm<CR>")

keymap.set("n", "<leader>dd", '"_dd')
keymap.set("n", "<leader>D", '"_D')
keymap.set("n", "<leader>d", '"_d')

keymap.set("n", "<leader>cc", '"_cc')
keymap.set("n", "<leader>C", '"_C')
keymap.set("n", "<leader>c", '"_c')
