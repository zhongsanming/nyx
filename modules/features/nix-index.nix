{ den, ... }: {
  den.aspects.nix-index = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-index ];
    };
  };
  den.aspects."tags-nix-index" = { includes = [ den.aspects.nix-index ]; };
}
