{
  den.aspects.compsize = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.compsize
      ];
    };
    };
}
