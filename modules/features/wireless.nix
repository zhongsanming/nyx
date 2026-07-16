{ den, ... }: {
  den.aspects.wireless = {
    nixos = { networking.wireless.enable = true; };
  };
}
