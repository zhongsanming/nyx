{ den, ... }: {
  den.aspects.freecad = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.freecad ];
    };
  };
  den.aspects."tags-freecad" = { includes = [ den.aspects.freecad ]; };
}
