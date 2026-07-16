{ den, ... }: {
  den.aspects.fd = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.fd ]; };
  };
}
