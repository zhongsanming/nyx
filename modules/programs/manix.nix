{
  den.aspects.manix = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.manix
      ];
    };
    };
}
