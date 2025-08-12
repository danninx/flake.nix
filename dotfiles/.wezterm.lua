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
config.unix_domains = {
	{
		name = 'unix',
	},
}
-- config.default_domain = 'unix'

--[
--	BINDS
--]
config.keys = {}
config.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1000 }

local function bind(settings) 
	for _,bind in pairs(settings) do
		table.insert(config.keys, bind)
	end
end

--[
--	COLORS
--]
config.color_scheme = 'catppuccin-mocha'
config.window_background_opacity = 0.90
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_size = 12
config.warn_about_missing_glyphs = false

config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrains Mono',
    -- weight = 'Bold',
	
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  },
  { family = 'Terminus', weight = 'Bold' },
  'Noto Color Emoji',
}

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

--[
--	WORKSPACES
--]
local act = wezterm.action


wezterm.on("update-right-status", function(window, pane)
	local tabs = window:mux_window():tabs()
	local name = window:active_workspace()
	window:set_right_status(wezterm.format {
		{ Text = "[" .. #tabs .. "] " .. name .. " " } --"[" .. numTabs .. "] " .. window:active_workspace() }
	})
end)

bind({
	-- [s]witch workspace
	{ 
		key = 's', 
		mods = 'LEADER', 
		action = act.ShowLauncherArgs {
			flags = 'FUZZY|WORKSPACES',
		},
	},
	-- [m]ake workspace
	{
		key = 'm',
		mods = 'LEADER',
		action = act.PromptInputLine {
			description = wezterm.format {
				{ Attribute = { Intensity = 'Bold' } },
				{ Foreground = { Color = mocha.lavender } },
				{ Text = 'Enter name for new workspace' },
			},
			action = wezterm.action_callback(function(window, pane, line) 
				if line then
					window:perform_action(
						act.SwitchToWorkspace {
							name = line
						},
						pane
					)
				end
			end),
		}
	},
	-- [i]nsert new workspace name
	{
		key = 'i',
		mods = 'LEADER',
		action = act.PromptInputLine {
			description = wezterm.format {
				{ Attribute = { Intensity = 'Bold' } },
				{ Foreground = { Color = mocha.lavender} },
				{ Text = 'Enter string for workspace rename' },
			},
			action = wezterm.action_callback(function(window, pane, line) 
				if line then
					wezterm.mux.rename_workspace(
						wezterm.mux.get_active_workspace(),
						line
					)
				end
			end)
		},
	},
	-- e[x]it tab
	{
		key = 'x',
		mods = 'LEADER',
		action = act.CloseCurrentTab ({
			confirm = true
		}),
	},
	-- [c]reate tab
	{
		key = 'c',
		mods = 'LEADER',
		action = act.SpawnTab 'CurrentPaneDomain',
	},
	-- tab movement
	{ key = 'h', mods = 'ALT', action = act.ActivateTabRelative(-1) },
	{ key = 'h', mods = 'ALT|SHIFT', action = act.MoveTabRelative(-1) },
	{ key = 'l', mods = 'ALT', action = act.ActivateTabRelative(1) },
	{ key = 'l', mods = 'ALT|SHIFT', action = act.MoveTabRelative(1) },
	{ key = 'b', mods = 'ALT', action = act.ActivateLastTab },
	-- attach to unix domain
	{ key = 'a', mods = 'ALT|SHIFT', action = act.AttachDomain 'unix' },
	{ key = 'd', mods = 'ALT|SHIFT', action = act.DetachDomain 'CurrentPaneDomain' },
	{
		key = '`',
		mods = 'LEADER',
		action = act.ShowLauncherArgs {
			flags = "FUZZY|DOMAINS"		
		}
	},
	-- panes (I hate these but like wtv)
	{ key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left', },
	{ key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right', },
	{ key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true}, },

})

return config
