{ den, ... }: {
  den.aspects.nix-index = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-index ];
    };
  };
}
