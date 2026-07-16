{ den, ... }: {
  den.aspects.procs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.procs ];
    };
  };
}
