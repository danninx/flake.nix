DOTS=/home/danninx/dnix/dotfiles
list=( \
    ".config/dunst" \
    ".config/eww" \
    ".config/hypr" \
    ".config/waybar" \
    ".config/starship.toml" \
    ".wezterm.lua" \
    ".config/quickshell" \
)

for item in ${list[@]}; do
    src="$DOTS/$item"
    dest="$HOME/$item"

    unlink $dest || true

    echo "Linking $src to $dest"
    ln -s $src $dest || true
done

echo "Linking pfp"
ln -s "$DOTS/kirbyyyy.png" "$HOME/.face"
