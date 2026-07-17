{
  den.aspects.nix-du = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-du
      ];
    };
    };
}
