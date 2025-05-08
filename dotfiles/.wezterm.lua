local wezterm = require 'wezterm'

local mocha = {
	rosewater = 'rgb(245, 224, 220)',
	flamingo = 'rgb(242, 205, 205)',
	pink = 'rgb(245, 194, 231)',
	mauve = 'rgb(203, 166, 247)',
	red = 'rgb(243, 139, 168)',
	maroon = 'rgb(235, 160, 172)',
	peach = 'rgb(250, 179, 135)',
	yellow = 'rgb(249, 226, 175)',
	green = 'rgb(166, 227, 161)',
	teal = 'rgb(148, 226, 213)',
	sky = 'rgb(137, 220, 235)',
	sapphire = 'rgb(116, 199, 236)',
	blue = 'rgb(137, 180, 250)',
	lavender = 'rgb(180, 190, 254)',
	text = 'rgb(205, 214, 244)',
	subtext1 = 'rgb(186, 194, 222)',
	subtext0 = 'rgb(166, 173, 200)',
	overlay2 = 'rgb(147, 153, 178)',
	overlay1 = 'rgb(127, 132, 156)',
	overlay0 = 'rgb(108, 112, 134)',
	surface2 = 'rgb(88, 91, 112)',
	surface1 = 'rgb(69, 71, 90)',
	surface0 = 'rgb(49, 50, 68)',
	base = 'rgb(30, 30, 46)',
	mantle = 'rgb(24, 24, 37)',
	crust = 'rgb(17, 17, 27)',
}

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 1
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_size = 11

config.colors = {
  tab_bar = {
    background = mocha.surface0,

    active_tab = {
      bg_color = mocha.crust,
      fg_color = mocha.overlay2,
    },

    inactive_tab = {
      bg_color = mocha.base,
      fg_color = mocha.overlay0,
    },

    inactive_tab_hover = {
      bg_color = mocha.surface1,
      fg_color = mocha.text;
    },

    new_tab = {
      bg_color = mocha.surface0,
      fg_color = mocha.text,
    },

    new_tab_hover = {
      bg_color = mocha.surface2,
      fg_color = mocha.text;
    },
  },
}



return config
