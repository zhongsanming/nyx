{
  den.aspects.wireless = { host, user }:
    {
      nixos = {
    networking.wireless.enable = true;
  };
    };
}
