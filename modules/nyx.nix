# Host "nyx" aspect: composes features and host-specific config
{ inputs, ... }: {
  den.aspects.nyx = {
    includes = [
      # core system
      den.aspects.nix den.aspects.nix-opinionated den.aspects.nix-mirror
      den.aspects.users den.aspects.root den.aspects.sudo
      den.aspects.firewall den.aspects.i18n den.aspects.envvars
      den.aspects.constants den.aspects.doc
      # CLI tools
      den.aspects.fish den.aspects.git den.aspects.helix
      den.aspects.direnv den.aspects.tmux den.aspects.bat
      den.aspects.yazi den.aspects.eza den.aspects.bottom
      den.aspects.tealdeer den.aspects.fd den.aspects.ripgrep
      den.aspects.jq den.aspects.fonts den.aspects.pcscd
      # desktop
      den.aspects.pipewire den.aspects.uwsm
      den.aspects.hyprland den.aspects.niri den.aspects.greetd
      den.aspects.alacritty den.aspects.waybar den.aspects.wpaperd
      den.aspects.bibata den.aspects.mako den.aspects.chromium
      den.aspects.fcitx5 den.aspects.hypridle den.aspects.hyprlock
      den.aspects.qutebrowser
      # laptop
      den.aspects.bluetooth den.aspects.wireless
      den.aspects.glwifi den.aspects.libinput
      # services
      den.aspects.v2ray
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

      # disko: nvme0n1 disk config
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
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = let
                  mkSubvol = name: {
                    mountpoint = "/${name}";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                in {
                  "@root" = mkSubvol "";
                  "@home" = mkSubvol "home";
                  "@nix" = mkSubvol "nix";
                  "@var" = mkSubvol "var";
                  "@tmp" = mkSubvol "tmp";
                  "@persist" = mkSubvol "persist";
                  "@snapshot" = {
                    mountpoint = "/.snapshot";
                  };
                  "@swap" = {
                    mountpoint = "/.swapvol";
                    swap = {
                      swapfile = {
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
