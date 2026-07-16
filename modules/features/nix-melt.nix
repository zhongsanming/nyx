{ den, ... }: {
  den.aspects.nix-melt = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-melt ];
    };
  };
  den.aspects."tags-nix-melt" = { includes = [ den.aspects.nix-melt ]; };
}
