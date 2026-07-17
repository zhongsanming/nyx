{
  den.aspects.nix-tree = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-tree
      ];
    };
    };
}
