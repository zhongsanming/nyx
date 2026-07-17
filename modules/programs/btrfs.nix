{
  den.aspects.btrfs = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.btrfs-progs
      ];
    };
    };
}
