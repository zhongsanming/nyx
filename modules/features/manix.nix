{ den, ... }: {
  den.aspects.manix = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.manix ];
    };
  };
  den.aspects."tags-manix" = { includes = [ den.aspects.manix ]; };
}
