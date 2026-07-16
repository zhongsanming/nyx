{ den, ... }: {
  den.aspects.dufs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.dufs ];
    };
  };
}
