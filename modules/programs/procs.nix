{
  den.aspects.procs = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.procs
      ];
    };
    };
}
