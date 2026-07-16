{ den, ... }: {
  den.aspects.rage = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.rage ];
    };
  };
}
