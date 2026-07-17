{
  den.aspects.nix-diff = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-diff
      ];
    };
    };
}
