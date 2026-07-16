{ den, ... }: {
  den.aspects.compsize = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.compsize ];
    };
  };
  den.aspects."tags-compsize" = { includes = [ den.aspects.compsize ]; };
}
