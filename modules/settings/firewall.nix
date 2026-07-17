{
  den.aspects.firewall = { host, user }:
    {
      nixos = {
    networking.firewall.enable = false;
  };
    };
}
