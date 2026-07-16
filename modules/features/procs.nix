{ den, ... }: {
  den.aspects.procs = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.procs ];
    };
  };
  den.aspects."tags-procs" = { includes = [ den.aspects.procs ]; };
}
