{
  den.aspects.jid = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.jid
      ];
    };
    };
}
