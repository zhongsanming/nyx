{ den, ... }: {
  den.aspects.vial = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.vial ];
    };
  };
}
