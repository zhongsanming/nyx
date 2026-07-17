{
  den.aspects.zola = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.zola
      ];
    };
    };
}
