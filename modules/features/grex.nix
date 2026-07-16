{ den, ... }: {
  den.aspects.grex = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.grex ];
    };
  };
  den.aspects."tags-grex" = { includes = [ den.aspects.grex ]; };
}
