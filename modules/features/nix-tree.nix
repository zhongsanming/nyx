{ den, ... }: {
  den.aspects.nix-tree = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-tree ];
    };
  };
  den.aspects."tags-nix-tree" = { includes = [ den.aspects.nix-tree ]; };
}
