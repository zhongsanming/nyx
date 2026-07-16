{ den, ... }: {
  den.aspects.sudo = {
    nixos = {
      security.sudo.enable = false;
      security.sudo-rs.enable = true;
    };
  };
  den.aspects."tags-sudo" = { includes = [ den.aspects.sudo ]; };
}
