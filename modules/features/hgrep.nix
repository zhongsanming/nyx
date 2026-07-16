{ den, ... }: {
  den.aspects.hgrep = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.hgrep ];
    };
  };
  den.aspects."tags-hgrep" = { includes = [ den.aspects.hgrep ]; };
}
