{
  den.aspects.ykman = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.yubikey-manager
      ];
    };
    };
}
