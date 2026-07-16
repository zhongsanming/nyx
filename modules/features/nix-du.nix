{ den, ... }: {
  den.aspects.nix-du = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-du ];
    };
  };
}
