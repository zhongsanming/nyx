{ den, ... }: {
  den.aspects.ripgrep = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.ripgrep ]; };
  };
  den.aspects."tags-ripgrep" = { includes = [ den.aspects.ripgrep ]; };
}
