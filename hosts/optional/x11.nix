{ pkgs, ... }:
{
  config = {
    # services.xserver = {
    #   enable = true;
    #   # desktopManager.plasma6.enable = true;
    #   # xkb = {
    #   #   variant = "norman";
    #   #   options = "ctrl:swapcaps";
    #   #   model = "at-translated-set-2-keyboard";
    #   # };
    #   # windowManager.dwm = {
    #   #   enable = true;
    #   #   package = pkgs.dwm.overrideAttrs (oldAttrs: {
    #   #     patches = [
    #   #       (pkgs.fetchpatch {
    #   #         url = "https://gist.githubusercontent.com/dearfl/cebdfa172fa7cd81a59bb844f2f33e2b/raw/4c49599f47fdefd9179105f432676980e1720a5f/dwm.patch";
    #   #         sha256 = "sha256-Z/WIgTaIIXXOWNqdVawkNUHi5uL3iov9KzC8HIBS3Pw=";
    #   #       })
    #   #     ];
    #   #     buildInputs = oldAttrs.buildInputs ++ [ pkgs.yajl ];
    #   #   });
    #   # };
    # };
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    environment.systemPackages = [
      pkgs.fuzzel
    ];
    programs = {
      # regreet.enable = true;
      # uwsm = {
      #   enable = true;
      #   waylandCompositors = {
      #     hyprland = {
      #       prettyName = "Hyprland";
      #       comment = "Hyprland compositor managed by UWSM";
      #       binPath = "/run/current-system/sw/bin/Hyprland";
      #     };
      #     # niri = {
      #     #   prettyName = "Niri";
      #     #   comment = "Niri compositor managed by UWSM";
      #     #   binPath = "/run/current-system/sw/bin/niri";
      #     # };
      #     # sway = {
      #     #   prettyName = "Sway";
      #     #   comment = "Sway compositor managed by UWSM";
      #     #   binPath = "/run/current-system/sw/bin/sway";
      #     # };
      #   };
      # };
      # hyprland = {
      #   enable = true;
      #   withUWSM = true;
      #   xwayland.enable = false;
      # };
      niri.enable = true;
      # sway.enable = true;
    };
  };
}
