{
  den.aspects.bluetooth = { host, user }:
    {
      nixos = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
    };
}
