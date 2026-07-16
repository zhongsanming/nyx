{ den, lib, pkgs, ... }: {
  den.aspects.wofi = {
    homeManager = {
      programs.wofi.enable = true;
      wayland.windowManager.hyprland.settings."$menu" =
        lib.mkOverride 100 "${lib.getExe pkgs.wofi} --show drun";
    };
  };
  den.aspects."tags-wofi" = { includes = [ den.aspects.wofi ]; };
}
