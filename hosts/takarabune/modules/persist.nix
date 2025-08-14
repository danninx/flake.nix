{ lib, ... }:

{
  boot.initrd = {
    enable = true;
    supportedFilesystems = ["btrfs"];

    postResumeCommands = lib.mkAfter ''
      mkdir -p /mnt
      # mount root subvolume
      mount -o subvol=/ /dev/mapper/enc /mnt
  
      # clear root subvolumes and rollback
      btrfs subvolume list -o /mnt/root |
      cut -f9 -d' ' |
      while read subvolume; do
        echo "deleting /$subvolume subvolume..."
        btrfs subvolume delete "/mnt/$subvolume"
      done &&
      echo "deleting /root subvolume..." &&
      btrfs subvolume delete /mnt/root

      echo "restoring blank /root subvolume..."
      btrfs subvolume snapshot /mnt/root-blank /mnt/root
      umount /mnt
    '';

    postMountCommands = lib.mkBefore ''
      ln -snft /persist/etc/machine-id /etc/machine-id
    '';
  };

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      "/etc/nixos"
    ];
    files = [
      "/etc/ssh_host_ed25519_key"
      "/etc/ssh_host_ed25519_key.pub"
      "/etc/ssh_host_rsa_key"
      "/etc/ssh_host_rsa_key.pub"
    ];
  };

  users.mutableUsers = false; 
  users.users.danninx.hashedPasswordFile = "/persist/passwords/danninx";
}
