{ den, ... }: {
  den.aspects.grex = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.grex ];
    };
  };
}
