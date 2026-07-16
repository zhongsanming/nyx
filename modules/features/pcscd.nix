{ den, ... }: {
  den.aspects.pcscd = {
    nixos = { services.pcscd.enable = true; };
  };
  den.aspects."tags-pcscd" = { includes = [ den.aspects.pcscd ]; };
}
