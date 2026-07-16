{ den, ... }: {
  den.aspects.users = {
    nixos = { users.mutableUsers = false; };
  };
  den.aspects."tags-users" = { includes = [ den.aspects.users ]; };
}
