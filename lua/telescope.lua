require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
      			vertical = {
        			preview_cutoff = 0,
      			},
    		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "ignore_case"
		}
	}
})

require("telescope").load_extension("fzf")
