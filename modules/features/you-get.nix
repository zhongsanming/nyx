{ den, ... }: {
  den.aspects.you-get = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.you-get ];
    };
  };
}
