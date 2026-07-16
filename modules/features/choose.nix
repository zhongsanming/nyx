{ den, ... }: {
  den.aspects.choose = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.choose ];
    };
  };
  den.aspects."tags-choose" = { includes = [ den.aspects.choose ]; };
}
