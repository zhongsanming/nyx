{ den, ... }: {
  den.aspects.hexyl = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.hexyl ];
    };
  };
  den.aspects."tags-hexyl" = { includes = [ den.aspects.hexyl ]; };
}
