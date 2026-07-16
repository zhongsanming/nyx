{ den, ... }: {
  den.aspects.nix-output-monitor = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.nix-output-monitor ];
    };
  };
  den.aspects."tags-nix-output-monitor" = { includes = [ den.aspects.nix-output-monitor ]; };
}
