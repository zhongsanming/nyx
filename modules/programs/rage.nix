{
  den.aspects.rage = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.rage
      ];
    };
    };
}
