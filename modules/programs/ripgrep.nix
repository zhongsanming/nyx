{
  den.aspects.ripgrep = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.ripgrep
      ];
    };
    };
}
