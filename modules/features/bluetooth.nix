{ den, ... }: {
  den.aspects.bluetooth = {
    nixos = {
      hardware.bluetooth = { enable = true; powerOnBoot = true; };
      services.blueman.enable = true;
    };
  };
  den.aspects."tags-bluetooth" = { includes = [ den.aspects.bluetooth ]; };
}
