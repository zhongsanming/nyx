# Minimal aspect: base system settings applicable to every NixOS host
{ den, ... }: {
  den.aspects.minimal = {
    nixos = {
      # locale
      i18n.defaultLocale = "en_US.UTF-8";

      # nix settings
      nix = {
        channel.enable = false;
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 1w";
        };
        settings = {
          experimental-features = [ "nix-command" "flakes" ];
          auto-optimise-store = true;
          trusted-users = [ "@wheel" ];
        };
      };

      # nix opinionated: registry/nixPath from flake inputs
      nix.settings.flake-registry = "";
      nix.nixPath = [ ];

      # USTC mirror
      nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
      nix.settings.trusted-substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];

      # users
      users.mutableUsers = false;

      # root password
      users.users.root.hashedPassword = "$y$j9T$vmrHUvAuXfmw23ZWlTAFy0$pl4hBYuUzxYPoo7Z3IAPloJ.AZN0jZDeIKgmY/qspf0";

      # sudo-rs
      security.sudo.enable = false;
      security.sudo-rs.enable = true;

      # firewall - disabled for now
      networking.firewall.enable = false;

      # environment variables
      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      # constants
      constants.efiMountpoint = "/boot/efi";
    };

    homeManager = {
      # let home-manager manage itself
      programs.home-manager.enable = true;

      # environment variables
      home.sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}
