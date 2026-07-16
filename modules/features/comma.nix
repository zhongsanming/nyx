{ den, ... }: {
  den.aspects.comma = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.comma ];
    };
  };
  den.aspects."tags-comma" = { includes = [ den.aspects.comma ]; };
}
