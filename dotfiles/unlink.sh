DOTS=/home/danninx/dnix/dotfiles
list=( \
    ".config/dunst" \
    ".config/hypr" \
    ".config/waybar" \
    ".config/starship.toml" \
    ".wezterm.lua" \
    ".config/quickshell" \
)

for item in ${list[@]}; do
    dest="$HOME/$item"

    unlink $dest || true
done
