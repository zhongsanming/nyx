{ den, ... }: {
  den.aspects.zola = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.zola ];
    };
  };
  den.aspects."tags-zola" = { includes = [ den.aspects.zola ]; };
}
