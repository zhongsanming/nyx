{ den, ... }: {
  den.aspects.gnuplot = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.gnuplot ];
    };
  };
}
