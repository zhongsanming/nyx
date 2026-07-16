{ den, ... }: {
  den.aspects.firewall = {
    nixos = { networking.firewall.enable = false; };
  };
  den.aspects."tags-firewall" = { includes = [ den.aspects.firewall ]; };
}
