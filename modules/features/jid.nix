{ den, ... }: {
  den.aspects.jid = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.jid ];
    };
  };
  den.aspects."tags-jid" = { includes = [ den.aspects.jid ]; };
}
