{ den, ... }: {
  den.aspects.obs = {
    homeManager = { pkgs, ... }: {
  programs.obs-studio.enable = true;
    };
  };
  den.aspects."tags-obs" = { includes = [ den.aspects.obs ]; };
}
