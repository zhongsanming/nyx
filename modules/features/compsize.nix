{ den, ... }: {
  den.aspects.compsize = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.compsize ];
    };
  };
}
