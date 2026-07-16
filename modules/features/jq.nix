{ den, ... }: {
  den.aspects.jq = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.jq ]; };
  };
  den.aspects."tags-jq" = { includes = [ den.aspects.jq ]; };
}
