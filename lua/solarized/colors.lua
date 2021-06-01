local solarized = {

	white =         '#eee8d5',
	gray =          '#073642',
	black =         '#002b36',
	red =           '#dc322f',
	green =         '#859900',
	yellow =        '#b58900',
	paleblue =      '#586e75',
	cyan =          '#2aa198',
	blue =          '#268bd2',
	purple =        '#6c71c4',
	orange =        '#cb4b16',
	pink =          '#d33682',

	bg =            '#eee8d5',
	bg_alt =        '#fdf6e3',
	fg =            '#002b36',
	text =          '#586e75',
	comments =      '#657b83',
	selection =     '#d8ccc4',
	contrast =      '#002b36',
	active =        '#d8ccc4',
	border =        '#839496',
	line_numbers =  '#839496',
	highlight =     '#d8ccc4',
	disabled =      '#073642',
	cursor =        '#268bd2',
	accent =        '#073642',

	error =         '#d33682',
	link =          '#2aa198',

	none =          'NONE'
}

-- Optional colors

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.solarized_contrast == false then
    solarized.sidebar = moonlight.bg
    solarized.float = moonlight.bg
else
    solarized.sidebar = moonlight.bg_alt
    solarized.float = moonlight.bg_alt
end

return solarized
