{ den, ... }: {
  den.aspects.you-get = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.you-get ];
    };
  };
  den.aspects."tags-you-get" = { includes = [ den.aspects.you-get ]; };
}
