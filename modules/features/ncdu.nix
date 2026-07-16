{ den, ... }: {
  den.aspects.ncdu = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.ncdu ];
    };
  };
  den.aspects."tags-ncdu" = { includes = [ den.aspects.ncdu ]; };
}
