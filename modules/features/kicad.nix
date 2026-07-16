{ den, ... }: {
  den.aspects.kicad = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.kicad ];
    };
  };
  den.aspects."tags-kicad" = { includes = [ den.aspects.kicad ]; };
}
