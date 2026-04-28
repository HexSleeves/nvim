return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#292c3c',
				base01 = '#292c3c',
				base02 = '#7d8785',
				base03 = '#7d8785',
				base04 = '#c5d2d0',
				base05 = '#f8fffe',
				base06 = '#f8fffe',
				base07 = '#f8fffe',
				base08 = '#ffc09f',
				base09 = '#ffc09f',
				base0A = '#99dcd2',
				base0B = '#9cf0a1',
				base0C = '#d6fff9',
				base0D = '#99dcd2',
				base0E = '#bffff6',
				base0F = '#bffff6',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#7d8785',
				fg = '#f8fffe',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#99dcd2',
				fg = '#292c3c',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7d8785' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d6fff9', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#bffff6',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#99dcd2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#99dcd2',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#d6fff9',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#9cf0a1',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#c5d2d0' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c5d2d0' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#7d8785',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
