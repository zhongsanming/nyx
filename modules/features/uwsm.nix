{ den, ... }: {
  den.aspects.uwsm = {
    nixos = { programs.uwsm.enable = true; };
  };
}
