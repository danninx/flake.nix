# kill existing
stop=(
	"dunst" 
	"swww-daemon" 
	"eww"
)

start=(
	"dunst"
	"swww-daemon"
	"eww daemon"
)

for item in ${items[@]}; do
	pkill -f $item
done

# used in case these aren't up after startup

sleep 1

for item in ${items[@]}; do
	eval "$item &"
done

# restore previous wallpaper
STATE_FILE="$HOME/.background_cycle_state"
current=$(cat "$STATE_FILE")
case $current in
	1)
		wp=~/dnix/backgrounds/black-hole.png
		;;
	2)
		wp=~/dnix/backgrounds/knight-1.jpg
		;;
	3)
		wp=~/dnix/backgrounds/p5-solid.jpg
		;;
	4)
		wp=~/dnix/backgrounds/nix-mocha.png
		;;
esac

dunstify -h string:x-dunst-stack-tag:hypr-theme-change "Current Wallpaper:\n $wp"
swww img $wp --transition-type=wipe --transition-duration=1 --transition-fps=244
eww open example

