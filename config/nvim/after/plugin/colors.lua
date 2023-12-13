function SetColors(color)
	color = color or 'catppuccin-mocha'
	vim.cmd.colorscheme(color)
end

SetColors()
