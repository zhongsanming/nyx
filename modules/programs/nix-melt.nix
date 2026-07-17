{
  den.aspects.nix-melt = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-melt
      ];
    };
    };
}
