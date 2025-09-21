local dap, dapui = require("dap"), require("dapui")
local dap_python = require("dap-python")
dap_python.setup("python3")

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launche Scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", function()
	dap.terminate()
	dapui.close()
end)
vim.keymap.set("n", "<F8>", dap.step_into)
vim.keymap.set("n", "<F7>", dap.step_over)
vim.keymap.set("n", "<F9>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
