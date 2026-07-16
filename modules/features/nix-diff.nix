{ den, ... }: {
  den.aspects.nix-diff = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-diff ];
    };
  };
  den.aspects."tags-nix-diff" = { includes = [ den.aspects.nix-diff ]; };
}
