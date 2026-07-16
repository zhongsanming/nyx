{ den, ... }: {
  den.aspects.bat = {
    nixos = { programs.bat.enable = true; };
    homeManager = { programs.bat.enable = true; };
  };
}
