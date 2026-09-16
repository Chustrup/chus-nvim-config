local projectfile = vim.fn.getcwd() .. "project.godot"
if projectfile then
	pcall(function()
		vim.fn.serverstart("127.0.0.1:6004")
	end)
end
