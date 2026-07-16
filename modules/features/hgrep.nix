{ den, ... }: {
  den.aspects.hgrep = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.hgrep ];
    };
  };
}
