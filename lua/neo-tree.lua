require("neo-tree").setup({
	close_if_last_window = false,
	enable_diagnostics = false,
	window = {
		position = "left",
		width = 30,
	},
	filesystem = {
		filtered_items = { visible = true },
		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},
	}
})

