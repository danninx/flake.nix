switch:
	# Adding files to git...
	git add _readme dotfiles home hosts nixos .gitignore flake.lock flake.nix Makefile README.md
	# Rebuilding flake...
	sudo nixos-rebuild switch --flake .
dtop:
	# Adding files to git...
	git add _readme dotfiles home hosts nixos .gitignore flake.lock flake.nix Makefile README.md
	# Rebuilding laptop configuration...
	sudo nixos-rebuild switch --flake ".#dtop"
winnix:
	# Adding files to git...
	git add _readme dotfiles home hosts nixos .gitignore flake.lock flake.nix Makefile README.md
	# Rebuilding wsl configuration...
	# 
	# WARNING: Current WSL name in flake is "nixos". Be sure to change this to "wsl" or "winnix" in the future.
	#
	sudo nixos-rebuild switch --flake ".#nixos"
edit:
	sudo -E -s nvim .
