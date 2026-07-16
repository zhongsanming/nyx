{ den, ... }: {
  den.aspects.xh = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.xh ];
    };
  };
}
