{
  den.aspects.age-plugin-yubikey = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.age-plugin-yubikey
      ];
    };
    };
}
