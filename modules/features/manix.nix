{ den, ... }: {
  den.aspects.manix = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.manix ];
    };
  };
}
