{ den, ... }: {
  den.aspects.bottom = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.bottom ]; };
    homeManager = { programs.bottom.enable = true; };
  };
}
