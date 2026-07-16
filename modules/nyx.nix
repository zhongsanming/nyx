# Host "nyx" aspect: composes features and host-specific config
{ inputs, ... }: {
  den.aspects.nyx = {
    includes = [
      # preservation
      den.aspects."tags-preservation"
      # core system
      den.aspects."tags-nix" den.aspects."tags-nix-opinionated" den.aspects."tags-nix-mirror"
      den.aspects."tags-users" den.aspects."tags-root" den.aspects."tags-sudo"
      den.aspects."tags-firewall" den.aspects."tags-i18n" den.aspects."tags-envvars"
      den.aspects."tags-constants" den.aspects."tags-doc" den.aspects."tags-firmware"
      den.aspects."tags-ssh"
      # CLI tools
      den.aspects."tags-fish" den.aspects."tags-git" den.aspects."tags-helix"
      den.aspects."tags-direnv" den.aspects."tags-tmux" den.aspects."tags-bat"
      den.aspects."tags-yazi" den.aspects."tags-eza" den.aspects."tags-bottom"
      den.aspects."tags-tealdeer" den.aspects."tags-fd" den.aspects."tags-ripgrep"
      den.aspects."tags-jq" den.aspects."tags-fonts" den.aspects."tags-pcscd"
      den.aspects."tags-age-plugin-yubikey" den.aspects."tags-btrfs"
      den.aspects."tags-choose" den.aspects."tags-comma" den.aspects."tags-compsize"
      den.aspects."tags-difftastic" den.aspects."tags-duf" den.aspects."tags-dufs"
      den.aspects."tags-git-filter-repo" den.aspects."tags-gitui" den.aspects."tags-grex"
      den.aspects."tags-hexyl" den.aspects."tags-hgrep" den.aspects."tags-jid"
      den.aspects."tags-lsof" den.aspects."tags-manix" den.aspects."tags-ncdu"
      den.aspects."tags-nix-diff" den.aspects."tags-nix-du" den.aspects."tags-nix-index"
      den.aspects."tags-nix-melt" den.aspects."tags-nix-output-monitor" den.aspects."tags-nix-tree"
      den.aspects."tags-pfetch" den.aspects."tags-procs" den.aspects."tags-rage"
      den.aspects."tags-tokei" den.aspects."tags-wget" den.aspects."tags-xh"
      den.aspects."tags-ykman" den.aspects."tags-you-get" den.aspects."tags-yt-dlp"
      den.aspects."tags-zola"
      # desktop
      den.aspects."tags-pipewire" den.aspects."tags-uwsm"
      den.aspects."tags-hyprland" den.aspects."tags-niri" den.aspects."tags-greetd"
      den.aspects."tags-alacritty" den.aspects."tags-waybar" den.aspects."tags-wpaperd"
      den.aspects."tags-bibata" den.aspects."tags-mako" den.aspects."tags-chromium"
      den.aspects."tags-fcitx5" den.aspects."tags-hypridle" den.aspects."tags-hyprlock"
      den.aspects."tags-qutebrowser"
      den.aspects."tags-blender" den.aspects."tags-copyq" den.aspects."tags-freecad"
      den.aspects."tags-gh" den.aspects."tags-gnuplot" den.aspects."tags-kicad"
      den.aspects."tags-mpv" den.aspects."tags-obs" den.aspects."tags-swayimg"
      den.aspects."tags-telegram" den.aspects."tags-vial" den.aspects."tags-wofi"
      den.aspects."tags-zathura"
      # laptop
      den.aspects."tags-bluetooth" den.aspects."tags-wireless"
      den.aspects."tags-glwifi" den.aspects."tags-libinput"
      # services
      den.aspects."tags-v2ray"
    ];

    nixos = { pkgs, lib, config, ... }: {
      imports = [
        inputs.disko.nixosModules.disko
        inputs.vaultix.nixosModules.default
      ];

      # hostname
      networking.hostName = "nyx";

      # timezone
      time.timeZone = "Asia/Shanghai";

      # system state
      system.stateVersion = "25.11";

      # vaultix
      services.userborn.enable = true;
      vaultix.settings.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKXvckmMZo48If0O1qTTnQRjMeiARAp7sfWNDbX8p6Eu";

      # bootloader
      boot.loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
        };
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot/efi";
        };
      };

      # hardware config
      boot = {
        initrd.availableKernelModules = [
          "xhci_pci"
          "nvme"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        kernelModules = [ "kvm-intel" ];
      };
      nixpkgs.hostPlatform = "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = true;

      # tmpfs root - ephemeral root filesystem across reboots
      fileSystems."/" = {
        device = "tmpfs";
        fsType = "tmpfs";
        options = [ "defaults" "size=4G" "mode=755" ];
      };

      # disko: nvme0n1 disk config (btrfs subvolumes)
      # LUKS initrd config for YubiKey FIDO2 unlock
      # After first boot, enroll YubiKey:
      #   systemd-cryptenroll --fido2-device=auto /dev/nvme0n1p2
      boot.initrd.luks.devices."crypted" = {
        device = "/dev/nvme0n1p2";
        allowDiscards = true;
      };

      disko.devices.disk.main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "1024M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@home" = {
                      mountpoint = "/persist/home";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@var" = {
                      mountpoint = "/persist/var";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile = {
                        size = "20480M";
                        path = "swapfile";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };

    };
  };
}
