{
  den.aspects.ncdu = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.ncdu
      ];
    };
    };
}
