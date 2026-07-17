{
  den.aspects.chromium = { host, user }:
    {
      homeManager = {
    programs.chromium.enable = true;
  };
    };
}
