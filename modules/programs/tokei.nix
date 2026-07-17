{
  den.aspects.tokei = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.tokei
      ];
    };
    };
}
