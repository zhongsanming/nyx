{ den, ... }: {
  den.aspects.nix-du = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-du ];
    };
  };
  den.aspects."tags-nix-du" = { includes = [ den.aspects.nix-du ]; };
}
