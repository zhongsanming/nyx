{ den, ... }: {
  den.aspects.dufs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.dufs ];
    };
  };
  den.aspects."tags-dufs" = { includes = [ den.aspects.dufs ]; };
}
