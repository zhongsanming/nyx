{
  den.aspects.gnuplot = { host, user }:
    {
      homeManager = { pkgs, ... }:
    {
      home.packages = [
        pkgs.gnuplot
      ];
    };
    };
}
