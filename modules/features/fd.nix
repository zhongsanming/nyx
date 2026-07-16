{ den, ... }: {
  den.aspects.fd = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.fd ]; };
  };
  den.aspects."tags-fd" = { includes = [ den.aspects.fd ]; };
}
