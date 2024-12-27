switch:
	# Adding files to git...
	git add *
	# Rebuilding flake...
	sudo nixos-rebuild switch --flake .
edit:
	sudo -E -s nvim .
gupdate:
	git add *
	git status
