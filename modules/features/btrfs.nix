{ den, ... }: {
  den.aspects.btrfs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.btrfs-progs ];
    };
  };
  den.aspects."tags-btrfs" = { includes = [ den.aspects.btrfs ]; };
}
