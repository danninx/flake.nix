switch:
	# # CLEAR OLD CONFIGS
	# # (Required for home-manager to generate properly)

	# # Firefox
	# rm -rf ~/.mozilla/

	# # VS Code
	# rm -rf ~/.config/Code/
	# rm -rf ~/.vscode/

	# Build new generation
	sudo nixos-rebuild switch --flake .
edit:
	sudo -E -s nvim .
show:
	sudo nix flake show
gupdate:
	git add *
	git status