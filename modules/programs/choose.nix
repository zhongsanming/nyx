{
  den.aspects.choose = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.choose
      ];
    };
    };
}
