{ den, ... }: {
  den.aspects.btrfs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.btrfs-progs ];
    };
  };
}
