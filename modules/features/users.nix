{ den, ... }: {
  den.aspects.users = {
    nixos = { users.mutableUsers = false; };
  };
}
