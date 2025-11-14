_: {
  imports = [
    ../minimal
    ../../users/zsm.nix

    ../optional/systemd-boot.nix

    ../optional/chromium.nix

    ../optional/gui.nix
    ../optional/nix-mirror.nix
    ../optional/nix-opinionated.nix
  ];
}
