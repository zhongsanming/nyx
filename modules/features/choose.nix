{ den, ... }: {
  den.aspects.choose = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.choose ];
    };
  };
}
