{ den, ... }: {
  den.aspects.wireless = {
    nixos = { networking.wireless.enable = true; };
  };
  den.aspects."tags-wireless" = { includes = [ den.aspects.wireless ]; };
}
