{ den, ... }: {
  den.aspects.duf = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.duf ];
    };
  };
}
