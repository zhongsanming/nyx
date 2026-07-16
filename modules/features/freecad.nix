{ den, ... }: {
  den.aspects.freecad = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.freecad ];
    };
  };
}
