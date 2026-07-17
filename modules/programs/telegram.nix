{
  den.aspects.telegram = { host, user }:
    {
      homeManager = { pkgs, ... }:
    {
      home.packages = [
        pkgs.telegram-desktop
      ];
    };
    };
}
