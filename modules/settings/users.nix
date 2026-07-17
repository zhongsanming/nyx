{
  den.aspects.users = { host, user }:
    {
      nixos = {
    users.mutableUsers = false;
  };
    };
}
