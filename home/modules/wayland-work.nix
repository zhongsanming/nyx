_: {
  imports = [
    ./waybar.nix
    ./hyprland-work.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./wpaperd.nix
  ];
  config = {
    programs = {
      # we want some app launcher, default wofi is good enough
      wofi.enable = true;
    };
  };
}

