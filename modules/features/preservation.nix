# Declarative file/directory preservation across reboots.
# Uses nix-community/preservation instead of impermanence.
{ inputs, config, lib, ... }: {
  imports = [ inputs.preservation.nixosModules.default ];

  den.aspects.preservation = {
    nixos = {
      preservation = {
        enable = true;

        preserveAt."/persist" = {
          # system directories
          directories = [
            "/etc/NetworkManager/system-connections"
            "/var/lib/bluetooth"
            "/var/lib/colord"
            "/var/lib/systemd/coredump"
            { directory = "/var/lib/nixos"; inInitrd = true; }
          ];

          # system files (SSH host keys as symlinks for security)
          files = [
            { file = "/etc/machine-id"; inInitrd = true; }
            { file = "/etc/ssh/ssh_host_rsa_key"; how = "symlink"; configureParent = true; }
            { file = "/etc/ssh/ssh_host_ed25519_key"; how = "symlink"; configureParent = true; }
          ];

          # user serephus
          users.serephus = {
            directories = [
              "Downloads" "Music" "Pictures" "Documents" "Videos"
              "res"
              { directory = ".ssh"; mode = "0700"; }
              ".gnupg" ".local/share/keyrings"
              ".local/state/wireplumber" ".local/state/nix"
              ".local/share/fish" ".cache/mozilla" ".cache/chromium" ".cache/nix"
            ];
            files = [ ".bashrc" ".gitconfig" ];
          };
        };
      };

      # ensure intermediate user directories have correct ownership
      systemd.tmpfiles.settings.preservation = {
        "/home/serephus/.config".d = { user = "serephus"; group = "users"; mode = "0755"; };
        "/home/serephus/.local".d = { user = "serephus"; group = "users"; mode = "0755"; };
        "/home/serephus/.local/share".d = { user = "serephus"; group = "users"; mode = "0755"; };
        "/home/serephus/.local/state".d = { user = "serephus"; group = "users"; mode = "0755"; };
        "/home/serephus/.cache".d = { user = "serephus"; group = "users"; mode = "0755"; };
      };
    };
  };
  den.aspects."tags-preservation" = { includes = [ den.aspects.preservation ]; };
}
