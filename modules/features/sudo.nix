{ den, ... }: {
  den.aspects.sudo = {
    nixos = {
      security.sudo.enable = false;
      security.sudo-rs.enable = true;
    };
  };
}
