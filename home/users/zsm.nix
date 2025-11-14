_: {
  imports = [
    # unmanaged packages
    ../modules/cli-packages.nix

    # ../modules/git.nix
    ../modules/ssh.nix
    ../modules/helix.nix
    ../modules/fish.nix
    ../modules/tmux.nix
    # ../modules/direnv.nix
    ../modules/yazi.nix

    # ../modules/gui-packages.nix
    ../modules/fontconfig.nix

    ../modules/alacritty.nix
    ../modules/cursor.nix
    ../modules/copyq.nix
    ../modules/qutebrowser.nix
    ../modules/dunst.nix
    ../modules/fcitx5.nix

    ../modules/wayland-work.nix
  ];

  config = {

    home.packages = [
      pkgs.zathura
      pkgs.slurp
      pkgs.grim
      pkgs.imv
      pkgs.alacritty
      pkgs.kitty
      pkgs.kdePackages.konsole
      pkgs.ghostty
      pkgs.st
      pkgs.wezterm
    ];

    programs = {
      mpv.enable = true;
    };

    home = {
      username = "zsm";
      homeDirectory = "/home/zsm";
      stateVersion = "25.05";
      sessionVariables.NIXOS_OZONE_WL = "1";
    };

    # let home manager manage itself
    programs.home-manager.enable = true;
  };
}
