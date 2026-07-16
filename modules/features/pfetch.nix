{ den, ... }: {
  den.aspects.pfetch = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.pfetch-rs ];
    };
  };
}
