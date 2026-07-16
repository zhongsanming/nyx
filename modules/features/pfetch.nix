{ den, ... }: {
  den.aspects.pfetch = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.pfetch-rs ];
    };
  };
  den.aspects."tags-pfetch" = { includes = [ den.aspects.pfetch ]; };
}
