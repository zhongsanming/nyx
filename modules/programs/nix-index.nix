{
  den.aspects.nix-index = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-index
      ];
    };
    };
}
