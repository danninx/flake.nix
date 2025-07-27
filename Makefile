default: sync
	sudo nixos-rebuild switch --flake ".#$(shell hostname)"
sync:
	git add .
dtop: sync
	sudo nixos-rebuild switch --flake ".#dtop"
jericho: sync
	sudo nixos-rebuild switch --flake ".#jericho"
links:
	bash ./dotfiles/link.sh

PHONY: default sync dtop jericho links
