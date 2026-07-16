{ den, ... }: {
  den.aspects.xh = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.xh ];
    };
  };
  den.aspects."tags-xh" = { includes = [ den.aspects.xh ]; };
}
