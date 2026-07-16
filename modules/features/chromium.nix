{ den, ... }: {
  den.aspects.chromium = {
    homeManager = { programs.chromium.enable = true; };
  };
  den.aspects."tags-chromium" = { includes = [ den.aspects.chromium ]; };
}
