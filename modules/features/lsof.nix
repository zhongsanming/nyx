{ den, ... }: {
  den.aspects.lsof = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.lsof ];
    };
  };
}
