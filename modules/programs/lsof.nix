{
  den.aspects.lsof = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.lsof
      ];
    };
    };
}
