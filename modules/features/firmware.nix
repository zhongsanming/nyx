{ den, ... }: {
  den.aspects.firmware = {
    nixos = {
      services.fwupd.enable = true;
      hardware.enableRedistributableFirmware = true;
    };
  };
  den.aspects."tags-firmware" = { includes = [ den.aspects.firmware ]; };
}
