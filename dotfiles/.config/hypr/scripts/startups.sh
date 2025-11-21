# kill existing
stop=(
	"dunst" 
	"swww-daemon" 
#	"waybar"
)

start=(
	"dunst"
	"swww-daemon"
#	"waybar"
)

for item in ${stop[@]}; do
	pkill -f $item
done

for item in ${start[@]}; do
	eval "$item &"
done

swww img $HOME/.config/.background_image_state --transition-type=wipe --transition-duration=1 --transition-fps=244
notify-send "restarted"
