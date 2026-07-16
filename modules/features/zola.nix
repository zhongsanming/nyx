{ den, ... }: {
  den.aspects.zola = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.zola ];
    };
  };
}
