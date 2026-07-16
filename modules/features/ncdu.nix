{ den, ... }: {
  den.aspects.ncdu = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.ncdu ];
    };
  };
}
