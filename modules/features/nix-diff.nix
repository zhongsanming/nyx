{ den, ... }: {
  den.aspects.nix-diff = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-diff ];
    };
  };
}
