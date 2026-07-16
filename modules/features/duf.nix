{ den, ... }: {
  den.aspects.duf = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.duf ];
    };
  };
  den.aspects."tags-duf" = { includes = [ den.aspects.duf ]; };
}
