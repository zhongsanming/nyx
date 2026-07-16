{ den, ... }: {
  den.aspects.libinput = {
    nixos = { services.libinput.enable = true; };
  };
  den.aspects."tags-libinput" = { includes = [ den.aspects.libinput ]; };
}
