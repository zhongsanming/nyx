{
  den.aspects.comma = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.comma
      ];
    };
    };
}
