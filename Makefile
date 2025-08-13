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
persistent: sync
	sudo cp -r /var/lib/bluetooth /persist/var/lib/bluetooth
	sudo cp -r /var/lib/nixos /persist/var/lib/nixos
	sudo cp -r /var/lib/systemd/coredump /persist/var/lib/systemd/coredump
	sudo cp -r /etc/NetworkManager/system-connections /persist/etc/NetworkManager/system-connections
	sudo cp /etc/machine-id /persist/etc/machine-id

PHONY: default sync dtop jericho link
