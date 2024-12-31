switch:
	# Adding files to git...
	git add *
	# Rebuilding flake...
	sudo nixos-rebuild switch --flake .
laptop:
	# Adding files to git...
	git add *
	# Rebuilding laptop configuration...
	sudo nixos-rebuild switch --flake ".#dtop"
wsl:
	# Adding files to git...
	git add *
	# Rebuilding wsl configuration...
	# 
	# WARNING: Current WSL name in flake is "nixos". Be sure to change this to "wsl" or "winnix" in the future.
	#
	sudo nixos-rebuild switch --flake ".#nixos"
edit:
	sudo -E -s nvim .
gupdate:
	git add *
	git status
