{
  den.aspects.duf = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.duf
      ];
    };
    };
}
