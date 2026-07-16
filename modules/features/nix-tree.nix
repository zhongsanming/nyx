{ den, ... }: {
  den.aspects.nix-tree = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-tree ];
    };
  };
}
