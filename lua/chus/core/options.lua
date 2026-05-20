local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.autoindent = true

-- search settings
opt.ignorecase = true

opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = { "indent", "eol", "start" }
