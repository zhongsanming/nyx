{
  den.aspects.uwsm = { host, user }:
    {
      nixos = {
    programs.uwsm.enable = true;
  };
    };
}
