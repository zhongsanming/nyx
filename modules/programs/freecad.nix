{
  den.aspects.freecad = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.freecad
      ];
    };
    };
}
