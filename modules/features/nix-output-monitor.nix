{ den, ... }: {
  den.aspects.nix-output-monitor = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-output-monitor ];
    };
  };
}
