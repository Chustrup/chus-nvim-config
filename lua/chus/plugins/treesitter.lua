local ts_autotag_setup, ts_autotag = pcall(require, "nvim-ts-autotag")
if not ts_autotag_setup then
	print("Not found ts_autotag")
end
ts_autotag.setup({
	opts = {
		enable_close = true,
		enable_close_on_slash = true,
		enable_rename = true,
	},
})

-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"gdscript",
		"godot_resource",
		"gdshader",
	},
	-- auto install above language parsers
	auto_install = true,
})
