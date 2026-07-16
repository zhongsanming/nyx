# File and directory preservation across reboots using impermanence.
# Assumes @persist btrfs subvolume is mounted at /persist.
{ inputs, ... }: {
  imports = [ inputs.impermanence.nixosModule ];

  den.aspects.impermanence = {
    nixos = {
      environment.persistence."/persist" = {
        hideMounts = true;

        # system-wide persistence
        directories = [
          "/etc/NetworkManager/system-connections"
          "/etc/ssh"
          "/var/lib/bluetooth"
          "/var/lib/colord"
          "/var/lib/systemd/coredump"
          "/var/lib/nixos"
        ];

        files = [ "/etc/machine-id" ];

        # per-user persistence for serephus
        users.serephus = {
          directories = [
            "Downloads"
            "Music"
            "Pictures"
            "Documents"
            "Videos"
            "res"
            ".ssh"
            ".gnupg"
            ".local/share/keyrings"
            ".local/state/wireplumber"
            ".local/state/nix"
            ".local/share/fish"
            ".cache/mozilla"
            ".cache/chromium"
            ".cache/nix"
          ];

          files = [
            ".bashrc"
            ".gitconfig"
          ];
        };
      };
    };
  };
}
