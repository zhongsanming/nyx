{ den, ... }: {
  den.aspects.ripgrep = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.ripgrep ]; };
  };
}
