{ den, ... }: {
  den.aspects.jid = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.jid ];
    };
  };
}
