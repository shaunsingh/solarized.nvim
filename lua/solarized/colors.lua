local bases = {
	base03 =        '#002b36',
	base02 =        '#073642',
	base01 =        '#586e75',
	base00 =        '#657b83',
	base0 =         '#839496',
	base1 =         '#93a1a1',
	base2 =         '#eee8d5',
	base3 =         '#fdf6e3',
}

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
	magenta =       '#d33682',
	violet =        '#6c71c4',

	bg_light =       bases['base3'],
	bg_light_alt =   bases['base2'],
	bg_dark =        bases['base03'],
	bg_dark_alt =    bases['base02'],
	fg_light =       bases['base0'],
	text_light =     bases['base1'],
	fg_dark =        bases['base00'],
	text_dark =      bases['base01'],
	comments =      '#657b83',
	selection =     '#d3cfc1',
	contrast =      '#002b36',
	active =        '#d8ccc4',
	border =        '#002b36',
	line_numbers =  '#839496',
	highlight =     '#d8ccc4',
	disabled =      '#073642',
	cursor =        '#268bd2',
	accent =        '#073642',

	error =         '#dc322f',
	link =          '#2aa198',

	none =          'NONE'
}

-- If dark mode, swap fg and bg
if vim.o.background == 'dark' then
	solarized.bg = solarized.bg_dark
	solarized.bg_alt = solarized.bg_dark_alt
	solarized.fg = solarized.fg_dark
	solarized.text = solarized.text_dark
else
	solarized.bg = solarized.bg_light
	solarized.bg_alt = solarized.bg_light_alt
	solarized.fg = solarized.fg_light
	solarized.text = solarized.text_light
end
-- Optional colors

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.solarized_contrast == false then
    solarized.sidebar = solarized.bg
    solarized.float = solarized.bg
else
    solarized.sidebar = solarized.bg_alt
    solarized.float = solarized.bg_alt
end

return solarized
