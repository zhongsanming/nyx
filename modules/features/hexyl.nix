{ den, ... }: {
  den.aspects.hexyl = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.hexyl ];
    };
  };
}
