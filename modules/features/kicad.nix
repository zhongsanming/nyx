{ den, ... }: {
  den.aspects.kicad = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.kicad ];
    };
  };
}
