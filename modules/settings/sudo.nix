{
  den.aspects.sudo = { host, user }:
    {
      nixos = {
    # use sudo-rs
    security.sudo.enable = false;
    security.sudo-rs.enable = true;
  };
    };
}
