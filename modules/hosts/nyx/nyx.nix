# Host nyx aspect.
# Includes laptop profile, ThinkPad hardware, v2client, and host-specific settings.
{ den, inputs, ... }:
{
  den.aspects.nyx = {
    includes = [
      den.aspects.laptop
      den.aspects.v2client
    ];

    nixos =
      { config, ... }:
      {
        imports = [
          inputs.hardware.nixosModules.lenovo-thinkpad-x1-7th-gen
        ];

        nixpkgs.hostPlatform = "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = true;

        networking.hostName = "nyx";
        time.timeZone = "Asia/Shanghai";

        boot.initrd.availableKernelModules = [
          "xhci_pci"
          "nvme"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        boot.kernelModules = [ "kvm-intel" ];

        # systemd-boot bootloader
        boot.loader = {
          systemd-boot = {
            enable = true;
            configurationLimit = 10;
          };
          efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = config.constants.efiMountpoint;
          };
        };

        # Nix settings
        nix = {
          channel.enable = false;
          gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 1w";
          };
          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];
            auto-optimise-store = true;
            trusted-users = [ "@wheel" ];
            # USTC mirror
            substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
            trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
          };
        };

        # Opinionated Nix settings
        nix.daemonCPUSchedPolicy = "batch";
        nix.daemonIOSchedClass = "idle";
        nix.daemonIOSchedPriority = 7;

        # GL wifi
        networking.wireless.networks."GL-X3000-e11d".psk = "goodlife";

        # Vaultix host key
        vaultix.settings.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKXvckmMZo48If0O1qTTnQRjMeiARAp7sfWNDbX8p6Eu";

        # Disko disk config
        disko.devices = {
          disk.nvme0n1 = {
            type = "disk";
            device = "/dev/nvme0n1";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  size = "512M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = config.constants.efiMountpoint;
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "filesystem";
                    format = "btrfs";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };
  };
}
