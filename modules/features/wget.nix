{ den, ... }: {
  den.aspects.wget = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.wget ];
    };
  };
  den.aspects."tags-wget" = { includes = [ den.aspects.wget ]; };
}
