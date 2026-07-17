{
  den.aspects.you-get = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.you-get
      ];
    };
    };
}
