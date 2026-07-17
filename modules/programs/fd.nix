{
  den.aspects.fd = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.fd
      ];
    };
    };
}
