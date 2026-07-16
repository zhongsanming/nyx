{ den, ... }: {
  den.aspects.vial = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.vial ];
    };
  };
  den.aspects."tags-vial" = { includes = [ den.aspects.vial ]; };
}
