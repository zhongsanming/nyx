{
  den.aspects.grex = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.grex
      ];
    };
    };
}
