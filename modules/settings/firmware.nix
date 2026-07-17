{
  den.aspects.firmware = { host, user }:
    {
      nixos = {
    # fwupd services to update firmware
    services.fwupd.enable = true;
    hardware.enableRedistributableFirmware = true;
  };
    };
}
