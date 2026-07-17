{
  den.aspects.wget = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.wget
      ];
    };
    };
}
