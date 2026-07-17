{
  den.aspects.alacritty = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          fira-code
          # new way to add nerd fonts
          nerd-fonts.fira-code
          font-awesome
        ];
      };
    };
      homeManager = { pkgs, lib, ... }:
    {
      programs.alacritty = {
        enable = true;
        # this font have no korean or japanese variant?
        # set default fonts for alacritty
        settings.font.normal.family = "FiraCode Nerd Font Mono";
      };

      wayland.windowManager.hyprland.settings."$terminal" =
        lib.mkOverride 100 "${lib.getExe pkgs.alacritty}";
    };
    };
}
