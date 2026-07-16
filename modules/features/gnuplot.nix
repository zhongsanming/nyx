{ den, ... }: {
  den.aspects.gnuplot = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.gnuplot ];
    };
  };
  den.aspects."tags-gnuplot" = { includes = [ den.aspects.gnuplot ]; };
}
