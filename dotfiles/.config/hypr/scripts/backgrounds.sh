# File to store the current counter
STATE_FILE="$HOME/.config/.background_cycle_state"
CURRENT_BACKGROUND="$HOME/.config/.background_image_state"
NUM_PAPERS=4

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
  echo 1 > "$STATE_FILE"
fi

# Cycle to next value
current=$(cat "$STATE_FILE")
next=$((current + 1))
if [ "$next" -gt $NUM_PAPERS ]; then
  next=1
fi

# Use state to pick wallpaper
case $next in
	1)
		wp=~/dnix/backgrounds/black-hole.png
		;;
	2)
		wp=~/dnix/backgrounds/knight-1.jpg
		;;
	3)
		wp=~/dnix/backgrounds/kyriemocha.png
		;;
	4)
		wp=~/dnix/backgrounds/nix-mocha.png
		;;
esac

dunstify -h string:x-dunst-stack-tag:hypr-theme-change "Current Wallpaper:\n $wp"
swww img $wp --transition-type=wipe --transition-duration=1 --transition-fps=244
ln -sf $wp $CURRENT_BACKGROUND

# Save state
echo "$next" > "$STATE_FILE"
