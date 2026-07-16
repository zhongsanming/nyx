{ den, ... }: {
  den.aspects.comma = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.comma ];
    };
  };
}
