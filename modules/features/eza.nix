{ den, ... }: {
  den.aspects.eza = {
    homeManager = { programs.eza.enable = true; };
  };
  den.aspects."tags-eza" = { includes = [ den.aspects.eza ]; };
}
