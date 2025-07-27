sync:
	git add .
dtop: sync
	sudo nixos-rebuild switch --flake ".#dtop"
jericho: sync
	sudo nixos-rebuild switch --flake ".#jericho"
links:
	bash ./dotfiles/link.sh
edit:
	sudo -E -s nvim .
