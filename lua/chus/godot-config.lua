local projectfile = vim.fn.getcwd() .. "project.godot"
if projectfile then
	pcall(function()
		vim.fn.serverstart("/tmp/godot.pipe")
	end)
end
