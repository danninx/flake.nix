dtop:
	git add _readme dotfiles home hosts nixos .gitignore flake.lock flake.nix Makefile README.md
	sudo nixos-rebuild switch --flake ".#dtop"
jericho:
	git add _readme dotfiles home hosts nixos .gitignore flake.lock flake.nix Makefile README.md
	sudo nixos-rebuild switch --flake ".#jericho"
links:
	bash ./dotfiles/link.sh
edit:
	sudo -E -s nvim .
