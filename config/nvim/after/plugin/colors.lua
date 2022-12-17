function SetColors(color)
	color = color or 'onenord'
	vim.cmd.colorscheme(color)
end

SetColors()
