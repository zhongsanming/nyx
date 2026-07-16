{ den, ... }: {
  den.aspects.wget = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.wget ];
    };
  };
}
