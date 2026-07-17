# Laptop profile: adds laptop-specific hardware support.
{ den }:
{
  den.aspects.laptop = {
    includes = [
      den.aspects.desktop

      # services
      den.aspects.libinput

      # settings
      den.aspects.bluetooth
      den.aspects.wireless
    ];
  };
}
