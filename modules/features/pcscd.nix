{ den, ... }: {
  den.aspects.pcscd = {
    nixos = { services.pcscd.enable = true; };
  };
}
