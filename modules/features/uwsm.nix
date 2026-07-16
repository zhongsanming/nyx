{ den, ... }: {
  den.aspects.uwsm = {
    nixos = { programs.uwsm.enable = true; };
  };
  den.aspects."tags-uwsm" = { includes = [ den.aspects.uwsm ]; };
}
