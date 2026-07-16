{ den, ... }: {
  den.aspects.chromium = {
    homeManager = { programs.chromium.enable = true; };
  };
}
