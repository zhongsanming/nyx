{ den, ... }: {
  den.aspects.copyq = {
    homeManager = {
      services.copyq = {
        enable = true;
        forceXWayland = false;
      };
    };
  };
  den.aspects."tags-copyq" = { includes = [ den.aspects.copyq ]; };
}
