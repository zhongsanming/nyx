{
  den.aspects.vial = { host, user }:
    {
      homeManager = { pkgs, ... }:
    {
      home.packages = [
        pkgs.vial
      ];
    };
    };
}
