{
  den.aspects.kicad = { host, user }:
    {
      homeManager = { pkgs, ... }:
    {
      home.packages = [
        pkgs.kicad
      ];
    };
    };
}
