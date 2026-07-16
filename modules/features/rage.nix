{ den, ... }: {
  den.aspects.rage = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.rage ];
    };
  };
  den.aspects."tags-rage" = { includes = [ den.aspects.rage ]; };
}
