{ den, ... }: {
  den.aspects.lsof = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.lsof ];
    };
  };
  den.aspects."tags-lsof" = { includes = [ den.aspects.lsof ]; };
}
