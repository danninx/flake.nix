[global]
    monitor = 0
	follow = none

    ### Geometry ###

    width = 400
	height = (0, 300)

    origin = bottom-right
    offset = (40, 40)

    scale = 3

    notification_limit = 20

    ### Progress bar ###

    progress_bar = true
    progress_bar_height = 10
    progress_bar_frame_width = 1
    progress_bar_min_width = 150
    progress_bar_max_width = 300
    progress_bar_corner_radius = 0
    progress_bar_corners = all

    icon_corner_radius = 0
    icon_corners = all

    indicate_hidden = yes

    transparency = 0

    separator_height = 2
    padding = 8

    horizontal_padding = 8
    text_icon_padding = 0

    frame_width = 1
    frame_color = "#313244"

    gap_size = 0
    separator_color = frame

    sort = yes

    ### Text ###

    font = FiraCode Nerd Font Mono 10
    line_height = 0

    markup = full

    format = "<b>%s</b>\n%b"

    alignment = left
    vertical_alignment = center

    show_age_threshold = 60

    ellipsize = middle

    ignore_newline = no

    stack_duplicates = true

    hide_duplicate_count = false

    show_indicators = yes

    ### Icons ###

    enable_recursive_icon_lookup = true
    icon_theme = Adwaita
    icon_position = right

    min_icon_size = 32
    max_icon_size = 32

    ### History ###

    sticky_history = yes

    # Maximum amount of notifications kept in history
    history_length = 20

    ### Misc/Advanced ###

    dmenu = fuzzel --dmenu
    browser = firefox
    always_run_script = true

    title = Dunst
    class = Dunst

    corner_radius = 5

    corners = all

    ignore_dbusclose = false
    
    mouse_left_click = close_current
    mouse_middle_click = do_action, close_current
    mouse_right_click = close_all

[experimental]
    # Calculate the dpi to use on a per-monitor basis.
    # If this setting is enabled the Xft.dpi value will be ignored and instead
    # dunst will attempt to calculate an appropriate dpi value for each monitor
    # using the resolution and physical size. This might be useful in setups
    # where there are multiple screens with very different dpi values.
    per_monitor_dpi = false


[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    background = "#1e1e2e"
    foreground = "#89b4fa"
    timeout = 10
    # Icon for notifications with low urgency
    default_icon = dialog-information

[urgency_normal]
    background = "#1e1e2e"
    foreground = "#cdd6f4"
    timeout = 10
    override_pause_level = 30
    # Icon for notifications with normal urgency
    default_icon = dialog-information

[urgency_critical]
    background = "#1e1e2e"
    foreground = "#f38ba8"
    frame_color = "#f38ba8"
    timeout = 0
    override_pause_level = 60
    # Icon for notifications with critical urgency
    default_icon = dialog-warning

[play_sound]
	summary="*"
	script="~/.config/dunst/sounds/greeting.sh"

[play_sound]
	category="warning"
	script="~/.config/dunst/sounds/exclaim.sh"

