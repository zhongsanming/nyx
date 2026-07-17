{
  den.aspects.hexyl = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.hexyl
      ];
    };
    };
}
