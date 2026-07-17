{
  den.aspects.xh = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.xh
      ];
    };
    };
}
