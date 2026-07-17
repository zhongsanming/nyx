# Desktop profile: GUI tools and window managers.
{ den }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.basic

      # programs
      den.aspects.alacritty
      den.aspects.blender
      den.aspects.chromium
      den.aspects.copyq
      den.aspects.fcitx5
      den.aspects.freecad
      den.aspects.gnuplot
      den.aspects.hypridle
      den.aspects.hyprland
      den.aspects.hyprlock
      den.aspects.kicad
      den.aspects.mpv
      den.aspects.niri
      den.aspects.obs
      den.aspects.qutebrowser
      den.aspects.swayimg
      den.aspects.telegram
      den.aspects.vial
      den.aspects.waybar
      den.aspects.zathura

      # services
      den.aspects.mako
      den.aspects.pipewire
      den.aspects.wpaperd

      # settings
      den.aspects.bibata
    ];
  };
}
