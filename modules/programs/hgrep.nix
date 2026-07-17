{
  den.aspects.hgrep = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.hgrep
      ];
    };
    };
}
