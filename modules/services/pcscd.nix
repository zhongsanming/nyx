{
  den.aspects.pcscd = { host, user }:
    {
      nixos = {
    services.pcscd = {
      enable = true;
    };
  };
    };
}
