switch:
	# Adding files to git...
	git add *
	# Rebuilding flake...
	sudo nixos-rebuild switch --flake .
edit:
	sudo -E -s nvim .
show:
	sudo nix flake show
gupdate:
	git add *
	git status
