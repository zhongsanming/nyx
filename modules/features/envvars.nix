{ den, ... }: {
  den.aspects.envvars = {
    nixos = { environment.sessionVariables.NIXOS_OZONE_WL = "1"; };
    homeManager = { home.sessionVariables.NIXOS_OZONE_WL = "1"; };
  };
  den.aspects."tags-envvars" = { includes = [ den.aspects.envvars ]; };
}
