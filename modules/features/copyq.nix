{ den, ... }: {
  den.aspects.copyq = {
    homeManager = {
      services.copyq = {
        enable = true;
        forceXWayland = false;
      };
    };
  };
}
