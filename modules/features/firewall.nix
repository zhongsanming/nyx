{ den, ... }: {
  den.aspects.firewall = {
    nixos = { networking.firewall.enable = false; };
  };
}
