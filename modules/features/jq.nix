{ den, ... }: {
  den.aspects.jq = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.jq ]; };
  };
}
