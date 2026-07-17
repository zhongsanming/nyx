{
  den.aspects.greetd = { host, user }:
    {
      nixos = {
    services.greetd.enable = true;
  };
};
    };
}
