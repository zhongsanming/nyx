{
  den.aspects.libinput = { host, user }:
    {
      nixos = {
    services.libinput.enable = true;
  };
    };
}
