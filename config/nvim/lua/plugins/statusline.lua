-- Statusline configuration

-- Settings
require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		theme = "tokyonight",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = { fg = "#73daca" },
					modified = { fg = "#e0af68" },
					removed = { fg = "#f7768e" },
				},
			},
		},
		lualine_c = { "filename" },
		lualine_x = {
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
})
