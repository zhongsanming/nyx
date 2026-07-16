{ den, ... }: {
  den.aspects.nix-melt = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-melt ];
    };
  };
}
