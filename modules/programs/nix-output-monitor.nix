{
  den.aspects.nix-output-monitor = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nix-output-monitor
      ];
    };
    };
}
