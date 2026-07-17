{
  den.aspects.dufs = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.dufs
      ];
    };
    };
}
