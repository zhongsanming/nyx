{
  den.aspects.copyq = { host, user }:
    {
      homeManager = {
    services.copyq = {
      enable = true;
      forceXWayland = false;
    };
  };
    };
}
